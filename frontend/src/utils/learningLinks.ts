const GFG_SEARCH_URL =
  "https://www.geeksforgeeks.org/search/";

const skillAliases: Record<string, string> = {
  "data structures": "data structures",
  "algorithms": "algorithms",
  "object oriented programming": "object oriented programming",
  "software engineering": "software engineering",
  "computer networks": "computer networks",
  "operating systems": "operating systems",
  "database management systems": "dbms",
  dbms: "dbms",
  sql: "sql",
  mysql: "mysql",
  python: "python",
  java: "java",
  javascript: "javascript",
  "c programming": "c programming",
  c: "c programming",
  "c++": "c++",
  git: "git",
  react: "react",
  "node.js": "node.js",
  nodejs: "node.js",
  html: "html",
  css: "css",
  "machine learning": "machine learning",
  "deep learning": "deep learning",
  "natural language processing": "natural language processing",
  nlp: "natural language processing",
  "data science": "data science",
  "data analytics": "data analytics",
  "power bi": "power bi",
  powerbi: "power bi",
  tableau: "tableau",
  linux: "linux",
  docker: "docker",
  kubernetes: "kubernetes",
  cybersecurity: "cybersecurity",
  "cloud computing": "cloud computing",
  aws: "aws",
  azure: "microsoft azure",
  "computer architecture": "computer organization and architecture",
  "compiler design": "compiler design",
  "digital electronics": "digital electronics",
  "embedded systems": "embedded systems",
  "vlsi design": "vlsi design",
  "electrical machines": "electrical engineering",
  "control systems": "control systems",
  "signal processing": "signal processing",
  "communication systems": "communication systems",
  "engineering mechanics": "engineering mechanics",
  thermodynamics: "thermodynamics",
  "fluid mechanics": "fluid mechanics",
  "heat transfer": "heat transfer",
  "manufacturing processes": "manufacturing processes",
  "strength of materials": "strength of materials",
  "structural engineering": "structural engineering",
  "environmental engineering": "environmental engineering",
  "water quality": "water quality",
  "waste management": "waste management",
  "wastewater treatment": "wastewater treatment",
  "environmental impact assessment":
    "environmental impact assessment",
  "transportation engineering": "transportation engineering",
  "geotechnical engineering": "geotechnical engineering",
  "concrete technology": "concrete technology",
  "construction management": "construction management",
  "chemical engineering": "chemical engineering",
  "process engineering": "process engineering",
  "heat exchanger": "heat exchanger",
  "biomedical engineering": "biomedical engineering",
  "biomedical instrumentation":
    "biomedical instrumentation",
  "medical imaging": "medical imaging"
};

export function getLearningUrl(skillName: string): string {
  const normalizedSkill = skillName
    .trim()
    .toLowerCase();

  const searchTerm =
    skillAliases[normalizedSkill] ||
    normalizedSkill;

  return `${GFG_SEARCH_URL}?query=${encodeURIComponent(
    searchTerm
  )}`;
}