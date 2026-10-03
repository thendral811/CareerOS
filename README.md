# CareerOS 🚀

### Adaptive Personal Career & Learning Intelligence Platform

CareerOS is an AI-powered platform that helps students understand **what skills they need for their target career, what skills they already have, what skills they are missing, and what they should learn next.**

CareerOS is designed for students across **different engineering courses and departments**, not only Computer Science.

---

## 🎯 What Does CareerOS Do?

A student can:

1. Create a career profile
2. Select their course and department
3. Select a target career
4. Upload their resume
5. Extract skills from the resume
6. Compare their skills with the skills required for the career
7. Identify skill gaps
8. See their readiness percentage
9. Get personalized learning resources through KnowledgeFlow

***************************************************************************************************

### CareerOS Flow

```text
Career Profile
      ↓
Course / Department
      ↓
Target Career
      ↓
Required Skills
      ↓
Upload Resume
      ↓
Resume Skill Extraction
      ↓
Skill Analysis
      ↓
Skill Gap
      ↓
Readiness Percentage
      ↓
KnowledgeFlow
      ↓
Start Learning
```

*********************************************************************************************---
***************************************************************************************************
# ✨ Main Features

### 👤 Career Profile

Students can create and update their career information:

* Course
* Department
* Year of study
* Semester
* Target career
* Experience level
* Interests

**************************************************************************************************---
**************************************************************************************************
### 🎓 Multiple Engineering Domains

CareerOS is designed to support different engineering disciplines.

Currently included:

* Computer Science and Engineering
* Information Technology
* Electronics and Communication Engineering
* Electrical and Electronics Engineering
* Mechanical Engineering
* Civil Engineering
* Artificial Intelligence and Data Science
* Artificial Intelligence and Machine Learning
* Chemical Engineering
* Biomedical Engineering

More departments can be added later.

**************************************************************************************************---
***************************************************************************************************
### 💼 Career Roles

CareerOS currently contains **110 career roles**.

Examples:

* Software Engineer
* Full Stack Developer
* Frontend Developer
* Backend Developer
* Web Developer
* Data Analyst
* Data Scientist
* AI Engineer
* Cybersecurity Engineer
* Embedded Systems Engineer
* VLSI Design Engineer
* Mechanical Engineer
* Civil Engineer
* Environmental Engineer
* Chemical Engineer
* Biomedical Engineer

***************************************---
***************************************************************************************************
### 📄 Resume Intelligence

Students can upload a PDF resume.

CareerOS processes the resume and extracts relevant skills.

Example:

```text
Python
SQL
MySQL
DBMS
Git
Machine Learning
Deep Learning
Power BI
Tableau
```

*---
***************************************************************************************************
### 🧠 AI Skill Analysis

CareerOS compares:

```text
Skills found in resume
          +
Skills required for target career
          ↓
     Skill Analysis
```

The system identifies:

* Matched skills
* Missing skills
* Required skills
* Skill importance
* Readiness percentage

*---
***************************************************************************************************
### 📊 Skill Gap Analysis

The system identifies the skills a student needs to develop.

For example:

```text
Target Career: Software Engineer

Matched Skills
✓ Python
✓ SQL
✓ Git
✓ DBMS

Skills To Develop
○ Data Structures
○ Algorithms
○ Object Oriented Programming
```

***************************************************************************************************

### 🌊 KnowledgeFlow

KnowledgeFlow is the learning intelligence layer of CareerOS.

After identifying skill gaps, students can click:

```text
Start Learning
```

and access an external learning resource for that skill.

***************************************************************************************************

# 🏗️ Project Architecture

```text
                         CareerOS
                            │
             ┌──────────────┼──────────────┐
             │              │              │
             ▼              ▼              ▼
        Frontend         Backend           AI
      React + TS       Node + Express     Python
             │              │
             │              ▼
             │         PostgreSQL
             │              │
             └──────────────┘
```

***************************************************************************************************

# 🛠️ Technology Stack

| Part               | Technology                  |
| ------------------ | --------------------------- |
| Frontend           | React                       |
| Language           | TypeScript                  |
| Build Tool         | Vite                        |
| Backend            | Node.js                     |
| API                | Express                     |
| Backend Language   | TypeScript                  |
| Authentication     | JWT + bcrypt                |
| Database           | PostgreSQL                  |
| Database Tool      | pgAdmin 4                   |
| AI / Processing    | Python                      |
| Resume Processing  | PDF parsing                 |
| Learning Resources | External learning platforms |

***************************************************************************************************

# 📁 Project Structure

```text
CareerOS/
│
├── ai/
│   ├── resume_parser/
│   ├── skill_extraction/
│   ├── skill_gap/
│   ├── a.py
│   └── requirements.txt
│
├── backend/
│   ├── src/
│   ├── package.json
│   ├── package-lock.json
│   ├── tsconfig.json
│   └── .env.example
│
├── database/
│   └── careeros.sql
│
├── frontend/
│   ├── src/
│   ├── public/
│   ├── package.json
│   ├── package-lock.json
│   ├── tsconfig.json
│   └── vite.config.ts
│
├── .gitignore
└── README.md
```

***************************************************************************************************

# 💻 Requirements

Before running CareerOS, install:

### 1. Node.js

Install Node.js and npm.

Check installation:

```powershell
node --version
npm --version
```

***************************************************************************************************

### 2. Python

Check:

```powershell
python --version
```

***************************************************************************************************

### 3. PostgreSQL

Install PostgreSQL.

