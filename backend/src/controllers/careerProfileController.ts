import { Request, Response } from "express";
import {
  createProfile,
  getProfile,
  updateProfile,
} from "../services/careerProfileService";

export const createCareerProfileController = async (
  req: Request,
  res: Response
) => {
  try {
    const userId = (req as any).user.userId;

    const profile = await createProfile({
      user_id: userId,
      college: req.body.college,
      course: req.body.course,
      degree: req.body.degree,
      year_of_study: req.body.year_of_study,
      semester: req.body.semester,
      target_role: req.body.target_role,
      experience_level: req.body.experience_level,
      interests: req.body.interests,
    });

    res.status(201).json({
      message: "Career profile created successfully",
      profile,
    });
  } catch (error: any) {
    res.status(400).json({
      message: error.message,
    });
  }
};

export const getCareerProfileController = async (
  req: Request,
  res: Response
) => {
  try {
    const userId = (req as any).user.userId;

    const profile = await getProfile(userId);

    if (!profile) {
      return res.status(404).json({
        message: "Career profile not found",
      });
    }

    res.status(200).json({
      profile,
    });
  } catch (error: any) {
    res.status(500).json({
      message: error.message,
    });
  }
};

export const updateCareerProfileController = async (
  req: Request,
  res: Response
) => {
  try {
    const userId = (req as any).user.userId;

    const profile = await updateProfile(userId, {
      user_id: userId,
      college: req.body.college,
      course: req.body.course,
      degree: req.body.degree,
      year_of_study: req.body.year_of_study,
      semester: req.body.semester,
      target_role: req.body.target_role,
      experience_level: req.body.experience_level,
      interests: req.body.interests,
    });

    if (!profile) {
      return res.status(404).json({
        message: "Career profile not found",
      });
    }

    res.status(200).json({
      message: "Career profile updated successfully",
      profile,
    });
  } catch (error: any) {
    res.status(400).json({
      message: error.message,
    });
  }
};