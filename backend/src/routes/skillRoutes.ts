import { Router } from "express";

import {
  getSkillGraph,
  getSkillGap,
} from "../controllers/skillController";

import {
  authenticateToken,
} from "../middleware/authMiddleware";

const router = Router();

router.get(
  "/graph",
  authenticateToken,
  getSkillGraph
);

router.get(
  "/gap",
  authenticateToken,
  getSkillGap
);

export default router;