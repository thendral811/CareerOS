import pool from "../config/database";

export async function getResourcesForSkills(
  skillNames: string[]
) {
  if (skillNames.length === 0) {
    return [];
  }

  const result = await pool.query(
    `
    SELECT
      s.id AS skill_id,
      s.name AS skill_name,
      s.category,
      s.subcategory,

      r.id AS resource_id,
      r.title,
      r.provider,
      r.url,
      r.resource_type,
      r.difficulty,
      r.estimated_hours,
      r.description,

      sr.priority

    FROM skill_resources sr

    JOIN skills s
      ON sr.skill_id = s.id

    JOIN learning_resources r
      ON sr.resource_id = r.id

    WHERE LOWER(s.name) = ANY($1::text[])

    ORDER BY
      sr.priority ASC,
      s.name ASC,
      r.estimated_hours ASC
    `,
    [
      skillNames.map(
        (skill) => skill.toLowerCase()
      ),
    ]
  );

  return result.rows;
}