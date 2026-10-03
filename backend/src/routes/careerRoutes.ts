
import { Router } from "express";
import pool from "../config/database";const router = Router();

/*
  GET /api/career/roles/:departmentId

  Returns only the career roles associated
  with the selected department.
*/
router.get("/roles/:departmentId", async (req, res) => {
  try {
    const departmentId = Number(req.params.departmentId);

    if (!departmentId || Number.isNaN(departmentId)) {
      return res.status(400).json({
        message: "Invalid department ID",
      });
    }

    const result = await pool.query(
      `
      SELECT
        cr.id,
        cr.name,
        cr.description
      FROM department_roles dr
      INNER JOIN career_roles cr
        ON dr.role_id = cr.id
      WHERE dr.department_id = $1
      ORDER BY cr.name ASC
      `,
      [departmentId]
    );

    return res.status(200).json({
      roles: result.rows,
    });
  } catch (error) {
    console.error("Career roles error:", error);

    return res.status(500).json({
      message: "Unable to load career roles",
    });
  }
});

export default router;
