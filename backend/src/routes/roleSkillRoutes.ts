import { Router } from "express";

import {
  getRoleSkillsController,
  getRoleSkillsByNameController,
} from "../controllers/roleSkillController";

const router = Router();

/*
  GET /api/role-skills/role/:roleId

  Example:
  /api/role-skills/role/1
*/
router.get(
  "/role/:roleId",
  getRoleSkillsController
);


/*
  GET /api/role-skills/by-name?role=Software%20Engineer
*/
router.get(
  "/by-name",
  getRoleSkillsByNameController
);

export default router;
