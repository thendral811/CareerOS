import {
  getSkillGapForUser,
} from "./skillGapService";

import {
  getResourcesForSkills,
} from "../models/learningResourceModel";

export async function getKnowledgeFlowForUser(
  userId: number
) {
  const skillGap =
    await getSkillGapForUser(userId);

  const missingSkills =
    skillGap.missingSkills;

  if (missingSkills.length === 0) {
    return {
      targetRole: skillGap.targetRole,
      roleDescription:
        skillGap.roleDescription,

      message:
        "You currently have all required skills for your target role.",

      totalSkillsToDevelop: 0,

      learningPath: [],
    };
  }

  const skillNames =
    missingSkills.map(
      (skill) => skill.name
    );

  const resources =
    await getResourcesForSkills(
      skillNames
    );

  const learningPath =
    missingSkills.map(
      (skill, index) => {
        const skillResources =
          resources.filter(
            (resource) =>
              resource.skill_name.toLowerCase() ===
              skill.name.toLowerCase()
          );

        return {
          order: index + 1,

          skill: {
            id: skill.id,
            name: skill.name,
            category:
              skill.category,
            subcategory:
              skill.subcategory,
            importance:
              skill.importance,
          },

          resources:
            skillResources.map(
              (resource) => ({
                id:
                  resource.resource_id,

                title:
                  resource.title,

                provider:
                  resource.provider,

                url:
                  resource.url,

                resourceType:
                  resource.resource_type,

                difficulty:
                  resource.difficulty,

                estimatedHours:
                  resource.estimated_hours,

                description:
                  resource.description,

                priority:
                  resource.priority,
              })
            ),
        };
      }
    );

  const totalLearningHours =
    learningPath.reduce(
      (total, item) => {
        const hours =
          item.resources.length > 0
            ? item.resources[0]
                .estimatedHours
            : 0;

        return total + hours;
      },
      0
    );

  return {
    targetRole:
      skillGap.targetRole,

    roleDescription:
      skillGap.roleDescription,

    readinessPercentage:
      skillGap.readinessPercentage,

    totalSkillsToDevelop:
      missingSkills.length,

    totalLearningHours,

    learningPath,
  };
}