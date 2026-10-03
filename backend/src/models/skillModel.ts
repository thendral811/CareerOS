import pool from "../config/database";

export interface Skill {
  id?: number;
  name: string;
  category: string;
  subcategory: string;
}

export async function createSkill(
  skill: Skill
): Promise<Skill> {
  const result = await pool.query(
    `
    INSERT INTO skills
      (name, category, subcategory)
    VALUES
      ($1, $2, $3)
    ON CONFLICT (name)
    DO UPDATE SET
      category = EXCLUDED.category,
      subcategory = EXCLUDED.subcategory
    RETURNING *
    `,
    [
      skill.name,
      skill.category,
      skill.subcategory,
    ]
  );

  return result.rows[0];
}

export async function getSkillByName(
  name: string
): Promise<Skill | null> {
  const result = await pool.query(
    `
    SELECT *
    FROM skills
    WHERE LOWER(name) = LOWER($1)
    `,
    [name]
  );

  return result.rows[0] || null;
}

export async function addUserSkill(
  userId: number,
  skillId: number,
  source: string = "resume"
) {
  await pool.query(
    `
    INSERT INTO user_skills
      (user_id, skill_id, source)
    VALUES
      ($1, $2, $3)
    ON CONFLICT (user_id, skill_id)
    DO UPDATE SET
      source = EXCLUDED.source
    `,
    [
      userId,
      skillId,
      source,
    ]
  );
}

export async function getUserSkills(
  userId: number
) {
  const result = await pool.query(
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
    ORDER BY s.category, s.name
    `,
    [userId]
  );

  return result.rows;
}