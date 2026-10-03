import { Request, Response, NextFunction } from "express";
import jwt from "jsonwebtoken";

interface JwtPayload {
  userId: number;
  email: string;
}

export const authenticateToken = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const authHeader = req.headers.authorization;

  const token = authHeader?.split(" ")[1];

  if (!token) {
    return res.status(401).json({
      message: "Access token required",
    });
  }

  const jwtSecret = process.env.JWT_SECRET;

  if (!jwtSecret) {
    return res.status(500).json({
      message: "JWT_SECRET_MISSING",
    });
  }

  try {
    const decoded = jwt.verify(
      token,
      jwtSecret
    ) as JwtPayload;

    (req as any).user = decoded;

    next();
  } catch {
    return res.status(403).json({
      message: "Invalid or expired token",
    });
  }
};