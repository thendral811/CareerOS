import pool from "../config/database";

export interface Resume {
  id?: number;
  user_id: number;
  file_name: string;
  file_path: string;
  uploaded_at?: Date;
}
export const deleteResumeByUserId = async (
  user_id: number
): Promise<void> => {
  await pool.query(
    "DELETE FROM resumes WHERE user_id = $1",
    [user_id]
  );
};
export const createResume = async (
  resume: Resume
): Promise<Resume> => {
  const {
    user_id,
    file_name,
    file_path,
  } = resume;

  const result = await pool.query(
    `INSERT INTO resumes
    (
      user_id,
      file_name,
      file_path
    )
    VALUES ($1, $2, $3)
    RETURNING *`,
    [
      user_id,
      file_name,
      file_path,
    ]
  );

  return result.rows[0];
};

export const getResumeByUserId = async (
  user_id: number
): Promise<Resume | null> => {
  const result = await pool.query(
    `SELECT * FROM resumes
     WHERE user_id = $1`,
    [user_id]
  );

  return result.rows[0] || null;
};