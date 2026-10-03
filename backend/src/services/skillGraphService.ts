import pool from "../config/database";

export async function getUserSkillGraph(
  userId: number
) {
  const result = await pool.query(
    `
    SELECT
      s.id,
      s.name,
      s.category,
      s.subcategory,
      us.source,

      COALESCE(
        json_agg(
          DISTINCT jsonb_build_object(
            'id', target.id,
            'name', target.name,
            'relationship',
              sr.relationship_type
          )
        )
        FILTER (
          WHERE target.id IS NOT NULL
        ),
        '[]'
      ) AS related_skills

    FROM user_skills us

    JOIN skills s
      ON us.skill_id = s.id

    LEFT JOIN skill_relationships sr
      ON sr.source_skill_id = s.id

    LEFT JOIN skills target
      ON sr.target_skill_id = target.id

    WHERE us.user_id = $1

    GROUP BY
      s.id,
      s.name,
      s.category,
      s.subcategory,
      us.source

    ORDER BY
      s.category,
      s.name
    `,
    [userId]
  );

  return result.rows;
}