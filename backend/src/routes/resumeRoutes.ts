import { Router } from "express";

import {
  uploadResumeController,
} from "../controllers/resumeController";

import {
  authenticateToken,
} from "../middleware/authMiddleware";

import {
  uploadResume,
} from "../middleware/uploadMiddleware";

const router = Router();

router.post(
  "/upload",
  authenticateToken,
  uploadResume.single("resume"),
  uploadResumeController
);

export default router;