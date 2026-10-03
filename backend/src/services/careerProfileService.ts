import {
  CareerProfile,
  createCareerProfile,
  getCareerProfileByUserId,
  updateCareerProfile,
} from "../models/careerProfileModel";

export const createProfile = async (
  profile: CareerProfile
): Promise<CareerProfile> => {
  const existingProfile = await getCareerProfileByUserId(profile.user_id);

  if (existingProfile) {
    throw new Error("Career profile already exists");
  }

  return await createCareerProfile(profile);
};

export const getProfile = async (
  user_id: number
): Promise<CareerProfile | null> => {
  return await getCareerProfileByUserId(user_id);
};

export const updateProfile = async (
  user_id: number,
  profile: CareerProfile
): Promise<CareerProfile | null> => {
  return await updateCareerProfile(user_id, profile);
};