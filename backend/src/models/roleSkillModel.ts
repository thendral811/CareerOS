import pool from "../config/database";

export interface RoleSkill {
  id?: number;
  role_id: number;
  skill_id: number;
  importance: number;
}

export async function addRoleSkill(
  roleId: number,
  skillId: number,
  importance: number = 3
) {
  const result = await pool.query(
    `
    INSERT INTO role_skills
      (role_id, skill_id, importance)
    VALUES
      ($1, $2, $3)
    ON CONFLICT (role_id, skill_id)
    DO UPDATE SET
      importance = EXCLUDED.importance
    RETURNING *
    `,
    [roleId, skillId, importance]
  );

  return result.rows[0];
}

export async function getRequiredSkillsForRole(
  roleId: number
) {
  const result = await pool.query(
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
    [roleId]
  );

  return result.rows;
}
