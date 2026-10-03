import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import pool from "./config/database";
import authRoutes from "./routes/authRoutes";
import careerProfileRoutes from "./routes/careerProfileRoutes";
import resumeRoutes from "./routes/resumeRoutes";
import skillRoutes from "./routes/skillRoutes";
import knowledgeFlowRoutes from "./routes/knowledgeFlowRoutes";
import careerRoutes from "./routes/careerRoutes";
import roleSkillRoutes from "./routes/roleSkillRoutes";

dotenv.config();

const app = express();

const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

app.use("/api/auth", authRoutes);
app.use("/api/profile", careerProfileRoutes);
app.use("/api/resume", resumeRoutes);
app.use("/api/skills", skillRoutes);
app.use(
  "/api/knowledge-flow",
  knowledgeFlowRoutes
);
app.use("/api/career", careerRoutes);
app.use(
  "/api/role-skills",
  roleSkillRoutes
);
app.get("/", (_req, res) => {
  res.json({
    message: "CareerOS Backend is running 🚀",
  });
});

app.get("/api/health/db", async (_req, res) => {
  try {
    const result = await pool.query("SELECT NOW()");

    res.json({
      message: "PostgreSQL connected successfully",
      time: result.rows[0].now,
    });
  } catch (error) {
    console.error("Database connection error:", error);

    res.status(500).json({
      message: "Database connection failed",
    });
  }
});

app.listen(PORT, () => {
  console.log(
    `CareerOS Backend running on http://localhost:${PORT}`
  );
});