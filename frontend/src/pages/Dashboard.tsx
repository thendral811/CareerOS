import {
  useEffect,
  useRef,
  useState,
} from "react";
import { useNavigate } from "react-router-dom";
import "./Dashboard.css";
import { getLearningUrl } from "../utils/learningLinks";

interface CareerProfile {
  college: string;
  course: string;
  degree: string;
  year_of_study: number;
  semester: number;
  target_role: string;
  experience_level: string;
  interests: string;
}

interface RelatedSkill {
  id: number;
  name: string;
  relationship: string;
}

interface Skill {
  id: number;
  name: string;
  category: string;
  subcategory: string;
  source: string;
  related_skills: RelatedSkill[];
}

interface SkillGapItem {
  id: number;
  name: string;
  category: string;
  subcategory: string;
  importance: number;
}

interface SkillGapData {
  targetRole: string;
  roleDescription: string;
  totalRequiredSkills: number;
  matchedCount: number;
  missingCount: number;
  readinessPercentage: number;
  matchedSkills: SkillGapItem[];
  missingSkills: SkillGapItem[];
}

function Dashboard() {
  const navigate = useNavigate();

  const profileMenuRef =
    useRef<HTMLDivElement | null>(null);

  const [profile, setProfile] =
    useState<CareerProfile | null>(null);

  const [skills, setSkills] =
    useState<Skill[]>([]);

  const [skillGap, setSkillGap] =
    useState<SkillGapData | null>(null);

  const [loading, setLoading] =
    useState(true);

  const [error, setError] =
    useState("");

  const [skillLoading, setSkillLoading] =
    useState(true);

  const [skillError, setSkillError] =
    useState("");

  const [skillGapLoading, setSkillGapLoading] =
    useState(true);

  const [resume, setResume] =
    useState<File | null>(null);

  const [resumeMessage, setResumeMessage] =
    useState("");

  const [resumeLoading, setResumeLoading] =
    useState(false);

  const [profileMenuOpen, setProfileMenuOpen] =
    useState(false);

  const storedUser =
    localStorage.getItem("user");

  const user = storedUser
    ? JSON.parse(storedUser)
    : {};

  const userName =
    user.name || "Student";

  const userInitials =
    userName
      .split(" ")
      .filter(Boolean)
      .slice(0, 2)
      .map((part: string) =>
        part.charAt(0).toUpperCase()
      )
      .join("") || "S";

  /*
   * Close dropdown when clicking outside.
   */
  useEffect(() => {
    const handleOutsideClick = (
      event: MouseEvent
    ) => {
      if (
        profileMenuRef.current &&
        !profileMenuRef.current.contains(
          event.target as Node
        )
      ) {
        setProfileMenuOpen(false);
      }
    };

    document.addEventListener(
      "mousedown",
      handleOutsideClick
    );

    return () => {
      document.removeEventListener(
        "mousedown",
        handleOutsideClick
      );
    };
  }, []);

  /*
   * Get skills.
   */
  const fetchSkills = async (
    token: string
  ) => {
    try {
      setSkillLoading(true);
      setSkillError("");

      const response = await fetch(
        "http://localhost:5000/api/skills/graph",
        {
          method: "GET",
          headers: {
            Authorization:
              `Bearer ${token}`,
          },
        }
      );

      const data =
        await response.json();

      if (!response.ok) {
        setSkillError(
          data.message ||
            "Unable to load skills"
        );

        return;
      }

      setSkills(
        data.skills || []
      );
    } catch (error) {
      console.error(
        "Skill fetch error:",
        error
      );

      setSkillError(
        "Unable to load skills"
      );
    } finally {
      setSkillLoading(false);
    }
  };

  /*
   * Get skill gap.
   */
  const fetchSkillGap = async (
    token: string
  ) => {
    try {
      setSkillGapLoading(true);

      const response = await fetch(
        "http://localhost:5000/api/skills/gap",
        {
          method: "GET",
          headers: {
            Authorization:
              `Bearer ${token}`,
          },
        }
      );

      const data =
        await response.json();

      if (!response.ok) {
        return;
      }

      setSkillGap(data);
    } catch (error) {
      console.error(
        "Skill gap fetch error:",
        error
      );
    } finally {
      setSkillGapLoading(false);
    }
  };

  /*
   * Load dashboard.
   */
  useEffect(() => {
    const fetchDashboardData =
      async () => {
        const token =
          localStorage.getItem(
            "token"
          );

        if (!token) {
          navigate("/");
          return;
        }

        try {
          const profileResponse =
            await fetch(
              "http://localhost:5000/api/profile",
              {
                method: "GET",
                headers: {
                  Authorization:
                    `Bearer ${token}`,
                },
              }
            );

          const profileData =
            await profileResponse.json();

          if (!profileResponse.ok) {
            setError(
              profileData.message ||
                "Unable to load profile"
            );
          } else {
            setProfile(
              profileData.profile
            );
          }

          await fetchSkills(token);

          await fetchSkillGap(token);
        } catch (error) {
          console.error(
            "Dashboard error:",
            error
          );

          setError(
            "Unable to connect to CareerOS server"
          );
        } finally {
          setLoading(false);
        }
      };

    fetchDashboardData();
  }, [navigate]);

  /*
   * Logout.
   */
  const handleLogout = () => {
    localStorage.removeItem("token");
    localStorage.removeItem("user");

    navigate("/");
  };

  /*
   * Temporary subscription.
   */
  const handleSubscription = () => {
    setProfileMenuOpen(false);

    alert(
      "CareerOS Subscription is coming soon."
    );
  };

  /*
   * Start learning for a specific skill.
   */
  const handleStartLearning = (skillName: string) => {
  window.open(
    getLearningUrl(skillName),
    "_blank",
    "noopener,noreferrer"
  );
};

  /*
   * Importance label.
   */
  const getImportanceLabel = (
    importance: number
  ) => {
    if (importance >= 5) {
      return "Critical";
    }

    if (importance === 4) {
      return "High";
    }

    if (importance === 3) {
      return "Medium";
    }

    if (importance === 2) {
      return "Low";
    }

    return "Optional";
  };

  /*
   * Resume upload.
   */
  const handleResumeUpload =
    async () => {
      if (!resume) {
        setResumeMessage(
          "Please select a PDF resume."
        );

        return;
      }

      const token =
        localStorage.getItem(
          "token"
        );

      if (!token) {
        navigate("/");
        return;
      }

      if (
        resume.type !==
        "application/pdf"
      ) {
        setResumeMessage(
          "Only PDF resumes are allowed."
        );

        return;
      }

      if (
        resume.size >
        5 * 1024 * 1024
      ) {
        setResumeMessage(
          "Resume must be smaller than 5 MB."
        );

        return;
      }

      const formData =
        new FormData();

      formData.append(
        "resume",
        resume
      );

      setResumeLoading(true);
      setResumeMessage("");

      try {
        const response =
          await fetch(
            "http://localhost:5000/api/resume/upload",
            {
              method: "POST",
              headers: {
                Authorization:
                  `Bearer ${token}`,
              },
              body: formData,
            }
          );

        const data =
          await response.json();

        if (!response.ok) {
          setResumeMessage(
            data.message ||
              "Resume upload failed"
          );

          return;
        }

        setResumeMessage(
          "Resume uploaded and analyzed successfully!"
        );

        setResume(null);

        const fileInput =
          document.getElementById(
            "resume-upload"
          ) as
            | HTMLInputElement
            | null;

        if (fileInput) {
          fileInput.value = "";
        }

        await fetchSkills(token);

        await fetchSkillGap(token);
      } catch (error) {
        console.error(
          "Resume upload error:",
          error
        );

        setResumeMessage(
          "Unable to connect to CareerOS server"
        );
      } finally {
        setResumeLoading(false);
      }
    };

  if (loading) {
    return (
      <main className="dashboard-page">
        <div className="dashboard-loading">
          Loading your CareerOS dashboard...
        </div>
      </main>
    );
  }

  if (error) {
    return (
      <main className="dashboard-page">
        <div className="dashboard-error">
          {error}
        </div>
      </main>
    );
  }

  return (
    <main className="dashboard-page">

      {/* ================================= */}
      {/* STICKY NAVBAR */}
      {/* ================================= */}

      <header className="dashboard-navbar">

        <div
          className="navbar-logo"
          onClick={() =>
            navigate("/dashboard")
          }
        >
          CareerOS
        </div>

        <div
          className="profile-wrapper"
          ref={profileMenuRef}
        >

          <button
            type="button"
            className="profile-trigger"
            onClick={() =>
              setProfileMenuOpen(
                (previous) =>
                  !previous
              )
            }
          >

            <span className="profile-avatar">
              {userInitials}
            </span>

            <span className="profile-name">
              {userName}
            </span>

            <span
              className={`profile-chevron ${
                profileMenuOpen
                  ? "open"
                  : ""
              }`}
            >
              ↓
            </span>

          </button>

          {profileMenuOpen && (
            <div className="profile-dropdown">

              <div className="dropdown-user">

                <span className="dropdown-avatar">
                  {userInitials}
                </span>

                <div>
                  <strong>
                    {userName}
                  </strong>

                  <span>
                    CareerOS Student
                  </span>
                </div>

              </div>

              <div className="dropdown-divider" />

              <button
                type="button"
                className="dropdown-item active-item"
                onClick={() => {
                  setProfileMenuOpen(
                    false
                  );

                  navigate(
                    "/dashboard"
                  );
                }}
              >
                <span>⌂</span>
                Dashboard
              </button>

              <button
                type="button"
                className="dropdown-item"
                onClick={() => {
                  setProfileMenuOpen(
                    false
                  );

                  navigate(
                    "/profile"
                  );
                }}
              >
                <span>✎</span>
                Edit Profile
              </button>

              <button
                type="button"
                className="dropdown-item"
                onClick={
                  handleSubscription
                }
              >
                <span>◈</span>
                Subscription

                <small>
                  Soon
                </small>
              </button>

              <div className="dropdown-divider" />

              <button
                type="button"
                className="dropdown-item logout-item"
                onClick={
                  handleLogout
                }
              >
                <span>↪</span>
                Logout
              </button>

            </div>
          )}

        </div>

      </header>

      {/* ================================= */}
      {/* WELCOME HERO */}
      {/* ================================= */}

      <section className="welcome-hero">

        <div className="hero-glow glow-one" />
        <div className="hero-glow glow-two" />

        <div className="welcome-content">

          <span className="welcome-eyebrow">
            YOUR PERSONAL CAREER INTELLIGENCE
          </span>

          <h1>
            Welcome,{" "}
            <span className="welcome-name">
              {userName}
            </span>
            !
          </h1>

          <p>
            CareerOS is your AI-powered
            career and learning platform.
            Discover the skills you need,
            understand your gaps, and build
            a personalized path toward your
            dream career.
          </p>

          <div className="welcome-role">

            <span>
              Target Role
            </span>

            <strong>
              {profile?.target_role ||
                "Choose your career goal"}
            </strong>

          </div>

        </div>

        <div className="hero-orbit">

          <div className="orbit-ring ring-one" />
          <div className="orbit-ring ring-two" />

          <div className="orbit-center">
            <span>✦</span>
          </div>

        </div>

      </section>

      {/* ================================= */}
      {/* OVERVIEW */}
      {/* ================================= */}

      <section className="overview-section">

        <div className="section-heading">

          <span>
            OVERVIEW
          </span>

          <h2>
            Your career at a glance
          </h2>

          <p>
            A quick snapshot of your current
            CareerOS profile.
          </p>

        </div>

        <div className="overview-grid">

          <div className="overview-card">

            <div className="overview-icon">
              🎯
            </div>

            <span>
              TARGET ROLE
            </span>

            <h3>
              {profile?.target_role ||
                "Not specified"}
            </h3>

            <p>
              {profile?.experience_level ||
                "Experience level not specified"}
            </p>

          </div>

          <div className="overview-card">

            <div className="overview-icon">
              🧠
            </div>

            <span>
              SKILLS DETECTED
            </span>

            <h3>
              {skillLoading
                ? "..."
                : skills.length}
            </h3>

            <p>
              Skills identified from your resume
            </p>

          </div>

          <div className="overview-card">

            <div className="overview-icon">
              📊
            </div>

            <span>
              CAREER READINESS
            </span>

            <h3>
              {skillGapLoading
                ? "..."
                : skillGap
                ? `${skillGap.readinessPercentage}%`
                : "--"}
            </h3>

            <p>
              Current skill alignment
            </p>

          </div>

          <div className="overview-card">

            <div className="overview-icon">
              📚
            </div>

            <span>
              SKILLS TO DEVELOP
            </span>

            <h3>
              {skillGapLoading
                ? "..."
                : skillGap
                ? skillGap.missingCount
                : "--"}
            </h3>

            <p>
              Based on your target role
            </p>

          </div>

        </div>

      </section>

      {/* ================================= */}
      {/* AI SKILL ANALYSIS */}
      {/* ================================= */}

      <section className="skill-analysis-section">

        <div className="section-heading">

          <span>
            AI ANALYSIS
          </span>

          <h2>
            Your skill readiness
          </h2>

          <p>
            See how your current skills
            compare with your target career.
          </p>

        </div>

        <div className="dashboard-card skill-analysis-card">

          <div className="skill-analysis-header">

            <div>
              <span className="card-overline">
                TARGET CAREER
              </span>

              <h3>
                {skillGap?.targetRole ||
                  profile?.target_role ||
                  "Career Role"}
              </h3>

              <p>
                {skillGap?.roleDescription ||
                  "Your personalized skill analysis."}
              </p>
            </div>

            <div className="readiness-display">

              <span>
                READINESS
              </span>

              <strong>
                {skillGapLoading
                  ? "..."
                  : `${skillGap?.readinessPercentage || 0}%`}
              </strong>

            </div>

          </div>

          <div className="analysis-stats">

            <div className="analysis-stat">
              <strong>
                {skillGap?.totalRequiredSkills || 0}
              </strong>

              <span>
                Required Skills
              </span>
            </div>

            <div className="analysis-stat">
              <strong>
                {skillGap?.matchedCount || 0}
              </strong>

              <span>
                Skills Matched
              </span>
            </div>

            <div className="analysis-stat">
              <strong>
                {skillGap?.missingCount || 0}
              </strong>

              <span>
                Skills To Develop
              </span>
            </div>

          </div>

          <div className="skill-breakdown-section">

            <div className="skill-breakdown-grid">

              <div className="skill-list-card">

                <div className="skill-list-heading">
                  <span>
                    ✓
                  </span>

                  <div>
                    <strong>
                      Your Strengths
                    </strong>

                    <p>
                      Skills you already have
                    </p>
                  </div>
                </div>

                {skillGap?.matchedSkills &&
                skillGap.matchedSkills.length > 0 ? (
                  <div className="skill-list">

                    {skillGap.matchedSkills.map(
                      (skill) => (
                        <div
                          className="skill-list-item matched-skill"
                          key={skill.id}
                        >
                          <span className="skill-status">
                            ✓
                          </span>

                          <div className="skill-item-content">
                            <strong>
                              {skill.name}
                            </strong>

                            <span>
                              {skill.category}
                              {skill.subcategory
                                ? ` • ${skill.subcategory}`
                                : ""}
                            </span>
                          </div>
                        </div>
                      )
                    )}

                  </div>
                ) : (
                  <div className="empty-skill-state">
                    No matched skills yet.
                  </div>
                )}

              </div>

              <div className="skill-list-card missing-card">

                <div className="skill-list-heading">
                  <span>
                    +
                  </span>

                  <div>
                    <strong>
                      Next Steps
                    </strong>

                    <p>
                      Skills you should develop
                    </p>
                  </div>
                </div>

                {skillGap?.missingSkills &&
                skillGap.missingSkills.length > 0 ? (
                  <div className="skill-list">

                    {skillGap.missingSkills.map(
                      (skill) => (
                        <div
                          className="skill-list-item missing-skill"
                          key={skill.id}
                        >

                          <span className="skill-status">
                            +
                          </span>

                          <div className="skill-item-content">
                            <strong>
                              {skill.name}
                            </strong>

                            <span>
                              {skill.category}
                              {skill.subcategory
                                ? ` • ${skill.subcategory}`
                                : ""}
                            </span>
                          </div>

                          <div className="missing-skill-right">

                            <span className="importance">
                              {getImportanceLabel(
                                skill.importance
                              )}
                            </span>

                            <button
                              type="button"
                              className="learn-skill-button"
                              onClick={() =>
                                handleStartLearning(
                                  skill.name
                                )
                              }
                            >
                              Start Learning
                              <span>
                                →
                              </span>
                            </button>

                          </div>

                        </div>
                      )
                    )}

                  </div>
                ) : (
                  <div className="empty-skill-state">
                    You currently have no skill gaps.
                  </div>
                )}

              </div>

            </div>

          </div>

        </div>

      </section>

      {/* ================================= */}
      {/* PROFILE SUMMARY */}
      {/* ================================= */}

      <section className="profile-summary-section">

        <div className="dashboard-card">

          <div className="card-heading">

            <span className="card-icon">
              🎓
            </span>

            <div>

              <span className="card-overline">
                PROFILE
              </span>

              <h3>
                Academic Background
              </h3>

            </div>

          </div>

          <div className="profile-summary-grid">

            <div>
              <span>
                College
              </span>

              <strong>
                {profile?.college || "-"}
              </strong>
            </div>

            <div>
              <span>
                Course
              </span>

              <strong>
                {profile?.course || "-"}
              </strong>
            </div>

            <div>
              <span>
                Degree
              </span>

              <strong>
                {profile?.degree || "-"}
              </strong>
            </div>

            <div>
              <span>
                Year
              </span>

              <strong>
                {profile?.year_of_study
                  ? `${profile.year_of_study}${
                      profile.year_of_study === 1
                        ? "st"
                        : profile.year_of_study === 2
                        ? "nd"
                        : profile.year_of_study === 3
                        ? "rd"
                        : "th"
                    } Year`
                  : "-"}
              </strong>
            </div>

            <div>
              <span>
                Semester
              </span>

              <strong>
                {profile?.semester
                  ? `Semester ${profile.semester}`
                  : "-"}
              </strong>
            </div>

          </div>

          <button
            type="button"
            className="secondary-btn"
            onClick={() =>
              navigate("/profile")
            }
          >
            Edit Career Profile →
          </button>

        </div>

      </section>

      {/* ================================= */}
      {/* RESUME */}
      {/* ================================= */}

      <section className="resume-section">

        <div className="dashboard-card resume-card">

          <div className="card-heading">

            <span className="card-icon">
              📄
            </span>

            <div>

              <span className="card-overline">
                CAREER DOCUMENT
              </span>

              <h3>
                Resume Intelligence
              </h3>

            </div>

          </div>

          <p>
            Upload your latest resume to
            analyze your skills and update
            your CareerOS intelligence.
          </p>

          <div className="upload-area">

            <input
              id="resume-upload"
              type="file"
              accept=".pdf,application/pdf"
              onChange={(event) => {
                const file =
                  event.target.files?.[0] ||
                  null;

                setResume(file);
                setResumeMessage("");
              }}
            />

            <button
              type="button"
              className="resume-upload-btn"
              onClick={
                handleResumeUpload
              }
              disabled={
                resumeLoading
              }
            >
              {resumeLoading
                ? "Analyzing Resume..."
                : "Upload & Analyze"}
            </button>

          </div>

          {resume && (
            <p className="selected-file">
              Selected:{" "}
              <strong>
                {resume.name}
              </strong>
            </p>
          )}

          {resumeMessage && (
            <p className="resume-message">
              {resumeMessage}
            </p>
          )}

          {skillError && (
            <p className="skill-error">
              {skillError}
            </p>
          )}

        </div>

      </section>

      {/* ================================= */}
      {/* KNOWLEDGEFLOW CTA */}
      {/* ================================= */}

      <section className="knowledgeflow-section">

        <div className="knowledgeflow-card">

          <div className="knowledgeflow-content">

            <span>
              PERSONALIZED LEARNING
            </span>

            <h2>
              Turn your skill gaps
              into a learning path.
            </h2>

            <p>
              KnowledgeFlow transforms your
              missing skills into an organized
              learning journey with curated
              resources.
            </p>

          </div>

          <button
            type="button"
            className="knowledgeflow-btn"
            onClick={() =>
              navigate(
                "/knowledge-flow"
              )
            }
          >
            Open KnowledgeFlow →
          </button>

        </div>

      </section>

    </main>
  );
}

export default Dashboard;