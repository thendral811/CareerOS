import { Router } from "express";

import {
  createCareerProfileController,
  getCareerProfileController,
  updateCareerProfileController,
} from "../controllers/careerProfileController";

import { authenticateToken } from "../middleware/authMiddleware";

const router = Router();

router.post(
  "/",
  authenticateToken,
  createCareerProfileController
);

router.get(
  "/",
  authenticateToken,
  getCareerProfileController
);

router.put(
  "/",
  authenticateToken,
  updateCareerProfileController
);

export default router;