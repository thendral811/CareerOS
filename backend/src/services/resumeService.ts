import {
  Resume,
  createResume,
  getResumeByUserId,
  deleteResumeByUserId,
} from "../models/resumeModel";

export const saveResume = async (
  resume: Resume
): Promise<Resume> => {
  const existingResume = await getResumeByUserId(
    resume.user_id
  );

  if (existingResume) {
    await deleteResumeByUserId(resume.user_id);
  }

  return await createResume(resume);
};

export const getResume = async (
  user_id: number
): Promise<Resume | null> => {
  return await getResumeByUserId(user_id);
};