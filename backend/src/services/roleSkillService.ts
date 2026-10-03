import pool from "../config/database";
import {
  addRoleSkill,
  getRequiredSkillsForRole,
} from "../models/roleSkillModel";

export async function saveRoleSkill(
  roleId: number,
  skillName: string,
  category: string,
  subcategory: string,
  importance: number
) {
  /*
    Find the skill first.
    If it doesn't exist, create it.
  */

  let skillResult = await pool.query(
    `
    SELECT *
    FROM skills
    WHERE LOWER(name) = LOWER($1)
    `,
    [skillName]
  );

  let skill = skillResult.rows[0];

  if (!skill) {
    skillResult = await pool.query(
      `
      INSERT INTO skills
        (name, category, subcategory)
      VALUES
        ($1, $2, $3)
      RETURNING *
      `,
      [
        skillName,
        category,
        subcategory,
      ]
    );

    skill = skillResult.rows[0];
  }

  return await addRoleSkill(
    roleId,
    skill.id,
    importance
  );
}

export async function getRoleSkills(
  roleId: number
) {
  return await getRequiredSkillsForRole(roleId);
}


/*
  Find the career role using its name.
*/
export async function getRoleByName(
  roleName: string
) {
  const result = await pool.query(
    `
    SELECT
      id,
      name,
      description
    FROM career_roles
    WHERE LOWER(name) = LOWER($1)
    LIMIT 1
    `,
    [roleName]
  );

  return result.rows[0] || null;
}


/*
  Get required skills using the role name.
*/
export async function getRequiredSkillsByRoleName(
  roleName: string
) {
  const role = await getRoleByName(roleName);

  if (!role) {
    return null;
  }

  const skills = await getRoleSkills(role.id);

  return {
    role,
    skills,
  };
}
