import { Router } from "express";

import {
  getKnowledgeFlow,
} from "../controllers/knowledgeFlowController";

import {
  authenticateToken,
} from "../middleware/authMiddleware";

const router = Router();

router.get(
  "/",
  authenticateToken,
  getKnowledgeFlow
);

export default router;