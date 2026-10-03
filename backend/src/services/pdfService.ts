import fs from "fs";
import { PDFParse } from "pdf-parse";

export async function extractPdfText(
  filePath: string
): Promise<string> {
  if (!fs.existsSync(filePath)) {
    throw new Error("Resume file not found");
  }

  const fileBuffer = fs.readFileSync(filePath);

  const parser = new PDFParse({
    data: fileBuffer,
  });

  const result = await parser.getText();

  await parser.destroy();

  const text = result.text.trim();

  if (!text) {
    throw new Error(
      "Could not extract text from this PDF"
    );
  }

  return text;
}