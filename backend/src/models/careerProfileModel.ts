import pool from "../config/database";

export interface CareerProfile {
  id?: number;
  user_id: number;
  college?: string;
  course?: string;
  degree?: string;
  year_of_study?: number;
  semester?: number;
  target_role?: string;
  experience_level?: string;
  interests?: string;
}

export const createCareerProfile = async (
  profile: CareerProfile
): Promise<CareerProfile> => {
  const {
    user_id,
    college,
    course,
    degree,
    year_of_study,
    semester,
    target_role,
    experience_level,
    interests,
  } = profile;

  const result = await pool.query(
    `INSERT INTO career_profiles
    (
      user_id,
      college,
      course,
      degree,
      year_of_study,
      semester,
      target_role,
      experience_level,
      interests
    )
    VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9)
    RETURNING *`,
    [
      user_id,
      college,
      course,
      degree,
      year_of_study,
      semester,
      target_role,
      experience_level,
      interests,
    ]
  );

  return result.rows[0];
};

export const getCareerProfileByUserId = async (
  user_id: number
): Promise<CareerProfile | null> => {
  const result = await pool.query(
    `SELECT * FROM career_profiles WHERE user_id = $1`,
    [user_id]
  );

  return result.rows[0] || null;
};

export const updateCareerProfile = async (
  user_id: number,
  profile: CareerProfile
): Promise<CareerProfile | null> => {
  const {
    college,
    course,
    degree,
    year_of_study,
    semester,
    target_role,
    experience_level,
    interests,
  } = profile;

  const result = await pool.query(
    `UPDATE career_profiles
     SET
       college = $1,
       course = $2,
       degree = $3,
       year_of_study = $4,
       semester = $5,
       target_role = $6,
       experience_level = $7,
       interests = $8,
       updated_at = CURRENT_TIMESTAMP
     WHERE user_id = $9
     RETURNING *`,
    [
      college,
      course,
      degree,
      year_of_study,
      semester,
      target_role,
      experience_level,
      interests,
      user_id,
    ]
  );

  return result.rows[0] || null;
};