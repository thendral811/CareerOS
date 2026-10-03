import { GoogleGenAI } from "@google/genai";

const apiKey = process.env.GEMINI_API_KEY;

if (!apiKey) {
  throw new Error(
    "GEMINI_API_KEY is not configured"
  );
}

const ai = new GoogleGenAI({
  apiKey,
});

const resumeSchema = {
  type: "object",
  properties: {
    name: {
      type: "string",
      description:
        "Candidate's full name. Return an empty string if not found.",
    },

    email: {
      type: "string",
      description:
        "Candidate's email address. Return an empty string if not found.",
    },

    phone: {
      type: "string",
      description:
        "Candidate's phone number. Return an empty string if not found.",
    },

    summary: {
      type: "string",
      description:
        "Short professional summary based only on the resume.",
    },

    skills: {
      type: "array",
      items: {
        type: "string",
      },
      description:
        "Technical and professional skills explicitly supported by the resume.",
    },

    education: {
      type: "array",
      items: {
        type: "object",
        properties: {
          degree: {
            type: "string",
          },
          field: {
            type: "string",
          },
          institution: {
            type: "string",
          },
          year: {
            type: "string",
          },
        },
        required: [
          "degree",
          "field",
          "institution",
          "year",
        ],
      },
    },

    experience: {
      type: "array",
      items: {
        type: "object",
        properties: {
          role: {
            type: "string",
          },
          company: {
            type: "string",
          },
          duration: {
            type: "string",
          },
          description: {
            type: "string",
          },
        },
        required: [
          "role",
          "company",
          "duration",
          "description",
        ],
      },
    },

    projects: {
      type: "array",
      items: {
        type: "object",
        properties: {
          name: {
            type: "string",
          },
          description: {
            type: "string",
          },
          technologies: {
            type: "array",
            items: {
              type: "string",
            },
          },
        },
        required: [
          "name",
          "description",
          "technologies",
        ],
      },
    },

    certifications: {
      type: "array",
      items: {
        type: "string",
      },
    },
  },

  required: [
    "name",
    "email",
    "phone",
    "summary",
    "skills",
    "education",
    "experience",
    "projects",
    "certifications",
  ],
};

export async function parseResume(
  resumeText: string
) {
  const prompt = `
You are CareerOS Resume Parser.

Analyze the resume text below and extract structured information.

Rules:
- Use ONLY information present in the resume.
- Do not invent skills, education, experience, projects, or certifications.
- Normalize obvious variations of the same skill.
- Keep the extracted information concise.
- If information is missing, return an empty string or empty array.
- Skills should include technologies, programming languages,
  frameworks, databases, tools, cloud technologies, and relevant
  professional skills explicitly supported by the resume.

Resume text:

${resumeText}
`;

  const response = await ai.interactions.create({
    model: "gemini-3.8-flash",

    input: prompt,

    response_format: {
      type: "text",
      mime_type: "application/json",
      schema: resumeSchema,
    },
  });

  const outputText =
    response.output_text;

  if (!outputText) {
    throw new Error(
      "AI returned an empty response"
    );
  }

  return JSON.parse(outputText);
}