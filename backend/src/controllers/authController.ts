import { Request, Response } from "express";
import {
  registerUser,
  loginUser,
} from "../services/authService";
export async function register(
  req: Request,
  res: Response
) {
  try {
    const { name, email, password } = req.body;

    if (!name || !email || !password) {
      return res.status(400).json({
        message: "Name, email and password are required",
      });
    }

    if (password.length < 6) {
      return res.status(400).json({
        message: "Password must be at least 6 characters",
      });
    }

    const user = await registerUser(
      name,
      email,
      password
    );

    return res.status(201).json({
      message: "User registered successfully",
      user,
    });

  } catch (error) {
    if (error instanceof Error && error.message === "EMAIL_EXISTS") {
      return res.status(409).json({
        message: "Email already registered",
      });
    }

    console.error("Registration error:", error);

    return res.status(500).json({
      message: "Internal server error",
    });
  }
}

export async function login(
  req: Request,
  res: Response
) {
  try {
    const { email, password } = req.body;

    if (!email || !password) {
      return res.status(400).json({
        message: "Email and password are required",
      });
    }

    const result = await loginUser(
      email,
      password
    );

    return res.status(200).json({
      message: "Login successful",
      ...result,
    });

  } catch (error) {
    if (
      error instanceof Error &&
      error.message === "INVALID_CREDENTIALS"
    ) {
      return res.status(401).json({
        message: "Invalid email or password",
      });
    }

    if (
      error instanceof Error &&
      error.message === "JWT_SECRET_MISSING"
    ) {
      return res.status(500).json({
        message: "JWT configuration error",
      });
    }

    console.error("Login error:", error);

    return res.status(500).json({
      message: "Internal server error",
    });
  }
}