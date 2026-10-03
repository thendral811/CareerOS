import {
  createSkill,
  getSkillByName,
  addUserSkill,
  getUserSkills,
} from "../models/skillModel";

export async function saveExtractedSkills(
  userId: number,
  skills: {
    name: string;
    category: string;
    subcategory: string;
  }[]
) {
  const savedSkills = [];

  for (const skill of skills) {
    let existingSkill =
      await getSkillByName(skill.name);

    if (!existingSkill) {
      existingSkill =
        await createSkill(skill);
    }

    if (!existingSkill.id) {
      continue;
    }

    await addUserSkill(
      userId,
      existingSkill.id,
      "resume"
    );

    savedSkills.push({
      id: existingSkill.id,
      name: existingSkill.name,
      category: existingSkill.category,
      subcategory:
        existingSkill.subcategory,
    });
  }

  return savedSkills;
}

export async function getSkillsForUser(
  userId: number
) {
  return await getUserSkills(userId);
}