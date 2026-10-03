import { Routes, Route, Navigate } from "react-router-dom";

import Login from "./pages/Login";
import Register from "./components/Register";
import CareerProfile from "./pages/CareerProfile";
import Dashboard from "./pages/Dashboard";
import KnowledgeFlow from "./pages/KnowledgeFlow";
import ProtectedRoute from "./components/ProtectedRoute";

function App() {
  return (
    <Routes>
      {/* Public Routes */}

      <Route
        path="/"
        element={<Login />}
      />

      <Route
        path="/register"
        element={<Register />}
      />

      {/* Protected Routes */}

      <Route element={<ProtectedRoute />}>
        <Route
          path="/profile"
          element={<CareerProfile />}
        />

        <Route
          path="/dashboard"
          element={<Dashboard />}
        />

        <Route
          path="/knowledge-flow"
          element={<KnowledgeFlow />}
        />
      </Route>

      {/* Unknown Routes */}

      <Route
        path="*"
        element={
          <Navigate
            to="/"
            replace
          />
        }
      />
    </Routes>
  );
}

export default App;