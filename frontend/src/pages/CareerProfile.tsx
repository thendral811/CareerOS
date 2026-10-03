
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import "./CareerProfile.css";
import CustomDropdown from "../components/CustomDropdown";

const departmentOptions = [
  {
    value: "1",
    label: "Computer Science & Engineering",
  },
  {
    value: "2",
    label: "Electronics & Communication Engineering",
  },
  {
    value: "3",
    label: "Electrical & Electronics Engineering",
  },
  {
    value: "4",
    label: "Mechanical Engineering",
  },
  {
    value: "5",
    label: "Civil Engineering",
  },
  {
    value: "6",
    label: "Information Technology",
  },
  {
    value: "7",
    label: "Artificial Intelligence & Data Science",
  },
  {
    value: "8",
    label: "Artificial Intelligence & Machine Learning",
  },
  {
    value: "9",
    label: "Chemical Engineering",
  },
  {
    value: "10",
    label: "Biomedical Engineering",
  },
];

const yearOptions = [
  {
    value: "1",
    label: "1st Year",
  },
  {
    value: "2",
    label: "2nd Year",
  },
  {
    value: "3",
    label: "3rd Year",
  },
  {
    value: "4",
    label: "4th Year",
  },
];

const semesterOptions = [
  {
    value: "1",
    label: "Semester 1",
  },
  {
    value: "2",
    label: "Semester 2",
  },
  {
    value: "3",
    label: "Semester 3",
  },
  {
    value: "4",
    label: "Semester 4",
  },
  {
    value: "5",
    label: "Semester 5",
  },
  {
    value: "6",
    label: "Semester 6",
  },
  {
    value: "7",
    label: "Semester 7",
  },
  {
    value: "8",
    label: "Semester 8",
  },
];

const experienceOptions = [
  {
    value: "Beginner",
    label: "Beginner",
  },
  {
    value: "Intermediate",
    label: "Intermediate",
  },
  {
    value: "Advanced",
    label: "Advanced",
  },
];

interface RoleOption {
  value: string;
  label: string;
}

