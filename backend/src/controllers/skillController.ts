import {
  Request,
  Response,
} from "express";

import {
  getUserSkillGraph,
} from "../services/skillGraphService";

import {
  getSkillGapForUser,
} from "../services/skillGapService";

export async function getSkillGraph(
  req: Request,
  res: Response
) {
  try {
    const userId =
      (req as any).user.userId;

    const skillGraph =
      await getUserSkillGraph(userId);

    return res.status(200).json({
      skills: skillGraph,
    });
  } catch (error: any) {
    console.error(
      "Skill graph error:",
      error
    );

    return res.status(500).json({
      message:
        "Failed to retrieve skill graph",
    });
  }
}

export async function getSkillGap(
  req: Request,
  res: Response
) {
  try {
    const userId =
      (req as any).user.userId;

    const skillGap =
      await getSkillGapForUser(
        userId
      );

    return res.status(200).json(
      skillGap
    );
  } catch (error: any) {
    console.error(
      "Skill gap error:",
      error
    );

    return res.status(400).json({
      message:
        error.message ||
        "Failed to analyze skill gap",
    });
  }
}