import { Request, Response } from "express";
import path from "path";
import fs from "fs";
import { extractSkills } from "../services/skillExtractionService";
import { saveResume } from "../services/resumeService";
import { extractPdfText } from "../services/pdfService";
import { parseResume } from "../services/aiService";
import { saveExtractedSkills } from "../services/skillService";
export const uploadResumeController = async (
  req: Request,
  res: Response
) => {
  try {
    const userId = (req as any).user.userId;

    const file = (req as any).file;

    if (!file) {
      return res.status(400).json({
        message: "Please upload a PDF resume",
      });
    }

    const filePath = path
      .relative(process.cwd(), file.path)
      .replace(/\\/g, "/");

    const resume = await saveResume({
      user_id: userId,
      file_name: file.originalname,
      file_path: filePath,
    });

    const extractedText =
      await extractPdfText(file.path);

    console.log(
      "========== RESUME TEXT =========="
    );

    console.log(extractedText);

    console.log(
      "================================="
    );

    const parsedResume =
      await parseResume(extractedText);
const extractedSkills =
  extractSkills(parsedResume.skills);
  const savedSkills =
  await saveExtractedSkills(
    userId,
    extractedSkills
  );
  console.log(
  "========== EXTRACTED SKILLS =========="
);

console.log(
  JSON.stringify(
    extractedSkills,
    null,
    2
  )
);

console.log(
  "======================================="
);
    console.log(
      "========== AI RESUME DATA =========="
    );

    console.log(
      JSON.stringify(
        parsedResume,
        null,
        2
      )
    );

    console.log(
      "===================================="
    );

    return res.status(201).json({
  message:
    "Resume uploaded and analyzed successfully",

  resume,

  parsedResume,

  extractedSkills,
  savedSkills,
});
  } catch (error: any) {
    const file = (req as any).file;

    if (
      file?.path &&
      fs.existsSync(file.path)
    ) {
      fs.unlinkSync(file.path);
    }

    console.error(
      "Resume processing error:",
      error
    );

    return res.status(400).json({
      message: error.message,
    });
  }
};