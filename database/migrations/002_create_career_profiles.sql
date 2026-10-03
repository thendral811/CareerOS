CREATE TABLE IF NOT EXISTS career_profiles (
    id SERIAL PRIMARY KEY,

    user_id INTEGER NOT NULL UNIQUE
        REFERENCES users(id)
        ON DELETE CASCADE,

    college VARCHAR(255),
    course VARCHAR(255),
    degree VARCHAR(100),
    year_of_study INTEGER,
    semester INTEGER,

    target_role VARCHAR(255),
    experience_level VARCHAR(100),

    interests TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);