function CareerProfile() {
  const navigate = useNavigate();

  const [college, setCollege] = useState("");
  const [course, setCourse] = useState("");
  const [degree, setDegree] = useState("");
  const [yearOfStudy, setYearOfStudy] = useState("");
  const [semester, setSemester] = useState("");
  const [targetRole, setTargetRole] = useState("");
  const [experienceLevel, setExperienceLevel] = useState("");
  const [interests, setInterests] = useState("");

  // Career role states
  const [roleOptions, setRoleOptions] = useState<RoleOption[]>([]);
  const [loadingRoles, setLoadingRoles] = useState(false);

  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);
  const [loadingProfile, setLoadingProfile] = useState(true);
  const [isEditing, setIsEditing] = useState(false);

  /*
    Load career roles whenever the department changes.
  */
  useEffect(() => {
    const loadRoles = async () => {
      if (!course) {
        setRoleOptions([]);
        setTargetRole("");
        return;
      }

      try {
        setLoadingRoles(true);
        setError("");

        const response = await fetch(
          `http://localhost:5000/api/career/roles/${course}`
        );

        const data = await response.json();

        if (!response.ok) {
          setRoleOptions([]);
          setTargetRole("");
          setError(
            data.message || "Unable to load career roles"
          );
          return;
        }

        const roles: RoleOption[] = (data.roles || []).map(
          (role: {
            id: number;
            name: string;
            description: string;
          }) => ({
            value: String(role.id),
            label: role.name,
          })
        );

        setRoleOptions(roles);

        /*
          If the currently saved target role exists
          in this department, keep it.
        */
        setTargetRole((currentRole) => {
          const roleExists = roles.some(
            (role) => role.label === currentRole
          );

          return roleExists ? currentRole : "";
        });
      } catch (error) {
        console.error("Load career roles error:", error);

        setRoleOptions([]);
        setTargetRole("");

        setError(
          "Unable to connect to CareerOS server"
        );
      } finally {
        setLoadingRoles(false);
      }
    };

    loadRoles();
  }, [course]);

  /*
    Load existing profile.
  */
  useEffect(() => {
    const loadProfile = async () => {
      const token = localStorage.getItem("token");

      if (!token) {
        navigate("/");
        return;
      }

      try {
        const response = await fetch(
          "http://localhost:5000/api/profile",
          {
            method: "GET",
            headers: {
              Authorization: `Bearer ${token}`,
            },
          }
        );

        if (response.status === 404) {
          setIsEditing(false);
          setLoadingProfile(false);
          return;
        }

        const data = await response.json();

        if (!response.ok) {
          setError(
            data.message || "Unable to load profile"
          );
          setLoadingProfile(false);
          return;
        }

        const profile = data.profile;

        setCollege(profile.college || "");

        /*
          Existing backend stores the department
          in the "course" field.
        */
        setCourse(profile.course || "");

        setDegree(profile.degree || "");

        setYearOfStudy(
          profile.year_of_study
            ? String(profile.year_of_study)
            : ""
        );

        setSemester(
          profile.semester
            ? String(profile.semester)
            : ""
        );

        setTargetRole(profile.target_role || "");

        setExperienceLevel(
          profile.experience_level || ""
        );

        setInterests(profile.interests || "");

        setIsEditing(true);
      } catch (error) {
        console.error("Load profile error:", error);

        setError(
          "Unable to connect to CareerOS server"
        );
      } finally {
        setLoadingProfile(false);
      }
    };

    loadProfile();
  }, [navigate]);

  /*
    Save profile.
  */
  const handleSubmit = async (
    e: React.FormEvent<HTMLFormElement>
  ) => {
    e.preventDefault();

    setError("");

    if (!college.trim()) {
      setError("College is required");
      return;
    }

    if (!course) {
      setError("Department is required");
      return;
    }

    if (!degree.trim()) {
      setError("Degree is required");
      return;
    }

    if (!yearOfStudy) {
      setError("Year of study is required");
      return;
    }

    if (!semester) {
      setError("Semester is required");
      return;
    }

    if (!targetRole) {
      setError("Target role is required");
      return;
    }

    if (!experienceLevel) {
      setError("Experience level is required");
      return;
    }

    setLoading(true);

    try {
      const token = localStorage.getItem("token");

      if (!token) {
        setError("Please login again");
        navigate("/");
        return;
      }

      const response = await fetch(
        "http://localhost:5000/api/profile",
        {
          method: isEditing ? "PUT" : "POST",

          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${token}`,
          },

          body: JSON.stringify({
            college: college.trim(),

            // Keep existing backend field as "course"
            course: course,

            degree: degree.trim(),

            year_of_study: Number(yearOfStudy),

            semester: Number(semester),

            /*
              Save the role NAME because the existing
              profile backend currently uses target_role.
            */
            target_role:
              roleOptions.find(
                (role) => role.value === targetRole
              )?.label || "",

            experience_level: experienceLevel,

            interests: interests.trim(),
          }),
        }
      );

      const data = await response.json();

      console.log("Profile response:", data);

      if (!response.ok) {
        setError(
          data.message || "Unable to save profile"
        );
        return;
      }

      navigate("/dashboard");
    } catch (error) {
      console.error("Profile error:", error);

      setError(
        "Unable to connect to CareerOS server"
      );
    } finally {
      setLoading(false);
    }
  };

  if (loadingProfile) {
    return (
      <main className="profile-container">
        <div className="profile-loading">
          Loading your profile...
        </div>
      </main>
    );
  }

  return (
    <main className="profile-container">

      <h1 className="profile-title">
        CareerOS
      </h1>

      <p className="profile-description">
        {isEditing
          ? "Update your information and keep your career journey up to date."
          : "Tell us about yourself so CareerOS can personalize your career journey."}
      </p>

      <section className="profile-box">

        <h2>
          {isEditing
            ? "Edit Your Career Profile"
            : "Complete Your Career Profile"}
        </h2>

        <p className="profile-subtitle">
          {isEditing
            ? "Update your background, interests, and career goals."
            : "This information will help us understand your background, interests, and career goals."}
        </p>

        <form
          onSubmit={handleSubmit}
          noValidate
        >

          {/* COLLEGE */}

          <div className="input-group">

            <label>
              College
            </label>

            <input
              type="text"
              placeholder="Enter your college"
              value={college}
              onChange={(e) => {
                setCollege(e.target.value);
                setError("");
              }}
            />

          </div>


          {/* DEPARTMENT */}

          <div className="input-group">

            <CustomDropdown
              label="Department"
              value={course}
              options={departmentOptions}
              placeholder="Select your department"
              onChange={(value) => {
                /*
                  Changing department automatically
                  clears the previous target role.
                */
                setCourse(value);
                setTargetRole("");
                setRoleOptions([]);
                setError("");
              }}
            />

          </div>


          {/* DEGREE */}

          <div className="input-group">

            <label>
              Degree
            </label>

            <input
              type="text"
              placeholder="e.g. B.E"
              value={degree}
              onChange={(e) => {
                setDegree(e.target.value);
                setError("");
              }}
            />

          </div>


          {/* YEAR + SEMESTER */}

          <div className="profile-row">

            {/* YEAR */}

            <div className="input-group">

              <CustomDropdown
                label="Year of Study"
                value={yearOfStudy}
                options={yearOptions}
                placeholder="Select year"
                onChange={(value) => {
                  setYearOfStudy(value);
                  setError("");
                }}
              />

            </div>


            {/* SEMESTER */}

            <div className="input-group">

              <CustomDropdown
                label="Semester"
                value={semester}
                options={semesterOptions}
                placeholder="Select semester"
                onChange={(value) => {
                  setSemester(value);
                  setError("");
                }}
              />

            </div>

          </div>


          {/* TARGET ROLE */}

          <div className="input-group">

            <CustomDropdown
              label="Target Role"
              value={targetRole}
              options={roleOptions}
              placeholder={
                !course
                  ? "Select department first"
                  : loadingRoles
                  ? "Loading roles..."
                  : "Select your target role"
              }
              disabled={!course || loadingRoles}
              onChange={(value) => {
                setTargetRole(value);
                setError("");
              }}
            />

          </div>


          {/* EXPERIENCE LEVEL */}

          <div className="input-group">

            <CustomDropdown
              label="Experience Level"
              value={experienceLevel}
              options={experienceOptions}
              placeholder="Select experience level"
              onChange={(value) => {
                setExperienceLevel(value);
                setError("");
              }}
            />

          </div>


          {/* INTERESTS */}

          <div className="input-group">

            <label>
              Interests
            </label>

            <textarea
              placeholder="e.g. Web Development, AI, DSA, Cloud"
              value={interests}
              onChange={(e) => {
                setInterests(e.target.value);
                setError("");
              }}
              rows={3}
            />

          </div>


          {/* ERROR */}

          {error && (
            <p className="profile-error">
              {error}
            </p>
          )}


          {/* SAVE BUTTON */}

          <button
            type="submit"
            className="profile-btn"
            disabled={loading}
          >
            {loading
              ? "Saving..."
              : isEditing
              ? "Update Profile"
              : "Save & Continue"}
          </button>


          {/* CANCEL */}

          {isEditing && (
            <button
              type="button"
              className="profile-cancel-btn"
              onClick={() => navigate("/dashboard")}
            >
              Cancel
            </button>
          )}

        </form>

      </section>

    </main>
  );
}

export default CareerProfile;
