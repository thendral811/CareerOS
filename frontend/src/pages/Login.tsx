import { useState } from "react";
import { useNavigate } from "react-router-dom";
import "./Login.css";

function Login() {
  const navigate = useNavigate();

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const [emailError, setEmailError] = useState("");
  const [passwordError, setPasswordError] = useState("");

  const [loading, setLoading] = useState(false);

  const handleSubmit = async (
    e: React.FormEvent<HTMLFormElement>
  ) => {
    e.preventDefault();

    console.log("CAREEROS LOGIN BUTTON WORKING");

    setEmailError("");
    setPasswordError("");

    let valid = true;

    // EMAIL VALIDATION
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (email.trim() === "") {
      setEmailError("Email is required");
      valid = false;
    } else if (!emailPattern.test(email.trim())) {
      setEmailError("Invalid email address");
      valid = false;
    }

    // PASSWORD VALIDATION
    if (password === "") {
      setPasswordError("Password is required");
      valid = false;
    } else if (password.length < 6) {
      setPasswordError(
        "Password must be at least 6 characters"
      );
      valid = false;
    }

    // STOP IF INVALID
    if (!valid) {
      return;
    }

    // LOGIN WITH BACKEND
    setLoading(true);

    try {
      console.log("Sending login request...");

      const response = await fetch(
        "http://localhost:5000/api/auth/login",
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            email: email.trim(),
            password: password,
          }),
        }
      );

      const data = await response.json();

      console.log("Backend response:", data);

      // LOGIN FAILED
      if (!response.ok) {
        setPasswordError(
          data.message || "Invalid email or password"
        );
        return;
      }

      // LOGIN SUCCESSFUL
      console.log("Login successful!");
      console.log("User:", data.user);

      // SAVE JWT TOKEN
      localStorage.setItem("token", data.token);

      // SAVE USER INFORMATION
      localStorage.setItem(
        "user",
        JSON.stringify(data.user)
      );

      console.log("JWT saved to localStorage");
      console.log("User saved to localStorage");

      // CHECK CAREER PROFILE
      console.log("Checking career profile...");

      const profileResponse = await fetch(
        "http://localhost:5000/api/profile",
        {
          method: "GET",
          headers: {
            Authorization: `Bearer ${data.token}`,
          },
        }
      );

      console.log(
        "Profile response status:",
        profileResponse.status
      );

      // PROFILE EXISTS
      if (profileResponse.ok) {
        console.log(
          "Career profile exists. Going to dashboard."
        );

        navigate("/dashboard");
        return;
      }

      // PROFILE DOES NOT EXIST
      if (profileResponse.status === 404) {
        console.log(
          "Career profile not found. Going to profile page."
        );

        navigate("/profile");
        return;
      }

      // OTHER PROFILE ERROR
      setPasswordError(
        "Unable to check your career profile"
      );
    } catch (error) {
      console.error("Login error:", error);

      setPasswordError(
        "Unable to connect to CareerOS server"
      );
    } finally {
      setLoading(false);
    }
  };

  return (
    <main className="container">
      {/* CareerOS Title */}
      <h1 className="button">
        CareerOS
      </h1>

      {/* Description */}
      <p className="description">
        CareerOS is an AI-powered career and learning
        platform that helps students discover the skills
        they need, identify their skill gaps, and build
        personalized learning paths to reach their dream
        career.
      </p>

      {/* Login Section */}
      <section className="login-box">
        <h2>Login</h2>

        <form onSubmit={handleSubmit} noValidate>
          {/* EMAIL */}
          <div className="input-group">
            <input
              type="email"
              placeholder="Email"
              value={email}
              autoComplete="email"
              className={
                emailError ? "input-error" : ""
              }
              onChange={(e) => {
                setEmail(e.target.value);
                setEmailError("");
              }}
            />

            {emailError && (
              <span className="error-message">
                {emailError}
              </span>
            )}
          </div>

          {/* PASSWORD */}
          <div className="input-group">
            <input
              type="password"
              placeholder="Password"
              value={password}
              autoComplete="current-password"
              className={
                passwordError ? "input-error" : ""
              }
              onChange={(e) => {
                setPassword(e.target.value);
                setPasswordError("");
              }}
            />

            {passwordError && (
              <span className="error-message">
                {passwordError}
              </span>
            )}
          </div>

          {/* FORGOT PASSWORD */}
          <a
            href="#"
            className="forgot"
            onClick={(e) => {
              e.preventDefault();
              console.log("Forgot password clicked");
            }}
          >
            Forgot your password?
          </a>

          {/* LOGIN BUTTON */}
          <button
            type="submit"
            className="login-btn"
            disabled={loading}
          >
            {loading
              ? "Logging in..."
              : "Login"}
          </button>

          {/* REGISTER */}
          <p className="register">
            New to CareerOS?{" "}

            <a
              href="/register"
              onClick={(e) => {
                e.preventDefault();
                navigate("/register");
              }}
            >
              Create an account
            </a>
          </p>
        </form>
      </section>
    </main>
  );
}

export default Login;
