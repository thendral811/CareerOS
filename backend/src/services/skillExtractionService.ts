export interface ExtractedSkill {
  name: string;
  category: string;
  subcategory: string;
}

const skillCategories: Record<
  string,
  {
    category: string;
    subcategory: string;
  }
> = {
  python: {
    category: "Programming",
    subcategory: "Programming Language",
  },

  java: {
    category: "Programming",
    subcategory: "Programming Language",
  },

  javascript: {
    category: "Programming",
    subcategory: "Programming Language",
  },

  typescript: {
    category: "Programming",
    subcategory: "Programming Language",
  },

  c: {
    category: "Programming",
    subcategory: "Programming Language",
  },

  "c++": {
    category: "Programming",
    subcategory: "Programming Language",
  },

  "c#": {
    category: "Programming",
    subcategory: "Programming Language",
  },

  "c programming": {
    category: "Programming",
    subcategory: "Programming Language",
  },

  react: {
    category: "Web Development",
    subcategory: "Frontend Framework",
  },

  angular: {
    category: "Web Development",
    subcategory: "Frontend Framework",
  },

  vue: {
    category: "Web Development",
    subcategory: "Frontend Framework",
  },

  "node.js": {
    category: "Web Development",
    subcategory: "Backend Runtime",
  },

  express: {
    category: "Web Development",
    subcategory: "Backend Framework",
  },

  html: {
    category: "Web Development",
    subcategory: "Markup",
  },

  css: {
    category: "Web Development",
    subcategory: "Styling",
  },

  sql: {
    category: "Database",
    subcategory: "Query Language",
  },

  postgresql: {
    category: "Database",
    subcategory: "Relational Database",
  },

  mysql: {
    category: "Database",
    subcategory: "Relational Database",
  },

  dbms: {
    category: "Database",
    subcategory: "Database Management",
  },

  mongodb: {
    category: "Database",
    subcategory: "NoSQL Database",
  },

  git: {
    category: "Tools",
    subcategory: "Version Control",
  },

  github: {
    category: "Tools",
    subcategory: "Code Hosting",
  },

  docker: {
    category: "DevOps",
    subcategory: "Containerization",
  },

  kubernetes: {
    category: "DevOps",
    subcategory: "Container Orchestration",
  },

  aws: {
    category: "Cloud",
    subcategory: "Cloud Platform",
  },

  azure: {
    category: "Cloud",
    subcategory: "Cloud Platform",
  },

  gcp: {
    category: "Cloud",
    subcategory: "Cloud Platform",
  },

  "machine learning": {
    category: "AI/ML",
    subcategory: "Machine Learning",
  },

  "deep learning": {
    category: "AI/ML",
    subcategory: "Deep Learning",
  },

  "natural language processing": {
    category: "AI/ML",
    subcategory: "Natural Language Processing",
  },

  nlp: {
    category: "AI/ML",
    subcategory: "Natural Language Processing",
  },

  cnn: {
    category: "AI/ML",
    subcategory: "Deep Learning",
  },

  tensorflow: {
    category: "AI/ML",
    subcategory: "Machine Learning Framework",
  },

  pytorch: {
    category: "AI/ML",
    subcategory: "Machine Learning Framework",
  },

  weka: {
    category: "AI/ML",
    subcategory: "Machine Learning Tool",
  },

  "speech recognition": {
    category: "AI/ML",
    subcategory: "Speech Technology",
  },

  flutter: {
    category: "Mobile Development",
    subcategory: "Mobile Framework",
  },

  android: {
    category: "Mobile Development",
    subcategory: "Mobile Platform",
  },

  powerbi: {
    category: "Data Analytics",
    subcategory: "Business Intelligence",
  },

  "power bi": {
    category: "Data Analytics",
    subcategory: "Business Intelligence",
  },

  tableau: {
    category: "Data Analytics",
    subcategory: "Business Intelligence",
  },

  "data analysis": {
    category: "Data Analytics",
    subcategory: "Data Analysis",
  },

  "data structures": {
    category: "Computer Science",
    subcategory: "Data Structures",
  },

  algorithms: {
    category: "Computer Science",
    subcategory: "Algorithms",
  },
};

const aliases: Record<string, string> = {
  "react.js": "React",
  reactjs: "React",

  "node.js": "Node.js",
  nodejs: "Node.js",

  "express.js": "Express",

  postgres: "PostgreSQL",

  js: "JavaScript",
  ts: "TypeScript",

  py: "Python",

  cpp: "C++",
  csharp: "C#",

  nlp: "Natural Language Processing",

  "power bi": "PowerBI",

  "machine-learning": "Machine Learning",
  "deep-learning": "Deep Learning",

  dsa: "Data Structures",
};

export function extractSkills(
  skills: string[]
): ExtractedSkill[] {
  const uniqueSkills = new Map<
    string,
    ExtractedSkill
  >();

  for (const rawSkill of skills) {
    const cleanedSkill = rawSkill
      .trim()
      .toLowerCase();

    if (!cleanedSkill) {
      continue;
    }

    const normalizedName =
      aliases[cleanedSkill] ||
      rawSkill.trim();

    const lookupKey =
      normalizedName.toLowerCase();

    const metadata =
      skillCategories[lookupKey];

    if (!metadata) {
      uniqueSkills.set(lookupKey, {
        name: normalizedName,
        category: "Other",
        subcategory: "General",
      });

      continue;
    }

    uniqueSkills.set(lookupKey, {
      name:
        aliases[cleanedSkill] ||
        normalizedName,
      category: metadata.category,
      subcategory:
        metadata.subcategory,
    });
  }

  return Array.from(uniqueSkills.values());
}