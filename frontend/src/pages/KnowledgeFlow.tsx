import { useEffect, useState } from "react";
import { useNavigate, useSearchParams } from "react-router-dom";
import "./KnowledgeFlow.css";
import { getLearningUrl } from "../utils/learningLinks";

interface LearningResource {
  id: number;
  title: string;
  provider: string;
  url: string;
  resourceType: string;
  difficulty: string;
  estimatedHours: number;
  description: string;
  priority: number;
}

interface LearningSkill {
  id: number;
  name: string;
  category: string;
  subcategory: string;
  importance: string;
}

interface LearningPathItem {
  order: number;
  skill: LearningSkill;
  resources: LearningResource[];
}

interface KnowledgeFlowData {
  targetRole: string;
  roleDescription: string;
  readinessPercentage: number;
  totalSkillsToDevelop: number;
  totalLearningHours: number;
  learningPath: LearningPathItem[];
  message?: string;
}

function KnowledgeFlow() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();

  const selectedSkill = searchParams.get("skill");

  const [data, setData] =
    useState<KnowledgeFlowData | null>(null);

  const [loading, setLoading] =
    useState(true);

  const [error, setError] =
    useState("");

  useEffect(() => {
    const fetchKnowledgeFlow = async () => {
      const token =
        localStorage.getItem("token");

      if (!token) {
        navigate("/");
        return;
      }

      try {
        const response = await fetch(
          "http://localhost:5000/api/knowledge-flow",
          {
            method: "GET",
            headers: {
              Authorization:
                `Bearer ${token}`,
            },
          }
        );

        const result =
          await response.json();

        if (!response.ok) {
          setError(
            result.message ||
              "Unable to load KnowledgeFlow"
          );
          return;
        }

        setData(result);
      } catch (error) {
        console.error(
          "KnowledgeFlow fetch error:",
          error
        );

        setError(
          "Unable to connect to CareerOS server"
        );
      } finally {
        setLoading(false);
      }
    };

    fetchKnowledgeFlow();
  }, [navigate]);

  const handleLogout = () => {
    localStorage.removeItem("token");
    localStorage.removeItem("user");

    navigate("/");
  };

  /*
   * Opens the external learning platform
   * for the selected skill.
   *
   * Later this function can be changed to
   * open our own CareerOS learning platform.
   */
  const handleStartLearning = (skillName: string) => {
    const learningUrl =
      getLearningUrl(skillName);

    window.open(
      learningUrl,
      "_blank",
      "noopener,noreferrer"
    );
  };

  /*
   * When a skill is selected from Dashboard,
   * scroll directly to that skill in KnowledgeFlow.
   */
  useEffect(() => {
    if (
      !selectedSkill ||
      loading ||
      !data
    ) {
      return;
    }

    const timer = setTimeout(() => {
      const element =
        document.getElementById(
          `skill-${selectedSkill
            .toLowerCase()
            .replace(/[^a-z0-9]+/g, "-")}`
        );

      if (element) {
        element.scrollIntoView({
          behavior: "smooth",
          block: "center",
        });
      }
    }, 300);

    return () => clearTimeout(timer);
  }, [
    selectedSkill,
    loading,
    data,
  ]);

  if (loading) {
    return (
      <main className="knowledge-container">
        <div className="knowledge-loading">
          <div className="loading-spinner" />

          <p>
            Building your personalized
            learning path...
          </p>
        </div>
      </main>
    );
  }

  if (error) {
    return (
      <main className="knowledge-container">
        <div className="knowledge-error">
          {error}
        </div>
      </main>
    );
  }

  if (!data) {
    return (
      <main className="knowledge-container">
        <div className="knowledge-error">
          No KnowledgeFlow data available.
        </div>
      </main>
    );
  }

  return (
    <main className="knowledge-container">

      {/* ================= HEADER ================= */}

      <header className="knowledge-header">

        <div>
          <h1>CareerOS</h1>

          <p>
            KnowledgeFlow
          </p>
        </div>

        <div className="knowledge-actions">

          <button
            className="back-dashboard-btn"
            onClick={() =>
              navigate("/dashboard")
            }
          >
            ← Dashboard
          </button>

          <button
            className="logout-btn"
            onClick={handleLogout}
          >
            Logout
          </button>

        </div>

      </header>

      {/* ================= HERO ================= */}

      <section className="knowledge-hero">

        <div className="hero-content">

          <span className="hero-label">
            PERSONALIZED LEARNING INTELLIGENCE
          </span>

          <h2>
            Build the skills needed for your
            career goal.
          </h2>

          <p>
            KnowledgeFlow turns your skill gaps
            into a structured learning journey.
          </p>

        </div>

      </section>

      {/* ================= ROLE SUMMARY ================= */}

      <section className="role-summary">

        <div className="role-card">

          <span>
            Target Role
          </span>

          <h2>
            {data.targetRole}
          </h2>

          {data.roleDescription && (
            <p>
              {data.roleDescription}
            </p>
          )}

        </div>

        <div className="readiness-card">

          <span>
            Current Readiness
          </span>

          <strong>
            {data.readinessPercentage}%
          </strong>

          <div className="progress-bar">

            <div
              className="progress-fill"
              style={{
                width:
                  `${data.readinessPercentage}%`,
              }}
            />

          </div>

        </div>

      </section>

      {/* ================= STATS ================= */}

      <section className="learning-stats">

        <div className="learning-stat">

          <strong>
            {data.totalSkillsToDevelop}
          </strong>

          <span>
            Skills to Develop
          </span>

        </div>

        <div className="learning-stat">

          <strong>
            {data.totalLearningHours}
          </strong>

          <span>
            Estimated Hours
          </span>

        </div>

        <div className="learning-stat">

          <strong>
            {data.learningPath.length}
          </strong>

          <span>
            Learning Steps
          </span>

        </div>

      </section>

      {/* ================= COMPLETE ================= */}

      {data.message ? (
        <section className="complete-card">

          <div className="complete-icon">
            🎉
          </div>

          <h2>
            Your required skills are covered!
          </h2>

          <p>
            {data.message}
          </p>

        </section>
      ) : (

        /* ================= LEARNING PATH ================= */

        <section className="learning-section">

          <div className="section-heading">

            <span>
              YOUR LEARNING JOURNEY
            </span>

            <h2>
              Follow your personalized path
            </h2>

            <p>
              Start with the first skill and
              progress through each step.
            </p>

          </div>

          <div className="learning-path">

            {data.learningPath.map(
              (item) => {

                const skillSlug =
                  item.skill.name
                    .toLowerCase()
                    .replace(
                      /[^a-z0-9]+/g,
                      "-"
                    );

                const isSelected =
                  selectedSkill?.toLowerCase() ===
                  item.skill.name.toLowerCase();

                return (
                  <article
                    className={`learning-step ${
                      isSelected
                        ? "selected-learning-step"
                        : ""
                    }`}
                    key={`${item.skill.id}-${item.order}`}
                    id={`skill-${skillSlug}`}
                  >

                    {/* STEP NUMBER */}

                    <div className="step-number">
                      {item.order}
                    </div>

                    <div className="step-content">

                      {/* ================= SKILL HEADER ================= */}

                      <div className="step-header">

                        <div>

                          <span className="skill-category">
                            {item.skill.category}
                          </span>

                          <h3>
                            {item.skill.name}
                          </h3>

                          {item.skill.subcategory && (
                            <p>
                              {item.skill.subcategory}
                            </p>
                          )}

                        </div>

                        <span
                          className={`importance ${
                            item.skill.importance ===
                            "required"
                              ? "required"
                              : "preferred"
                          }`}
                        >
                          {item.skill.importance}
                        </span>

                      </div>

                      {/* ================= SELECTED SKILL NOTICE ================= */}

                      {isSelected && (
                        <div className="selected-skill-banner">

                          <span>
                            ✦
                          </span>

                          <div>

                            <strong>
                              Your selected skill
                            </strong>

                            <p>
                              Start learning this skill
                              to improve your career
                              readiness.
                            </p>

                          </div>

                        </div>
                      )}

                      {/* ================= RESOURCES ================= */}

                      {item.resources.length > 0 ? (

                        <div className="resource-list">

                          {item.resources.map(
                            (resource) => (

                              <div
                                className="resource-card"
                                key={resource.id}
                              >

                                <div className="resource-info">

                                  <span className="resource-type">
                                    {resource.resourceType}
                                  </span>

                                  <h4>
                                    {resource.title}
                                  </h4>

                                  <p>
                                    {resource.description}
                                  </p>

                                  <div className="resource-meta">

                                    <span>
                                      📚{" "}
                                      {resource.provider}
                                    </span>

                                    <span>
                                      ⏱{" "}
                                      {
                                        resource.estimatedHours
                                      }{" "}
                                      hours
                                    </span>

                                    <span>
                                      🎚{" "}
                                      {
                                        resource.difficulty
                                      }
                                    </span>

                                  </div>

                                </div>

                                <a
                                  className="resource-btn"
                                  href={
                                    resource.url
                                  }
                                  target="_blank"
                                  rel="noopener noreferrer"
                                >
                                  Start Learning →
                                </a>

                              </div>

                            )
                          )}

                        </div>

                      ) : (

                        /* ================= EXTERNAL LEARNING ================= */

                        <div className="resource-card default-learning-card">

                          <div className="resource-info">

                            <span className="resource-type">
                              EXTERNAL LEARNING
                            </span>

                            <h4>
                              Learn{" "}
                              {item.skill.name}
                            </h4>

                            <p>
                              Explore learning resources
                              for{" "}
                              <strong>
                                {item.skill.name}
                              </strong>{" "}
                              on an external learning
                              platform.
                            </p>

                            <div className="resource-meta">

                              <span>
                                📚 GeeksforGeeks
                              </span>

                              <span>
                                🎯 Skill Gap
                              </span>

                              <span>
                                🚀 Personalized
                              </span>

                            </div>

                          </div>

                          <button
                            className="resource-btn"
                            onClick={() =>
                              handleStartLearning(
                                item.skill.name
                              )
                            }
                          >
                            Start Learning →
                          </button>

                        </div>

                      )}

                    </div>

                  </article>
                );
              }
            )}

          </div>

        </section>
      )}

    </main>
  );
}

export default KnowledgeFlow;