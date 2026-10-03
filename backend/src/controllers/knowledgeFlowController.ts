import {
  Request,
  Response,
} from "express";

import {
  getKnowledgeFlowForUser,
} from "../services/knowledgeFlowService";

export async function getKnowledgeFlow(
  req: Request,
  res: Response
) {
  try {
    const userId =
      (req as any).user.userId;

    const knowledgeFlow =
      await getKnowledgeFlowForUser(
        userId
      );

    return res.status(200).json(
      knowledgeFlow
    );
  } catch (error: any) {
    console.error(
      "KnowledgeFlow error:",
      error
    );

    return res.status(400).json({
      message:
        error.message ||
        "Failed to generate KnowledgeFlow",
    });
  }
}