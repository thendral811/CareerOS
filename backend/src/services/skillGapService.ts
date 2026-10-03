import pool from "../config/database";

export async function getSkillGapForUser(
  userId: number
) {
  /*
   * 1. Get the user's target role
   *    from their career profile.
   */
  const profileResult = await pool.query(
    `
    SELECT target_role
    FROM career_profiles
    WHERE user_id = $1
    `,
    [userId]
  );

  if (profileResult.rows.length === 0) {
    throw new Error("Career profile not found");
  }

  const targetRole =
    profileResult.rows[0].target_role;

  if (!targetRole) {
    throw new Error("Target role is not set");
  }

  /*
   * 2. Find the target role
   *    in career_roles.
   */
  const roleResult = await pool.query(
    `
    SELECT
      id,
      name,
      description
    FROM career_roles
    WHERE LOWER(name) = LOWER($1)
    LIMIT 1
    `,
    [targetRole]
  );

  if (roleResult.rows.length === 0) {
    throw new Error(
      `Role '${targetRole}' is not available in CareerOS`
    );
  }

  const role = roleResult.rows[0];

  /*
   * 3. Get skills required for
   *    the selected career role.
   *
   *    New system:
   *    role_skills → skills
   */
  const requirementsResult =
    await pool.query(
      `
      SELECT
        s.id,
        s.name,
        s.category,
        s.subcategory,
        rs.importance
      FROM role_skills rs

      JOIN skills s
        ON rs.skill_id = s.id

      WHERE rs.role_id = $1

      ORDER BY
        rs.importance DESC,
        s.category,
        s.name
      `,
      [role.id]
    );

  /*
   * 4. Get skills extracted
   *    from the user's resume.
   */
  const userSkillsResult =
    await pool.query(
      `
      SELECT
        s.id,
        s.name,
        s.category,
        s.subcategory,
        us.source
      FROM user_skills us

      JOIN skills s
        ON us.skill_id = s.id

      WHERE us.user_id = $1

      ORDER BY
        s.category,
        s.name
      `,
      [userId]
    );

  const userSkills =
    userSkillsResult.rows;

  /*
   * 5. Create a normalized set
   *    of the user's skills.
   *
   *    Example:
   *    "Python" === "python"
   */
  const userSkillNames =
    new Set(
      userSkills.map(
        (skill) =>
          skill.name
            .trim()
            .toLowerCase()
      )
    );

  /*
   * 6. Compare required skills
   *    against user's skills.
   */
  const matchedSkills = [];
  const missingSkills = [];

  for (
    const requirement
    of requirementsResult.rows
  ) {
    const normalizedName =
      requirement.name
        .trim()
        .toLowerCase();

    const skillData = {
      id: requirement.id,
      name: requirement.name,
      category:
        requirement.category,
      subcategory:
        requirement.subcategory,
      importance:
        requirement.importance,
    };

    if (
      userSkillNames.has(
        normalizedName
      )
    ) {
      matchedSkills.push(
        skillData
      );
    } else {
      missingSkills.push(
        skillData
      );
    }
  }

  /*
   * 7. Calculate readiness.
   *
   * This is simply:
   *
   * matched required skills
   * -----------------------
   * total required skills
   *
   * It is not an assessment of
   * actual proficiency.
   */
  const totalRequiredSkills =
    requirementsResult.rows.length;

  const matchedCount =
    matchedSkills.length;

  const missingCount =
    missingSkills.length;

  const readinessPercentage =
    totalRequiredSkills === 0
      ? 0
      : Math.round(
          (matchedCount /
            totalRequiredSkills) *
            100
        );

  /*
   * 8. Return the complete
   *    Skill Gap result.
   */
  return {
    targetRole: role.name,

    roleId: role.id,

    roleDescription:
      role.description,

    totalRequiredSkills,

    matchedCount,

    missingCount,

    readinessPercentage,

    matchedSkills,

    missingSkills,

    currentSkills: userSkills,
  };
}