You can use **pgAdmin 4** to manage the database.

Check that PostgreSQL is running before starting CareerOS.

***************************************************************************************************

# ⚙️ Installation

## Step 1 — Clone the Repository

Open PowerShell:

```powershell
git clone <YOUR_GITHUB_REPOSITORY_URL>
```

Enter the project:

```powershell
cd CareerOS
```

---

# 🗄️ Step 2 — Set Up PostgreSQL

Open **pgAdmin 4**.

Create a new database:

```text
Database Name:
careeros
```

Then restore/import:

```text
database/careeros.sql
```

The SQL file contains the CareerOS database structure and initial data.

It includes data for:

* Departments
* Career roles
* Skills
* Role-skill mappings
* Department-role mappings
* Skill relationships
* Other CareerOS tables

---

# 🔐 Step 3 — Configure Backend

Open a terminal:

```powershell
cd backend
```

Install backend dependencies:

```powershell
npm install
```

Create:

```text
backend/.env
```

Copy the structure from:

```text
backend/.env.example
```

Your `.env` should contain:

```env
PORT=5000

DB_HOST=localhost
DB_PORT=5432
DB_NAME=careeros
DB_USER=postgres
DB_PASSWORD=YOUR_POSTGRES_PASSWORD

JWT_SECRET=YOUR_SECRET_KEY
```

Replace the PostgreSQL password with your own local password.

Create your own JWT secret.

### ⚠️ Important

Never upload:

```text
backend/.env
```

to GitHub.

Only:

```text
backend/.env.example
```

should be uploaded.

---

# ▶️ Step 4 — Run the Backend

Open **Terminal 1**.

From the project root:

```powershell
cd backend
```

Run:

```powershell
npm run dev
```

The backend should start at:

```text
http://localhost:5000
```

You should see something similar to:

```text
CareerOS Backend running on http://localhost:5000
```

### Keep this terminal running.

---

# 💻 Step 5 — Run the Frontend

Open **Terminal 2**.

From the project root:

```powershell
cd frontend
```

Install dependencies:

```powershell
npm install
```

Run the frontend:

```powershell
npm run dev
```

Vite will show something similar to:

```text
Local: http://localhost:5173/
```

Open:

```text
http://localhost:5173
```

in your browser.

---

# 🤖 Step 6 — Python / AI Setup

From the project root:

```powershell
python -m venv venv
```

Activate the virtual environment:

```powershell
.\venv\Scripts\Activate.ps1
```

Install AI dependencies:

```powershell
pip install -r ai\requirements.txt
```

***************************************************************************************************

# 🚀 How to Run CareerOS

Every time you want to run the project locally:

### 1. Start PostgreSQL

Make sure PostgreSQL is running.

---

### 2. Start Backend

Open **Terminal 1**:

```powershell
cd CareerOS\backend
npm run dev
```

Keep it running.

---

### 3. Start Frontend

Open **Terminal 2**:

```powershell
cd CareerOS\frontend
npm run dev
```

Keep it running.

---

### 4. Open CareerOS

Go to:

```text
http://localhost:5173
```

***************************************************************************************************

# 🔄 Complete User Flow

Once the application is running:

```text
Open CareerOS
      ↓
Register
      ↓
Login
      ↓
Create Career Profile
      ↓
Select Course
      ↓
Select Department
      ↓
Select Target Career
      ↓
Upload Resume
      ↓
Resume Skill Extraction
      ↓
AI Skill Analysis
      ↓
View Readiness
      ↓
View Skill Gap
      ↓
Open KnowledgeFlow
      ↓
Click Start Learning
```

***************************************************************************************************

# 🧪 Testing the Project

### Test Backend

Open:

```text
http://localhost:5000
```

The backend should respond that CareerOS is running.

### Test Frontend

Open:

```text
http://localhost:5173
```

The CareerOS login page should appear.

### Test Database

Open pgAdmin and verify:

```text
Databases
└── careeros
    └── Schemas
        └── public
            └── Tables
```

---

# 🔒 Security

The following files should **never** be committed to GitHub:

```text
.env
node_modules/
venv/
uploads/
personal resumes
passwords
JWT secrets
API keys
```

These are excluded using `.gitignore`.

***************************************************************************************************

# 🔮 Future Development

Future versions of CareerOS may include:

* More career roles
* More engineering disciplines
* Improved AI resume analysis
* Better skill extraction
* Advanced skill graphs
* Learning progress tracking
* Personalized learning paths
* Career analytics
* More learning resources
* CareerOS's own learning-content platform

The long-term vision is to build a complete learning ecosystem around CareerOS.

***************************************************************************************************

# 📌 Current Status

### CareerOS MVP

The core CareerOS MVP includes:

* ✅ User registration
* ✅ Login and authentication
* ✅ Career profile
* ✅ Course selection
* ✅ Department selection
* ✅ Career role selection
* ✅ Resume PDF upload
* ✅ Resume skill extraction
* ✅ Skill analysis
* ✅ Skill gap analysis
* ✅ Readiness percentage
* ✅ KnowledgeFlow
* ✅ External learning resources
* ✅ Multi-engineering-domain support
* ✅ 110 career roles

***************************************************************************************************

## 👨‍💻 Project

**CareerOS — Adaptive Personal Career & Learning Intelligence Platform**

A student project combining:

```text
Career Intelligence
        +
Artificial Intelligence
        +
Resume Analysis
        +
Skill Graphs
        +
Skill Gap Analysis
        +
Personalized Learning
