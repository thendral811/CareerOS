import { Request, Response } from "express";
import pool from "../config/database";

// Get all departments
export const getDepartments = async (
  req: Request,
  res: Response
) => {
  try {
    const result = await pool.query(`
      SELECT id, name
      FROM departments
      ORDER BY name
    `);

    res.json(result.rows);
  } catch (error) {
    console.error("Error fetching departments:", error);

    res.status(500).json({
      message: "Failed to fetch departments",
    });
  }
};

// Get roles for a specific department
export const getDepartmentRoles = async (
  req: Request,
  res: Response
) => {
  try {
    const departmentId = Number(req.params.departmentId);

    if (!Number.isInteger(departmentId)) {
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
      ORDER BY cr.name
      `,
      [departmentId]
    );

    res.json(result.rows);
  } catch (error) {
    console.error("Error fetching department roles:", error);

    res.status(500).json({
      message: "Failed to fetch department roles",
    });
  }
};