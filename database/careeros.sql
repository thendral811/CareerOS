--
-- PostgreSQL database dump
--

\restrict 82lRAw7pIaZWmC4LMc8rR1PdBQyLM4erAMOGBwT5l2eA3QL75EGozb2mhJNrYef

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-03 17:13:59

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 32769)
-- Name: career_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.career_profiles (
    id integer NOT NULL,
    user_id integer NOT NULL,
    college character varying(255),
    course character varying(255),
    degree character varying(100),
    year_of_study integer,
    semester integer,
    target_role character varying(255),
    experience_level character varying(100),
    interests text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.career_profiles OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 32768)
-- Name: career_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.career_profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.career_profiles_id_seq OWNER TO postgres;

--
-- TOC entry 5232 (class 0 OID 0)
-- Dependencies: 223
-- Name: career_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.career_profiles_id_seq OWNED BY public.career_profiles.id;


--
-- TOC entry 246 (class 1259 OID 40989)
-- Name: career_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.career_roles (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    description text
);


ALTER TABLE public.career_roles OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 40988)
-- Name: career_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.career_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.career_roles_id_seq OWNER TO postgres;

--
-- TOC entry 5233 (class 0 OID 0)
-- Dependencies: 245
-- Name: career_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.career_roles_id_seq OWNED BY public.career_roles.id;


--
-- TOC entry 242 (class 1259 OID 40961)
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 40960)
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courses_id_seq OWNER TO postgres;

--
-- TOC entry 5234 (class 0 OID 0)
-- Dependencies: 241
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- TOC entry 250 (class 1259 OID 41026)
-- Name: department_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department_roles (
    id integer NOT NULL,
    department_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.department_roles OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 41025)
-- Name: department_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.department_roles_id_seq OWNER TO postgres;

--
-- TOC entry 5235 (class 0 OID 0)
-- Dependencies: 249
-- Name: department_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_roles_id_seq OWNED BY public.department_roles.id;


--
-- TOC entry 244 (class 1259 OID 40972)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    course_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 40971)
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departments_id_seq OWNER TO postgres;

--
-- TOC entry 5236 (class 0 OID 0)
-- Dependencies: 243
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- TOC entry 238 (class 1259 OID 32908)
-- Name: learning_resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.learning_resources (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    provider character varying(255) NOT NULL,
    url text NOT NULL,
    resource_type character varying(100) NOT NULL,
    difficulty character varying(50) DEFAULT 'beginner'::character varying,
    estimated_hours integer DEFAULT 5,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.learning_resources OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 32907)
-- Name: learning_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.learning_resources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.learning_resources_id_seq OWNER TO postgres;

--
-- TOC entry 5237 (class 0 OID 0)
-- Dependencies: 237
-- Name: learning_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.learning_resources_id_seq OWNED BY public.learning_resources.id;


--
-- TOC entry 226 (class 1259 OID 32789)
-- Name: resumes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resumes (
    id integer NOT NULL,
    user_id integer NOT NULL,
    file_name character varying(255) NOT NULL,
    file_path text NOT NULL,
    uploaded_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.resumes OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 32788)
-- Name: resumes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resumes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.resumes_id_seq OWNER TO postgres;

--
-- TOC entry 5238 (class 0 OID 0)
-- Dependencies: 225
-- Name: resumes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resumes_id_seq OWNED BY public.resumes.id;


--
-- TOC entry 252 (class 1259 OID 41048)
-- Name: role_aliases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_aliases (
    id integer NOT NULL,
    role_id integer NOT NULL,
    alias character varying(150) NOT NULL
);


ALTER TABLE public.role_aliases OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 41047)
-- Name: role_aliases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_aliases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_aliases_id_seq OWNER TO postgres;

--
-- TOC entry 5239 (class 0 OID 0)
-- Dependencies: 251
-- Name: role_aliases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_aliases_id_seq OWNED BY public.role_aliases.id;


--
-- TOC entry 236 (class 1259 OID 32885)
-- Name: role_requirements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_requirements (
    id integer NOT NULL,
    role_id integer NOT NULL,
    skill_id integer NOT NULL,
    importance character varying(50) DEFAULT 'required'::character varying
);


ALTER TABLE public.role_requirements OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 32884)
-- Name: role_requirements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_requirements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_requirements_id_seq OWNER TO postgres;

--
-- TOC entry 5240 (class 0 OID 0)
-- Dependencies: 235
-- Name: role_requirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_requirements_id_seq OWNED BY public.role_requirements.id;


--
-- TOC entry 248 (class 1259 OID 41002)
-- Name: role_skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_skills (
    id integer NOT NULL,
    role_id integer NOT NULL,
    skill_id integer NOT NULL,
    importance integer DEFAULT 3,
    CONSTRAINT role_skills_importance_check CHECK (((importance >= 1) AND (importance <= 5)))
);


ALTER TABLE public.role_skills OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 41001)
-- Name: role_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_skills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_skills_id_seq OWNER TO postgres;

--
-- TOC entry 5241 (class 0 OID 0)
-- Dependencies: 247
-- Name: role_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_skills_id_seq OWNED BY public.role_skills.id;


--
-- TOC entry 234 (class 1259 OID 32871)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 32870)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 5242 (class 0 OID 0)
-- Dependencies: 233
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 232 (class 1259 OID 32848)
-- Name: skill_relationships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skill_relationships (
    id integer NOT NULL,
    source_skill_id integer NOT NULL,
    target_skill_id integer NOT NULL,
    relationship_type character varying(100) NOT NULL
);


ALTER TABLE public.skill_relationships OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 32847)
-- Name: skill_relationships_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skill_relationships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.skill_relationships_id_seq OWNER TO postgres;

--
-- TOC entry 5243 (class 0 OID 0)
-- Dependencies: 231
-- Name: skill_relationships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skill_relationships_id_seq OWNED BY public.skill_relationships.id;


--
-- TOC entry 240 (class 1259 OID 32925)
-- Name: skill_resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skill_resources (
    id integer NOT NULL,
    skill_id integer NOT NULL,
    resource_id integer NOT NULL,
    priority integer DEFAULT 1
);


ALTER TABLE public.skill_resources OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 32924)
-- Name: skill_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skill_resources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.skill_resources_id_seq OWNER TO postgres;

--
-- TOC entry 5244 (class 0 OID 0)
-- Dependencies: 239
-- Name: skill_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skill_resources_id_seq OWNED BY public.skill_resources.id;


--
-- TOC entry 228 (class 1259 OID 32810)
-- Name: skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skills (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    category character varying(100) NOT NULL,
    subcategory character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.skills OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 32809)
-- Name: skills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.skills_id_seq OWNER TO postgres;

--
-- TOC entry 5245 (class 0 OID 0)
-- Dependencies: 227
-- Name: skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skills_id_seq OWNED BY public.skills.id;


--
-- TOC entry 230 (class 1259 OID 32824)
-- Name: user_skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_skills (
    id integer NOT NULL,
    user_id integer NOT NULL,
    skill_id integer NOT NULL,
    source character varying(100) DEFAULT 'resume'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.user_skills OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 32823)
-- Name: user_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_skills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_skills_id_seq OWNER TO postgres;

--
-- TOC entry 5246 (class 0 OID 0)
-- Dependencies: 229
-- Name: user_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_skills_id_seq OWNED BY public.user_skills.id;


--
-- TOC entry 222 (class 1259 OID 24578)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24577)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5247 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4935 (class 2604 OID 32772)
-- Name: career_profiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_profiles ALTER COLUMN id SET DEFAULT nextval('public.career_profiles_id_seq'::regclass);


--
-- TOC entry 4958 (class 2604 OID 40992)
-- Name: career_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_roles ALTER COLUMN id SET DEFAULT nextval('public.career_roles_id_seq'::regclass);


--
-- TOC entry 4956 (class 2604 OID 40964)
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- TOC entry 4961 (class 2604 OID 41029)
-- Name: department_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_roles ALTER COLUMN id SET DEFAULT nextval('public.department_roles_id_seq'::regclass);


--
-- TOC entry 4957 (class 2604 OID 40975)
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- TOC entry 4950 (class 2604 OID 32911)
-- Name: learning_resources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.learning_resources ALTER COLUMN id SET DEFAULT nextval('public.learning_resources_id_seq'::regclass);


--
-- TOC entry 4938 (class 2604 OID 32792)
-- Name: resumes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resumes ALTER COLUMN id SET DEFAULT nextval('public.resumes_id_seq'::regclass);


--
-- TOC entry 4962 (class 2604 OID 41051)
-- Name: role_aliases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_aliases ALTER COLUMN id SET DEFAULT nextval('public.role_aliases_id_seq'::regclass);


--
-- TOC entry 4948 (class 2604 OID 32888)
-- Name: role_requirements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_requirements ALTER COLUMN id SET DEFAULT nextval('public.role_requirements_id_seq'::regclass);


--
-- TOC entry 4959 (class 2604 OID 41005)
-- Name: role_skills id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_skills ALTER COLUMN id SET DEFAULT nextval('public.role_skills_id_seq'::regclass);


--
-- TOC entry 4946 (class 2604 OID 32874)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 4945 (class 2604 OID 32851)
-- Name: skill_relationships id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill_relationships ALTER COLUMN id SET DEFAULT nextval('public.skill_relationships_id_seq'::regclass);


--
-- TOC entry 4954 (class 2604 OID 32928)
-- Name: skill_resources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill_resources ALTER COLUMN id SET DEFAULT nextval('public.skill_resources_id_seq'::regclass);


--
-- TOC entry 4940 (class 2604 OID 32813)
-- Name: skills id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills ALTER COLUMN id SET DEFAULT nextval('public.skills_id_seq'::regclass);


--
-- TOC entry 4942 (class 2604 OID 32827)
-- Name: user_skills id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_skills ALTER COLUMN id SET DEFAULT nextval('public.user_skills_id_seq'::regclass);


--
-- TOC entry 4933 (class 2604 OID 24581)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5198 (class 0 OID 32769)
-- Dependencies: 224
-- Data for Name: career_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.career_profiles (id, user_id, college, course, degree, year_of_study, semester, target_role, experience_level, interests, created_at, updated_at) FROM stdin;
2	4	coimbatore institue of technology	computer science	B.E	4	7	Ai engineer	Intermediate		2026-09-30 10:25:52.521725	2026-09-30 10:27:19.268154
1	3	Coimbatore Institute of Technology	9	B.E	4	7	Quality Assurance Engineer	Intermediate	Web Development, AI, DSA, Cloud	2026-09-26 15:50:21.349077	2026-10-03 17:06:43.197106
\.


--
-- TOC entry 5220 (class 0 OID 40989)
-- Dependencies: 246
-- Data for Name: career_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.career_roles (id, name, description) FROM stdin;
1	Software Engineer	Designs, develops, tests, and maintains software applications.
2	Full Stack Developer	Develops both frontend and backend components of web applications.
3	Frontend Developer	Builds user interfaces and client-side web applications.
4	Backend Developer	Develops server-side applications, APIs, and backend systems.
5	Web Developer	Develops and maintains websites and web applications.
6	Mobile App Developer	Develops applications for mobile platforms such as Android and iOS.
7	DevOps Engineer	Automates software development, deployment, and infrastructure processes.
8	Cloud Engineer	Designs, deploys, and manages cloud infrastructure and services.
9	Data Analyst	Analyzes data to generate insights and support business decisions.
10	Data Scientist	Uses statistics, programming, and machine learning to analyze complex data.
11	Data Engineer	Builds and maintains data pipelines, platforms, and infrastructure.
12	Business Intelligence Analyst	Analyzes organizational data and creates reports and dashboards.
13	Database Administrator	Manages databases, security, performance, and availability.
14	Machine Learning Engineer	Develops and deploys machine learning systems and models.
15	AI Engineer	Develops artificial intelligence systems and applications.
16	Deep Learning Engineer	Builds deep learning models using neural network architectures.
17	NLP Engineer	Develops systems for processing and understanding human language.
18	Computer Vision Engineer	Develops systems that analyze and understand images and video.
19	MLOps Engineer	Builds infrastructure and workflows for deploying and maintaining machine learning systems.
20	Generative AI Engineer	Develops applications using generative artificial intelligence models.
21	Cybersecurity Engineer	Designs and implements systems to protect applications and infrastructure.
22	Security Analyst	Monitors systems and investigates cybersecurity threats.
23	SOC Analyst	Monitors security events and responds to potential cyber incidents.
24	Penetration Tester	Tests systems and applications for security vulnerabilities.
25	Network Engineer	Designs, configures, and maintains computer networks.
26	Systems Engineer	Designs and manages complex computing and IT systems.
27	QA Engineer	Tests software systems to identify defects and ensure quality.
28	Automation Test Engineer	Develops automated tests for software applications.
29	Blockchain Developer	Develops applications and systems using blockchain technologies.
30	Research Scientist	Conducts research and develops new technologies and methods.
31	Embedded Systems Engineer	Develops software and systems for embedded devices.
32	Embedded Software Engineer	Develops software running on embedded hardware platforms.
33	Firmware Engineer	Develops low-level software that controls electronic hardware.
34	VLSI Design Engineer	Designs integrated circuits and digital hardware systems.
35	VLSI Verification Engineer	Verifies and validates VLSI designs.
36	ASIC Design Engineer	Designs application-specific integrated circuits.
37	FPGA Engineer	Develops and implements digital systems using FPGA technology.
38	Digital Design Engineer	Designs digital electronic circuits and systems.
39	RF Engineer	Designs and analyzes radio frequency systems.
40	Communication Engineer	Designs and develops communication systems and technologies.
41	Semiconductor Engineer	Works on semiconductor devices, fabrication, and technology.
42	Hardware Design Engineer	Designs and develops electronic hardware systems.
43	IoT Engineer	Develops connected devices and Internet of Things systems.
44	Signal Processing Engineer	Develops algorithms for processing digital and analog signals.
45	Robotics Engineer	Designs and develops robotic systems and automation technologies.
46	Control Systems Engineer	Designs systems for monitoring and controlling dynamic processes.
47	Electrical Engineer	Designs and develops electrical systems and equipment.
48	Power Systems Engineer	Works on electrical power generation, transmission, and distribution systems.
49	Power Electronics Engineer	Designs electronic systems for controlling electrical power.
50	Electrical Design Engineer	Designs electrical systems, circuits, and installations.
51	Automation Engineer	Designs and implements industrial automation systems.
52	Instrumentation Engineer	Designs measurement, control, and instrumentation systems.
53	EV Engineer	Works on electric vehicle systems, components, and technologies.
54	Renewable Energy Engineer	Develops and manages renewable energy systems.
55	Solar Energy Engineer	Designs and develops solar energy systems.
56	Mechanical Engineer	Designs, develops, and maintains mechanical systems.
57	Mechanical Design Engineer	Designs mechanical components and systems using engineering tools.
58	CAD Engineer	Creates and develops engineering designs using computer-aided design tools.
59	CAE Engineer	Uses computer-aided engineering tools for simulation and analysis.
60	Manufacturing Engineer	Develops and improves manufacturing processes.
61	Production Engineer	Manages and improves production processes and operations.
62	Quality Engineer	Ensures products and processes meet quality standards.
63	Automotive Engineer	Designs and develops automotive systems and components.
64	Automobile Design Engineer	Designs components and systems for automobiles.
65	Mechatronics Engineer	Combines mechanical, electrical, electronics, and software engineering.
66	Thermal Engineer	Analyzes and designs systems involving heat and thermal processes.
67	HVAC Engineer	Designs and manages heating, ventilation, and air-conditioning systems.
68	Industrial Engineer	Improves manufacturing and operational efficiency.
69	Maintenance Engineer	Maintains and improves machinery and industrial equipment.
70	Additive Manufacturing Engineer	Develops manufacturing processes using 3D printing technologies.
71	Aerospace Engineer	Designs and develops aircraft and aerospace systems.
72	Civil Engineer	Designs and manages infrastructure and construction projects.
73	Structural Engineer	Designs and analyzes structural systems and buildings.
74	Structural Design Engineer	Designs structural components and systems.
75	Geotechnical Engineer	Studies soil and rock behavior for construction and infrastructure projects.
76	Transportation Engineer	Plans and designs transportation systems and infrastructure.
77	Highway Engineer	Designs and manages highway and road infrastructure.
78	Construction Engineer	Manages engineering activities on construction projects.
79	Site Engineer	Supervises engineering activities at construction sites.
80	Planning Engineer	Plans and monitors engineering and construction projects.
81	Quantity Surveyor	Manages construction costs, quantities, and project estimation.
82	BIM Engineer	Uses Building Information Modeling for construction and infrastructure projects.
83	BIM Modeler	Creates and manages digital building and infrastructure models.
84	Environmental Engineer	Develops solutions for environmental protection and pollution control.
85	Water Resources Engineer	Works on water management and hydraulic infrastructure.
86	Survey Engineer	Performs surveying and measurement for engineering projects.
87	GIS Analyst	Analyzes geographic and spatial data using GIS technologies.
88	Urban Planner	Plans and develops urban areas and infrastructure.
89	Chemical Engineer	Designs and optimizes chemical processes and industrial systems.
90	Process Engineer	Designs and improves industrial processes.
91	Process Design Engineer	Designs industrial processes and process equipment.
92	Quality Control Engineer	Ensures products and processes meet specified quality requirements.
93	Quality Assurance Engineer	Develops systems and procedures to maintain product quality.
94	Plant Engineer	Manages engineering systems and operations in industrial plants.
95	Safety Engineer	Develops systems and processes to improve industrial safety.
96	Petroleum Engineer	Works on exploration, extraction, and production of petroleum resources.
97	Biochemical Engineer	Applies engineering principles to biological and biochemical processes.
98	Process Automation Engineer	Automates industrial and chemical processing systems.
99	Energy Engineer	Improves energy efficiency and develops energy systems.
100	Biomedical Engineer	Develops technologies and devices for healthcare and medicine.
101	Clinical Engineer	Manages and maintains medical equipment and healthcare technology.
102	Medical Device Engineer	Designs and develops medical devices and equipment.
103	Healthcare Technology Engineer	Develops and manages technology used in healthcare environments.
104	Rehabilitation Engineer	Develops technologies that assist rehabilitation and accessibility.
105	Biomaterials Engineer	Develops materials for biomedical and medical applications.
106	Bioinstrumentation Engineer	Develops instruments and sensors for biomedical applications.
107	Medical Imaging Engineer	Develops and works with medical imaging technologies.
108	Biomechanics Engineer	Applies engineering principles to biological movement and mechanics.
109	Regulatory Affairs Specialist	Manages regulatory requirements for healthcare and medical products.
110	Healthcare Data Analyst	Analyzes healthcare data to support clinical and operational decisions.
\.


--
-- TOC entry 5216 (class 0 OID 40961)
-- Dependencies: 242
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (id, name) FROM stdin;
1	Computer Science and Engineering
2	Electronics and Communication Engineering
3	Electrical and Electronics Engineering
4	Mechanical Engineering
5	Civil Engineering
6	Information Technology
7	Artificial Intelligence and Data Science
8	Artificial Intelligence and Machine Learning
9	Chemical Engineering
10	Biomedical Engineering
\.


--
-- TOC entry 5224 (class 0 OID 41026)
-- Dependencies: 250
-- Data for Name: department_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department_roles (id, department_id, role_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
11	1	11
12	1	12
13	1	13
14	1	14
15	1	15
16	1	16
17	1	17
18	1	18
19	1	19
20	1	20
21	1	21
22	1	22
23	1	23
24	1	24
25	1	25
26	1	26
27	1	27
28	1	28
29	1	29
30	1	30
31	2	31
32	2	32
33	2	33
34	2	34
35	2	35
36	2	36
37	2	37
38	2	38
39	2	39
40	2	40
41	2	41
42	2	42
43	2	43
44	2	44
45	2	45
46	2	46
47	3	31
48	3	32
49	3	43
50	3	45
51	3	46
52	3	47
53	3	48
54	3	49
55	3	50
56	3	51
57	3	52
58	3	53
59	3	54
60	3	55
61	4	45
62	4	46
63	4	56
64	4	57
65	4	58
66	4	59
67	4	60
68	4	61
69	4	62
70	4	63
71	4	64
72	4	65
73	4	66
74	4	67
75	4	68
76	4	69
77	4	70
78	4	71
79	5	72
80	5	73
81	5	74
82	5	75
83	5	76
84	5	77
85	5	78
86	5	79
87	5	80
88	5	81
89	5	82
90	5	83
91	5	84
92	5	85
93	5	86
94	5	87
95	5	88
96	6	1
97	6	2
98	6	3
99	6	4
100	6	5
101	6	6
102	6	7
103	6	8
104	6	9
105	6	10
106	6	11
107	6	12
108	6	13
109	6	14
110	6	15
111	6	19
112	6	20
113	6	21
114	6	22
115	6	23
116	6	24
117	6	25
118	6	26
119	6	27
120	6	28
121	6	29
122	7	1
123	7	9
124	7	10
125	7	11
126	7	12
127	7	14
128	7	15
129	7	16
130	7	17
131	7	18
132	7	19
133	7	20
134	7	30
135	8	1
136	8	9
137	8	10
138	8	14
139	8	15
140	8	16
141	8	17
142	8	18
143	8	19
144	8	20
145	8	30
146	9	89
147	9	90
148	9	91
149	9	92
150	9	93
151	9	94
152	9	95
153	9	96
154	9	97
155	9	98
156	9	99
157	10	100
158	10	101
159	10	102
160	10	103
161	10	104
162	10	105
163	10	106
164	10	107
165	10	108
166	10	109
167	10	110
\.


--
-- TOC entry 5218 (class 0 OID 40972)
-- Dependencies: 244
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (id, course_id, name) FROM stdin;
1	1	Computer Science and Engineering
2	2	Electronics and Communication Engineering
3	3	Electrical and Electronics Engineering
4	4	Mechanical Engineering
5	5	Civil Engineering
6	6	Information Technology
7	7	Artificial Intelligence and Data Science
8	8	Artificial Intelligence and Machine Learning
9	9	Chemical Engineering
10	10	Biomedical Engineering
\.


--
-- TOC entry 5212 (class 0 OID 32908)
-- Dependencies: 238
-- Data for Name: learning_resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.learning_resources (id, title, provider, url, resource_type, difficulty, estimated_hours, description, created_at) FROM stdin;
1	Python Official Tutorial	Python	https://docs.python.org/3/tutorial/	Documentation	beginner	8	Official Python tutorial covering Python fundamentals and programming concepts.	2026-09-27 11:22:24.283781
2	Data Structures and Algorithms	GeeksforGeeks	https://www.geeksforgeeks.org/dsa/dsa-tutorial/	Course	beginner	20	Learn fundamental data structures and algorithms with explanations and examples.	2026-09-27 11:22:24.283781
3	MDN JavaScript Guide	MDN	https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide	Documentation	beginner	12	JavaScript fundamentals, syntax, functions, objects and programming concepts.	2026-09-27 11:22:24.283781
4	MDN HTML	MDN	https://developer.mozilla.org/en-US/docs/Web/HTML	Documentation	beginner	8	Learn the fundamentals of HTML and semantic web development.	2026-09-27 11:22:24.283781
5	MDN CSS	MDN	https://developer.mozilla.org/en-US/docs/Web/CSS	Documentation	beginner	10	Learn CSS fundamentals, layouts, selectors and responsive design.	2026-09-27 11:22:24.283781
6	React Learn	React	https://react.dev/learn	Documentation	beginner	10	Official React learning resources covering components, state and modern React.	2026-09-27 11:22:24.283781
7	Node.js Learn	Node.js	https://nodejs.org/en/learn	Documentation	beginner	10	Official Node.js learning resources for backend JavaScript development.	2026-09-27 11:22:24.283781
8	Express Documentation	Express	https://expressjs.com/	Documentation	beginner	6	Learn how to build web servers and APIs using Express.	2026-09-27 11:22:24.283781
9	Git Documentation	Git	https://git-scm.com/doc	Documentation	beginner	6	Learn Git version control and common Git workflows.	2026-09-27 11:22:24.283781
10	GitHub Skills	GitHub	https://skills.github.com/	Interactive Course	beginner	6	Interactive exercises for learning GitHub workflows and development practices.	2026-09-27 11:22:24.283781
11	PostgreSQL Tutorial	PostgreSQL	https://www.postgresql.org/docs/current/tutorial.html	Documentation	beginner	8	Official PostgreSQL tutorial covering SQL and relational database concepts.	2026-09-27 11:22:24.283781
12	SQL Tutorial	W3Schools	https://www.w3schools.com/sql/	Tutorial	beginner	10	Learn SQL queries, filtering, joins, aggregation and database operations.	2026-09-27 11:22:24.283781
13	REST API Tutorial	MDN	https://developer.mozilla.org/en-US/docs/Glossary/REST	Documentation	beginner	5	Understand REST APIs and the fundamental concepts behind web APIs.	2026-09-27 11:22:24.283781
14	Machine Learning Crash Course	Google	https://developers.google.com/machine-learning/crash-course	Course	intermediate	15	Practical introduction to machine learning concepts and techniques.	2026-09-27 11:22:24.283781
15	TensorFlow Tutorials	TensorFlow	https://www.tensorflow.org/tutorials	Tutorial	intermediate	15	Hands-on machine learning tutorials using TensorFlow.	2026-09-27 11:22:24.283781
16	PyTorch Tutorials	PyTorch	https://docs.pytorch.org/tutorials/	Tutorial	intermediate	15	Official PyTorch tutorials for deep learning and machine learning.	2026-09-27 11:22:24.283781
17	Statistics Fundamentals	Khan Academy	https://www.khanacademy.org/math/statistics-probability	Course	beginner	15	Learn probability and statistics fundamentals.	2026-09-27 11:22:24.283781
18	Microsoft Excel Training	Microsoft	https://support.microsoft.com/en-us/excel	Documentation	beginner	8	Learn Excel features useful for data analysis and productivity.	2026-09-27 11:22:24.283781
19	Power BI Learning	Microsoft	https://learn.microsoft.com/en-us/training/powerplatform/power-bi/	Course	beginner	12	Learn Power BI for data visualization and business intelligence.	2026-09-27 11:22:24.283781
20	Python Official Tutorial	Python	https://docs.python.org/3/tutorial/	Documentation	beginner	8	Official Python tutorial covering Python fundamentals and programming concepts.	2026-09-27 11:22:24.426613
21	Data Structures and Algorithms	GeeksforGeeks	https://www.geeksforgeeks.org/dsa/dsa-tutorial/	Course	beginner	20	Learn fundamental data structures and algorithms with explanations and examples.	2026-09-27 11:22:24.426613
22	MDN JavaScript Guide	MDN	https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide	Documentation	beginner	12	JavaScript fundamentals, syntax, functions, objects and programming concepts.	2026-09-27 11:22:24.426613
23	MDN HTML	MDN	https://developer.mozilla.org/en-US/docs/Web/HTML	Documentation	beginner	8	Learn the fundamentals of HTML and semantic web development.	2026-09-27 11:22:24.426613
24	MDN CSS	MDN	https://developer.mozilla.org/en-US/docs/Web/CSS	Documentation	beginner	10	Learn CSS fundamentals, layouts, selectors and responsive design.	2026-09-27 11:22:24.426613
25	React Learn	React	https://react.dev/learn	Documentation	beginner	10	Official React learning resources covering components, state and modern React.	2026-09-27 11:22:24.426613
26	Node.js Learn	Node.js	https://nodejs.org/en/learn	Documentation	beginner	10	Official Node.js learning resources for backend JavaScript development.	2026-09-27 11:22:24.426613
27	Express Documentation	Express	https://expressjs.com/	Documentation	beginner	6	Learn how to build web servers and APIs using Express.	2026-09-27 11:22:24.426613
28	Git Documentation	Git	https://git-scm.com/doc	Documentation	beginner	6	Learn Git version control and common Git workflows.	2026-09-27 11:22:24.426613
29	GitHub Skills	GitHub	https://skills.github.com/	Interactive Course	beginner	6	Interactive exercises for learning GitHub workflows and development practices.	2026-09-27 11:22:24.426613
30	PostgreSQL Tutorial	PostgreSQL	https://www.postgresql.org/docs/current/tutorial.html	Documentation	beginner	8	Official PostgreSQL tutorial covering SQL and relational database concepts.	2026-09-27 11:22:24.426613
31	SQL Tutorial	W3Schools	https://www.w3schools.com/sql/	Tutorial	beginner	10	Learn SQL queries, filtering, joins, aggregation and database operations.	2026-09-27 11:22:24.426613
32	REST API Tutorial	MDN	https://developer.mozilla.org/en-US/docs/Glossary/REST	Documentation	beginner	5	Understand REST APIs and the fundamental concepts behind web APIs.	2026-09-27 11:22:24.426613
33	Machine Learning Crash Course	Google	https://developers.google.com/machine-learning/crash-course	Course	intermediate	15	Practical introduction to machine learning concepts and techniques.	2026-09-27 11:22:24.426613
34	TensorFlow Tutorials	TensorFlow	https://www.tensorflow.org/tutorials	Tutorial	intermediate	15	Hands-on machine learning tutorials using TensorFlow.	2026-09-27 11:22:24.426613
35	PyTorch Tutorials	PyTorch	https://docs.pytorch.org/tutorials/	Tutorial	intermediate	15	Official PyTorch tutorials for deep learning and machine learning.	2026-09-27 11:22:24.426613
36	Statistics Fundamentals	Khan Academy	https://www.khanacademy.org/math/statistics-probability	Course	beginner	15	Learn probability and statistics fundamentals.	2026-09-27 11:22:24.426613
37	Microsoft Excel Training	Microsoft	https://support.microsoft.com/en-us/excel	Documentation	beginner	8	Learn Excel features useful for data analysis and productivity.	2026-09-27 11:22:24.426613
38	Power BI Learning	Microsoft	https://learn.microsoft.com/en-us/training/powerplatform/power-bi/	Course	beginner	12	Learn Power BI for data visualization and business intelligence.	2026-09-27 11:22:24.426613
39	Python Official Tutorial	Python	https://docs.python.org/3/tutorial/	Documentation	beginner	8	Official Python tutorial covering Python fundamentals and programming concepts.	2026-09-27 11:22:24.570145
40	Data Structures and Algorithms	GeeksforGeeks	https://www.geeksforgeeks.org/dsa/dsa-tutorial/	Course	beginner	20	Learn fundamental data structures and algorithms with explanations and examples.	2026-09-27 11:22:24.570145
41	MDN JavaScript Guide	MDN	https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide	Documentation	beginner	12	JavaScript fundamentals, syntax, functions, objects and programming concepts.	2026-09-27 11:22:24.570145
42	MDN HTML	MDN	https://developer.mozilla.org/en-US/docs/Web/HTML	Documentation	beginner	8	Learn the fundamentals of HTML and semantic web development.	2026-09-27 11:22:24.570145
43	MDN CSS	MDN	https://developer.mozilla.org/en-US/docs/Web/CSS	Documentation	beginner	10	Learn CSS fundamentals, layouts, selectors and responsive design.	2026-09-27 11:22:24.570145
44	React Learn	React	https://react.dev/learn	Documentation	beginner	10	Official React learning resources covering components, state and modern React.	2026-09-27 11:22:24.570145
45	Node.js Learn	Node.js	https://nodejs.org/en/learn	Documentation	beginner	10	Official Node.js learning resources for backend JavaScript development.	2026-09-27 11:22:24.570145
46	Express Documentation	Express	https://expressjs.com/	Documentation	beginner	6	Learn how to build web servers and APIs using Express.	2026-09-27 11:22:24.570145
47	Git Documentation	Git	https://git-scm.com/doc	Documentation	beginner	6	Learn Git version control and common Git workflows.	2026-09-27 11:22:24.570145
48	GitHub Skills	GitHub	https://skills.github.com/	Interactive Course	beginner	6	Interactive exercises for learning GitHub workflows and development practices.	2026-09-27 11:22:24.570145
49	PostgreSQL Tutorial	PostgreSQL	https://www.postgresql.org/docs/current/tutorial.html	Documentation	beginner	8	Official PostgreSQL tutorial covering SQL and relational database concepts.	2026-09-27 11:22:24.570145
50	SQL Tutorial	W3Schools	https://www.w3schools.com/sql/	Tutorial	beginner	10	Learn SQL queries, filtering, joins, aggregation and database operations.	2026-09-27 11:22:24.570145
51	REST API Tutorial	MDN	https://developer.mozilla.org/en-US/docs/Glossary/REST	Documentation	beginner	5	Understand REST APIs and the fundamental concepts behind web APIs.	2026-09-27 11:22:24.570145
52	Machine Learning Crash Course	Google	https://developers.google.com/machine-learning/crash-course	Course	intermediate	15	Practical introduction to machine learning concepts and techniques.	2026-09-27 11:22:24.570145
53	TensorFlow Tutorials	TensorFlow	https://www.tensorflow.org/tutorials	Tutorial	intermediate	15	Hands-on machine learning tutorials using TensorFlow.	2026-09-27 11:22:24.570145
54	PyTorch Tutorials	PyTorch	https://docs.pytorch.org/tutorials/	Tutorial	intermediate	15	Official PyTorch tutorials for deep learning and machine learning.	2026-09-27 11:22:24.570145
55	Statistics Fundamentals	Khan Academy	https://www.khanacademy.org/math/statistics-probability	Course	beginner	15	Learn probability and statistics fundamentals.	2026-09-27 11:22:24.570145
56	Microsoft Excel Training	Microsoft	https://support.microsoft.com/en-us/excel	Documentation	beginner	8	Learn Excel features useful for data analysis and productivity.	2026-09-27 11:22:24.570145
57	Power BI Learning	Microsoft	https://learn.microsoft.com/en-us/training/powerplatform/power-bi/	Course	beginner	12	Learn Power BI for data visualization and business intelligence.	2026-09-27 11:22:24.570145
\.


--
-- TOC entry 5200 (class 0 OID 32789)
-- Dependencies: 226
-- Data for Name: resumes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resumes (id, user_id, file_name, file_path, uploaded_at) FROM stdin;
8	3	Resume_Gowsika M.pdf	uploads/resume-1790743917170.pdf	2026-09-30 10:21:57.290514
9	4	SARAVANA_HARISH_RC_CSE_2303717610421115.pdf	uploads/resume-1790744161193.pdf	2026-09-30 10:26:01.222538
\.


--
-- TOC entry 5226 (class 0 OID 41048)
-- Dependencies: 252
-- Data for Name: role_aliases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_aliases (id, role_id, alias) FROM stdin;
\.


--
-- TOC entry 5210 (class 0 OID 32885)
-- Dependencies: 236
-- Data for Name: role_requirements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_requirements (id, role_id, skill_id, importance) FROM stdin;
1	1	29	required
2	1	28	required
3	1	27	preferred
4	1	26	required
5	1	25	required
6	1	3	required
7	1	1	required
8	2	26	required
9	2	22	required
10	2	21	required
11	2	20	required
12	2	18	preferred
13	2	17	required
14	3	26	required
15	3	25	required
16	3	24	required
17	3	23	required
18	3	16	preferred
19	3	3	required
20	3	1	preferred
21	4	32	preferred
22	4	31	required
23	4	30	required
24	4	7	preferred
25	4	3	required
26	4	1	required
27	5	34	preferred
28	5	33	preferred
29	5	26	required
30	5	10	preferred
31	5	9	required
32	5	3	preferred
33	5	1	required
\.


--
-- TOC entry 5222 (class 0 OID 41002)
-- Dependencies: 248
-- Data for Name: role_skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_skills (id, role_id, skill_id, importance) FROM stdin;
1	1	1	4
2	2	1	4
3	4	1	4
4	5	1	4
5	1	3	4
6	2	3	4
7	4	3	4
8	5	3	4
9	1	28	5
10	2	28	5
11	4	28	5
12	5	28	5
13	1	29	5
14	2	29	5
15	4	29	5
16	5	29	5
17	1	70	5
18	2	70	5
19	4	70	5
20	5	70	5
21	1	5	4
22	2	5	4
23	4	5	4
24	5	5	4
25	1	38	4
26	2	38	4
27	4	38	4
28	5	38	4
29	1	26	4
30	2	26	4
31	4	26	4
33	3	17	5
34	5	17	5
35	3	18	4
36	5	18	4
37	3	26	4
32	5	26	4
39	3	20	5
40	5	20	5
41	3	21	5
42	5	21	5
43	3	22	4
44	5	22	4
45	9	1	5
46	10	1	5
47	11	1	5
48	12	1	5
49	110	1	5
50	9	3	5
51	10	3	5
52	11	3	5
53	12	3	5
54	110	3	5
55	9	30	5
56	10	30	5
57	11	30	5
58	12	30	5
59	110	30	5
60	9	83	5
61	10	83	5
62	11	83	5
63	12	83	5
64	110	83	5
65	9	84	4
66	10	84	4
67	11	84	4
68	12	84	4
69	110	84	4
70	9	9	4
71	10	9	4
72	11	9	4
73	12	9	4
74	110	9	4
75	9	92	4
76	10	92	4
77	11	92	4
78	12	92	4
79	110	92	4
80	9	93	4
81	10	93	4
82	11	93	4
83	12	93	4
84	110	93	4
85	14	1	5
86	15	1	5
87	16	1	5
88	19	1	5
89	20	1	5
90	14	3	3
91	15	3	3
92	16	3	3
93	19	3	3
94	20	3	3
95	14	28	3
96	15	28	3
97	16	28	3
98	19	28	3
99	20	28	3
100	14	30	4
101	15	30	4
102	16	30	4
103	19	30	4
104	20	30	4
105	14	9	5
106	15	9	5
107	16	9	5
108	19	9	5
109	20	9	5
110	14	10	4
111	15	10	4
112	16	10	4
113	19	10	4
114	20	10	4
115	14	33	4
116	15	33	4
117	16	33	4
118	19	33	4
119	20	33	4
120	14	34	4
121	15	34	4
122	16	34	4
123	19	34	4
124	20	34	4
125	14	92	4
126	15	92	4
127	16	92	4
128	19	92	4
129	20	92	4
130	14	93	4
131	15	93	4
132	16	93	4
133	19	93	4
134	20	93	4
135	17	1	5
136	17	30	4
137	17	9	5
138	17	10	4
139	17	11	5
140	17	33	4
141	17	34	4
142	18	1	5
143	18	9	5
144	18	10	5
145	18	42	5
146	18	33	4
147	18	34	4
148	18	93	4
149	31	2	5
150	32	2	5
151	33	2	5
152	31	107	5
153	32	107	5
154	33	107	5
155	31	108	5
156	32	108	5
157	33	108	5
158	31	109	4
159	32	109	4
160	33	109	4
161	31	112	4
162	32	112	4
163	33	112	4
164	31	113	4
165	32	113	4
166	33	113	4
167	31	114	4
168	32	114	4
169	33	114	4
170	31	119	4
171	32	119	4
172	33	119	4
173	34	2	3
174	35	2	3
175	36	2	3
176	34	115	5
177	35	115	5
178	36	115	5
179	34	116	5
180	35	116	5
181	36	116	5
182	34	117	4
183	35	117	4
184	36	117	4
185	34	119	5
186	35	119	5
187	36	119	5
188	37	2	3
189	37	116	5
190	37	117	4
191	37	118	5
192	37	119	5
193	47	66	4
194	48	66	4
195	50	66	4
196	47	123	5
197	48	123	5
198	50	123	5
199	47	124	5
200	48	124	5
201	50	124	5
202	47	126	4
203	48	126	4
204	50	126	4
205	47	127	5
206	48	127	5
207	50	127	5
208	47	128	4
209	48	128	4
210	50	128	4
211	47	132	4
212	48	132	4
213	50	132	4
214	49	123	4
215	49	125	5
216	49	126	4
217	49	127	4
218	49	132	4
219	51	126	4
220	52	126	4
221	98	126	4
222	51	127	3
223	52	127	3
224	98	127	3
225	51	129	5
226	52	129	5
227	98	129	5
228	51	130	5
229	52	130	5
230	98	130	5
231	51	131	4
232	52	131	4
233	98	131	4
234	56	135	5
235	57	135	5
236	58	135	5
237	56	136	5
238	57	136	5
239	58	136	5
240	56	139	5
241	57	139	5
242	58	139	5
243	56	141	4
244	57	141	4
245	58	141	4
246	56	142	4
247	57	142	4
248	58	142	4
249	56	143	3
250	57	143	3
251	58	143	3
252	63	136	4
253	64	136	4
254	71	136	4
255	63	137	5
256	64	137	5
257	71	137	5
258	63	139	5
259	64	139	5
260	71	139	5
261	63	141	4
262	64	141	4
263	71	141	4
264	63	142	4
265	64	142	4
266	71	142	4
267	59	138	5
268	66	138	5
269	59	139	4
270	66	139	4
271	59	140	5
272	66	140	5
273	59	143	3
274	66	143	3
275	59	144	3
276	66	144	3
277	59	145	3
278	66	145	3
324	73	135	4
325	74	135	4
326	73	150	5
327	74	150	5
328	73	151	5
329	74	151	5
330	73	154	3
331	74	154	3
332	73	158	5
333	74	158	5
334	75	135	4
335	75	152	5
336	75	154	3
337	75	155	4
338	82	135	4
339	83	135	4
340	82	154	4
341	83	154	4
342	82	156	5
343	83	156	5
344	82	157	5
345	83	157	5
346	89	143	4
347	90	143	4
348	91	143	4
349	89	162	5
350	90	162	5
351	91	162	5
352	89	163	5
353	90	163	5
354	91	163	5
355	89	164	4
356	90	164	4
357	91	164	4
358	89	165	4
359	90	165	4
360	91	165	4
361	89	170	4
362	90	170	4
363	91	170	4
364	94	163	4
365	95	163	4
366	94	164	4
367	95	164	4
368	94	171	4
369	95	171	4
370	94	172	5
371	95	172	5
372	100	66	4
373	101	66	4
374	102	66	4
375	106	66	4
376	100	173	5
377	101	173	5
378	102	173	5
379	106	173	5
380	100	174	4
381	101	174	4
382	102	174	4
383	106	174	4
384	100	177	5
385	101	177	5
386	102	177	5
387	106	177	5
388	100	179	5
389	101	179	5
390	102	179	5
391	106	179	5
392	107	1	3
393	107	66	4
394	107	174	5
395	107	181	4
396	107	182	5
397	105	66	4
398	108	66	4
399	105	175	4
400	108	175	4
401	105	176	5
402	108	176	5
403	105	177	4
404	108	177	4
405	70	213	5
406	70	147	5
407	40	193	4
408	41	120	4
409	6	231	4
410	39	292	5
411	104	220	5
412	81	135	3
413	72	135	4
414	67	135	3
415	86	135	3
416	76	135	3
417	79	135	4
418	78	135	4
419	65	280	4
420	46	280	5
421	8	99	5
422	53	249	5
423	80	156	4
424	97	252	5
425	104	176	5
426	104	235	5
427	103	235	5
428	97	216	5
429	97	241	5
430	97	271	5
431	29	237	5
432	70	139	5
433	60	139	5
434	92	206	5
435	28	101	3
436	7	101	5
437	42	245	5
438	72	247	5
439	8	199	5
440	7	199	4
441	60	146	4
442	44	256	4
443	40	256	5
444	38	74	4
445	26	46	4
446	25	46	5
447	43	46	3
448	45	42	4
449	79	154	5
450	81	154	4
451	78	154	5
452	72	154	5
453	80	154	5
454	80	257	5
455	78	257	5
456	79	223	4
457	45	126	5
458	46	126	5
459	65	126	5
460	81	268	5
461	21	105	4
462	24	105	3
463	29	105	5
464	22	105	3
465	22	102	5
466	23	102	5
467	21	102	5
468	30	83	4
469	13	291	5
470	13	5	5
471	41	211	5
472	40	267	5
473	42	119	5
474	41	119	4
475	38	119	5
476	38	222	5
477	44	219	5
478	8	97	3
479	7	97	5
480	96	234	5
481	53	262	5
482	39	194	4
483	45	275	5
484	65	275	4
485	43	275	5
486	42	275	4
487	53	275	3
488	99	202	5
489	99	272	5
490	55	289	4
491	54	289	5
492	99	289	5
493	84	160	5
494	84	250	5
495	29	293	4
496	24	104	5
497	21	104	5
498	67	144	4
499	96	144	3
500	6	14	5
501	44	224	4
502	87	287	5
503	88	159	5
504	87	159	5
505	86	159	4
506	85	159	3
507	7	26	4
508	27	26	3
509	86	244	5
510	38	273	4
511	109	188	4
512	103	230	4
513	103	180	5
514	67	145	5
515	77	259	5
516	76	259	5
517	67	258	5
518	85	232	5
519	85	201	5
520	68	239	5
521	69	238	3
522	46	131	5
523	6	277	4
524	43	203	5
525	92	210	4
526	68	187	5
527	61	187	4
528	23	37	4
529	7	37	5
530	8	37	4
531	13	37	3
532	21	37	4
533	24	37	4
534	25	37	3
535	26	37	5
536	30	9	5
537	69	183	5
538	61	142	5
539	60	142	5
540	62	142	3
541	70	142	4
542	70	189	4
543	46	66	4
544	44	66	5
545	69	208	5
546	65	149	5
547	103	177	5
548	109	177	5
549	104	177	4
550	103	174	4
551	97	278	4
552	43	108	5
553	42	108	4
554	39	274	5
555	6	212	3
556	53	207	4
557	13	4	4
558	24	47	5
559	22	47	5
560	21	47	5
561	25	47	4
562	23	47	5
563	8	229	4
564	26	45	5
565	68	215	5
566	61	215	5
567	77	285	5
568	42	242	5
569	24	276	5
570	96	246	5
571	55	265	5
572	53	125	5
573	55	125	4
574	54	124	5
575	69	197	5
576	93	226	5
577	61	227	5
578	60	227	5
579	68	227	4
580	28	266	4
581	81	214	3
582	80	214	5
583	78	214	5
584	30	1	4
585	87	1	3
586	62	290	5
587	27	290	5
588	109	290	5
589	93	290	5
590	92	290	5
591	60	284	4
592	93	284	5
593	62	284	5
594	61	284	4
595	92	284	5
596	93	294	5
597	81	264	5
598	78	264	3
599	109	221	5
600	109	295	5
601	104	195	5
602	69	186	4
603	88	286	3
604	87	286	5
605	99	133	4
606	55	133	5
607	54	133	5
608	30	269	5
609	96	191	5
610	6	279	3
611	39	122	5
612	22	260	3
613	65	148	5
614	45	148	5
615	25	205	5
616	80	255	4
617	23	243	5
618	22	243	4
619	28	198	5
620	41	297	5
621	45	296	4
622	46	296	4
623	43	296	4
624	26	283	4
625	23	281	5
626	39	121	4
627	44	121	5
628	40	121	4
629	79	233	5
630	62	204	5
631	68	204	4
632	29	217	5
633	27	253	5
634	28	253	5
635	55	134	5
636	54	134	4
637	29	282	5
638	87	251	4
639	13	3	5
640	27	3	3
641	92	190	5
642	93	190	4
643	62	190	5
644	30	30	5
645	72	228	5
646	76	155	4
647	72	155	4
648	86	155	5
649	77	155	4
650	79	155	5
651	26	184	5
652	25	218	5
653	28	254	5
654	27	254	5
655	67	143	5
656	99	143	4
657	86	248	5
658	77	196	4
659	76	196	5
660	76	153	5
661	77	153	5
662	88	225	4
663	88	261	5
664	88	240	5
665	38	116	5
666	41	115	5
667	84	270	4
668	84	236	5
669	85	192	5
670	84	209	4
671	85	200	5
672	96	185	4
673	54	288	4
674	40	263	5
\.


--
-- TOC entry 5208 (class 0 OID 32871)
-- Dependencies: 234
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, description, created_at) FROM stdin;
1	Software Engineer	Develops software applications, systems, and technical solutions.	2026-09-27 11:10:59.99691
2	Frontend Developer	Builds user interfaces and client-side web applications.	2026-09-27 11:10:59.99691
3	Backend Developer	Develops server-side applications, APIs, and backend systems.	2026-09-27 11:10:59.99691
4	Data Analyst	Analyzes data and generates insights to support decisions.	2026-09-27 11:10:59.99691
5	Machine Learning Engineer	Builds and deploys machine learning systems and applications.	2026-09-27 11:10:59.99691
\.


--
-- TOC entry 5206 (class 0 OID 32848)
-- Dependencies: 232
-- Data for Name: skill_relationships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skill_relationships (id, source_skill_id, target_skill_id, relationship_type) FROM stdin;
1	1	9	related_to
2	1	11	related_to
3	3	4	related_to
4	9	10	related_to
5	10	12	related_to
6	11	13	related_to
\.


--
-- TOC entry 5214 (class 0 OID 32925)
-- Dependencies: 240
-- Data for Name: skill_resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skill_resources (id, skill_id, resource_id, priority) FROM stdin;
1	1	1	1
2	1	20	1
3	1	39	1
4	28	2	1
5	28	21	1
6	28	40	1
7	17	3	1
8	17	22	1
9	17	41	1
10	20	4	1
11	20	23	1
12	20	42	1
13	21	5	1
14	21	24	1
15	21	43	1
16	22	6	1
17	22	25	1
18	22	44	1
19	23	7	1
20	23	26	1
21	23	45	1
22	24	8	1
23	24	27	1
24	24	46	1
25	26	9	1
26	26	28	1
27	26	47	1
28	27	10	1
29	27	29	1
30	27	48	1
31	3	12	1
32	3	31	1
33	3	50	1
34	25	13	1
35	25	32	1
36	25	51	1
37	9	14	1
38	9	33	1
39	9	52	1
40	33	15	1
41	33	34	1
42	33	53	1
43	34	16	1
44	34	35	1
45	34	54	1
46	30	17	1
47	30	36	1
48	30	55	1
49	31	18	1
50	31	37	1
51	31	56	1
52	6	19	1
53	32	19	1
54	6	38	1
55	32	38	1
56	6	57	1
57	32	57	1
\.


--
-- TOC entry 5202 (class 0 OID 32810)
-- Dependencies: 228
-- Data for Name: skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skills (id, name, category, subcategory, created_at) FROM stdin;
4	MySQL	Database	Relational Database	2026-09-27 10:55:01.416655
6	PowerBI	Data Analytics	Business Intelligence	2026-09-27 10:55:01.421266
8	Weka	AI/ML	Machine Learning Tool	2026-09-27 10:55:01.425708
12	CNN	AI/ML	Deep Learning	2026-09-27 10:55:01.434687
13	Speech Recognition	AI/ML	Speech Technology	2026-09-27 10:55:01.436866
14	Flutter	Mobile Development	Mobile Framework	2026-09-27 10:55:01.439338
15	WeatherAPI	Other	General	2026-09-27 10:55:01.441173
24	Express	Web Development	Backend Framework	2026-09-27 11:11:36.972855
27	GitHub	Development Tools	Code Hosting	2026-09-27 11:11:36.972855
31	Excel	Data Analytics	Spreadsheet	2026-09-27 11:11:36.972855
35	VS Code	Other	General	2026-09-30 10:21:12.810534
36	Jupyter Notebook	Other	General	2026-09-30 10:21:12.819687
39	Distributed Edge Computing	Other	General	2026-09-30 10:21:12.843657
40	Artificial Intelligence	Other	General	2026-09-30 10:21:12.849115
41	Natural Language Processing (NLP)	Other	General	2026-09-30 10:21:12.862049
43	Data Structures and Algorithms	Other	General	2026-09-30 10:21:12.874152
44	Object-Oriented Programming (OOP)	Other	General	2026-09-30 10:21:12.880248
48	OCR	Other	General	2026-09-30 10:21:12.906665
49	ANPR	Other	General	2026-09-30 10:21:12.912224
50	TinyML	Other	General	2026-09-30 10:21:12.917559
51	Edge AI	Other	General	2026-09-30 10:21:12.926651
52	Retrieval-Augmented Generation (RAG)	Other	General	2026-09-30 10:21:12.932402
53	C programming	Programming	Programming Language	2026-09-30 10:23:00.48263
54	Neural Networks	Other	General	2026-09-30 10:26:16.36151
55	OOP	Other	General	2026-09-30 10:26:16.370183
56	G-code	Other	General	2026-09-30 10:26:16.396664
57	RAG	Other	General	2026-09-30 10:26:16.409255
2	C	Programming	Languages	2026-09-27 10:55:01.411419
19	C++	Programming	Languages	2026-09-27 11:11:36.972855
60	C#	Programming	Languages	2026-10-03 15:40:14.742963
16	Java	Programming	Languages	2026-09-27 11:11:36.972855
1	Python	Programming	Languages	2026-09-27 10:55:01.404954
17	JavaScript	Programming	Languages	2026-09-27 11:11:36.972855
18	TypeScript	Programming	Languages	2026-09-27 11:11:36.972855
3	SQL	Programming	Databases	2026-09-27 10:55:01.414247
66	MATLAB	Programming	Engineering	2026-10-03 15:40:14.742963
67	R	Programming	Languages	2026-10-03 15:40:14.742963
28	Data Structures	Computer Science	DSA	2026-09-27 11:11:36.972855
29	Algorithms	Computer Science	DSA	2026-09-27 11:11:36.972855
70	Object Oriented Programming	Computer Science	Programming	2026-10-03 15:40:14.742963
5	DBMS	Computer Science	Databases	2026-09-27 10:55:01.418852
45	Operating Systems	Computer Science	Systems	2026-09-30 10:21:12.88967
46	Computer Networks	Computer Science	Networking	2026-09-30 10:21:12.895318
74	Computer Architecture	Computer Science	Systems	2026-10-03 15:40:14.742963
38	Software Engineering	Computer Science	Development	2026-09-30 10:21:12.838128
26	Git	Development	Version Control	2026-09-27 11:11:36.972855
25	REST APIs	Development	Backend	2026-09-27 11:11:36.972855
20	HTML	Web Development	Frontend	2026-09-27 11:11:36.972855
21	CSS	Web Development	Frontend	2026-09-27 11:11:36.972855
22	React	Web Development	Frontend	2026-09-27 11:11:36.972855
23	Node.js	Web Development	Backend	2026-09-27 11:11:36.972855
30	Statistics	Data Science	Statistics	2026-09-27 11:11:36.972855
83	Data Analysis	Data Science	Analytics	2026-10-03 15:40:14.742963
84	Data Visualization	Data Science	Visualization	2026-10-03 15:40:14.742963
9	Machine Learning	Artificial Intelligence	Machine Learning	2026-09-27 10:55:01.427625
10	Deep Learning	Artificial Intelligence	Deep Learning	2026-09-27 10:55:01.429829
11	Natural Language Processing	Artificial Intelligence	NLP	2026-09-27 10:55:01.432361
42	Computer Vision	Artificial Intelligence	Computer Vision	2026-09-30 10:21:12.868228
89	Generative AI	Artificial Intelligence	Generative AI	2026-10-03 15:40:14.742963
33	TensorFlow	Artificial Intelligence	Frameworks	2026-09-27 11:11:36.972855
34	PyTorch	Artificial Intelligence	Frameworks	2026-09-27 11:11:36.972855
92	Pandas	Data Science	Libraries	2026-10-03 15:40:14.742963
93	NumPy	Data Science	Libraries	2026-10-03 15:40:14.742963
32	Power BI	Data Science	Business Intelligence	2026-09-27 11:11:36.972855
7	Tableau	Data Science	Visualization	2026-09-27 10:55:01.423663
37	Linux	DevOps	Operating Systems	2026-09-30 10:21:12.832029
97	Docker	DevOps	Containers	2026-10-03 15:40:14.742963
98	Kubernetes	DevOps	Containers	2026-10-03 15:40:14.742963
99	AWS	Cloud	Cloud Platforms	2026-10-03 15:40:14.742963
100	Azure	Cloud	Cloud Platforms	2026-10-03 15:40:14.742963
101	CI/CD	DevOps	Automation	2026-10-03 15:40:14.742963
102	Cybersecurity	Security	Security	2026-10-03 15:40:14.742963
47	Network Security	Security	Networking	2026-09-30 10:21:12.901055
104	Ethical Hacking	Security	Penetration Testing	2026-10-03 15:40:14.742963
105	Cryptography	Security	Cryptography	2026-10-03 15:40:14.742963
106	Security Operations	Security	SOC	2026-10-03 15:40:14.742963
107	Embedded C	Embedded Systems	Programming	2026-10-03 15:40:14.742963
108	Microcontrollers	Embedded Systems	Hardware	2026-10-03 15:40:14.742963
109	Microprocessors	Embedded Systems	Hardware	2026-10-03 15:40:14.742963
110	Arduino	Embedded Systems	Platforms	2026-10-03 15:40:14.742963
111	Raspberry Pi	Embedded Systems	Platforms	2026-10-03 15:40:14.742963
112	UART	Embedded Systems	Communication	2026-10-03 15:40:14.742963
113	SPI	Embedded Systems	Communication	2026-10-03 15:40:14.742963
114	I2C	Embedded Systems	Communication	2026-10-03 15:40:14.742963
115	VLSI	Electronics	VLSI	2026-10-03 15:40:14.742963
116	Verilog	Electronics	HDL	2026-10-03 15:40:14.742963
117	SystemVerilog	Electronics	HDL	2026-10-03 15:40:14.742963
118	FPGA	Electronics	Digital Design	2026-10-03 15:40:14.742963
119	Digital Electronics	Electronics	Digital	2026-10-03 15:40:14.742963
120	Analog Electronics	Electronics	Analog	2026-10-03 15:40:14.742963
121	Signal Processing	Electronics	Signals	2026-10-03 15:40:14.742963
122	RF Engineering	Electronics	RF	2026-10-03 15:40:14.742963
123	Electrical Machines	Electrical Engineering	Machines	2026-10-03 15:40:14.742963
124	Power Systems	Electrical Engineering	Power	2026-10-03 15:40:14.742963
125	Power Electronics	Electrical Engineering	Power Electronics	2026-10-03 15:40:14.742963
126	Control Systems	Electrical Engineering	Control	2026-10-03 15:40:14.742963
127	Electrical Circuits	Electrical Engineering	Circuits	2026-10-03 15:40:14.742963
128	Electrical Protection	Electrical Engineering	Protection	2026-10-03 15:40:14.742963
129	PLC	Automation	Industrial Automation	2026-10-03 15:40:14.742963
130	SCADA	Automation	Industrial Automation	2026-10-03 15:40:14.742963
131	Instrumentation	Electrical Engineering	Instrumentation	2026-10-03 15:40:14.742963
132	MATLAB Simulink	Electrical Engineering	Simulation	2026-10-03 15:40:14.742963
133	Renewable Energy	Energy	Renewable Energy	2026-10-03 15:40:14.742963
134	Solar Energy	Energy	Solar	2026-10-03 15:40:14.742963
135	AutoCAD	Mechanical Engineering	CAD	2026-10-03 15:40:14.742963
136	SolidWorks	Mechanical Engineering	CAD	2026-10-03 15:40:14.742963
137	CATIA	Mechanical Engineering	CAD	2026-10-03 15:40:14.742963
138	ANSYS	Mechanical Engineering	CAE	2026-10-03 15:40:14.742963
139	CAD	Mechanical Engineering	Design	2026-10-03 15:40:14.742963
140	CAE	Mechanical Engineering	Simulation	2026-10-03 15:40:14.742963
141	GD&T	Mechanical Engineering	Manufacturing	2026-10-03 15:40:14.742963
142	Manufacturing Processes	Mechanical Engineering	Manufacturing	2026-10-03 15:40:14.742963
143	Thermodynamics	Mechanical Engineering	Thermal	2026-10-03 15:40:14.742963
144	Fluid Mechanics	Mechanical Engineering	Fluids	2026-10-03 15:40:14.742963
145	Heat Transfer	Mechanical Engineering	Thermal	2026-10-03 15:40:14.742963
146	CNC	Manufacturing	Machining	2026-10-03 15:40:14.742963
147	Additive Manufacturing	Manufacturing	3D Printing	2026-10-03 15:40:14.742963
148	Robotics	Automation	Robotics	2026-10-03 15:40:14.742963
149	Mechatronics	Mechanical Engineering	Mechatronics	2026-10-03 15:40:14.742963
150	Structural Analysis	Civil Engineering	Structures	2026-10-03 15:40:14.742963
151	Structural Design	Civil Engineering	Structures	2026-10-03 15:40:14.742963
152	Geotechnical Engineering	Civil Engineering	Geotechnical	2026-10-03 15:40:14.742963
153	Transportation Engineering	Civil Engineering	Transportation	2026-10-03 15:40:14.742963
154	Construction Management	Civil Engineering	Construction	2026-10-03 15:40:14.742963
155	Surveying	Civil Engineering	Surveying	2026-10-03 15:40:14.742963
156	BIM	Civil Engineering	Building Information Modeling	2026-10-03 15:40:14.742963
157	Revit	Civil Engineering	BIM	2026-10-03 15:40:14.742963
158	STAAD.Pro	Civil Engineering	Structural Analysis	2026-10-03 15:40:14.742963
159	GIS	Civil Engineering	Geospatial	2026-10-03 15:40:14.742963
160	Environmental Engineering	Civil Engineering	Environment	2026-10-03 15:40:14.742963
161	Water Resources	Civil Engineering	Water	2026-10-03 15:40:14.742963
162	Chemical Process Design	Chemical Engineering	Process	2026-10-03 15:40:14.742963
163	Process Engineering	Chemical Engineering	Process	2026-10-03 15:40:14.742963
164	Process Control	Chemical Engineering	Automation	2026-10-03 15:40:14.742963
165	Process Simulation	Chemical Engineering	Simulation	2026-10-03 15:40:14.742963
166	Aspen HYSYS	Chemical Engineering	Simulation	2026-10-03 15:40:14.742963
167	Aspen Plus	Chemical Engineering	Simulation	2026-10-03 15:40:14.742963
168	Chemical Reaction Engineering	Chemical Engineering	Reactions	2026-10-03 15:40:14.742963
169	Heat Transfer Chemical	Chemical Engineering	Thermal	2026-10-03 15:40:14.742963
170	Mass Transfer	Chemical Engineering	Transport	2026-10-03 15:40:14.742963
171	Plant Design	Chemical Engineering	Plant	2026-10-03 15:40:14.742963
172	Process Safety	Chemical Engineering	Safety	2026-10-03 15:40:14.742963
173	Biomedical Instrumentation	Biomedical Engineering	Instrumentation	2026-10-03 15:40:14.742963
174	Medical Imaging	Biomedical Engineering	Imaging	2026-10-03 15:40:14.742963
175	Biomaterials	Biomedical Engineering	Materials	2026-10-03 15:40:14.742963
176	Biomechanics	Biomedical Engineering	Biomechanics	2026-10-03 15:40:14.742963
177	Medical Devices	Biomedical Engineering	Devices	2026-10-03 15:40:14.742963
178	Clinical Engineering	Biomedical Engineering	Clinical	2026-10-03 15:40:14.742963
179	Bioinstrumentation	Biomedical Engineering	Instrumentation	2026-10-03 15:40:14.742963
180	Healthcare Technology	Biomedical Engineering	Healthcare	2026-10-03 15:40:14.742963
181	Medical Signal Processing	Biomedical Engineering	Signals	2026-10-03 15:40:14.742963
182	Medical Image Processing	Biomedical Engineering	Imaging	2026-10-03 15:40:14.742963
183	Maintenance Engineering	Engineering	Domain Skills	2026-10-03 15:56:25.374642
184	Systems Administration	Engineering	Domain Skills	2026-10-03 15:56:25.374642
185	Well Logging	Engineering	Domain Skills	2026-10-03 15:56:25.374642
186	Reliability Engineering	Engineering	Domain Skills	2026-10-03 15:56:25.374642
187	Lean Manufacturing	Engineering	Domain Skills	2026-10-03 15:56:25.374642
188	Healthcare Regulations	Engineering	Domain Skills	2026-10-03 15:56:25.374642
189	Materials Science	Engineering	Domain Skills	2026-10-03 15:56:25.374642
190	Statistical Process Control	Engineering	Domain Skills	2026-10-03 15:56:25.374642
191	Reservoir Engineering	Engineering	Domain Skills	2026-10-03 15:56:25.374642
192	Water Management	Engineering	Domain Skills	2026-10-03 15:56:25.374642
193	Analog Communication	Engineering	Domain Skills	2026-10-03 15:56:25.374642
194	Electromagnetics	Engineering	Domain Skills	2026-10-03 15:56:25.374642
195	Rehabilitation Engineering	Engineering	Domain Skills	2026-10-03 15:56:25.374642
196	Traffic Engineering	Engineering	Domain Skills	2026-10-03 15:56:25.374642
197	Preventive Maintenance	Engineering	Domain Skills	2026-10-03 15:56:25.374642
198	Selenium	Engineering	Domain Skills	2026-10-03 15:56:25.374642
199	Cloud Computing	Engineering	Domain Skills	2026-10-03 15:56:25.374642
200	Water Resources Engineering	Engineering	Domain Skills	2026-10-03 15:56:25.374642
201	Hydrology	Engineering	Domain Skills	2026-10-03 15:56:25.374642
202	Energy Efficiency	Engineering	Domain Skills	2026-10-03 15:56:25.374642
203	IoT	Engineering	Domain Skills	2026-10-03 15:56:25.374642
204	Six Sigma	Engineering	Domain Skills	2026-10-03 15:56:25.374642
205	Routing and Switching	Engineering	Domain Skills	2026-10-03 15:56:25.374642
206	Chemical Analysis	Engineering	Domain Skills	2026-10-03 15:56:25.374642
207	Motor Control	Engineering	Domain Skills	2026-10-03 15:56:25.374642
208	Mechanical Engineering	Engineering	Domain Skills	2026-10-03 15:56:25.374642
209	Water Quality	Engineering	Domain Skills	2026-10-03 15:56:25.374642
210	Laboratory Techniques	Engineering	Domain Skills	2026-10-03 15:56:25.374642
211	Device Physics	Engineering	Domain Skills	2026-10-03 15:56:25.374642
212	Mobile UI/UX	Engineering	Domain Skills	2026-10-03 15:56:25.374642
213	3D Printing	Engineering	Domain Skills	2026-10-03 15:56:25.374642
214	Project Management	Engineering	Domain Skills	2026-10-03 15:56:25.374642
215	Operations Management	Engineering	Domain Skills	2026-10-03 15:56:25.374642
216	Bioprocess Engineering	Engineering	Domain Skills	2026-10-03 15:56:25.374642
217	Smart Contracts	Engineering	Domain Skills	2026-10-03 15:56:25.374642
218	TCP/IP	Engineering	Domain Skills	2026-10-03 15:56:25.374642
219	Digital Signal Processing	Engineering	Domain Skills	2026-10-03 15:56:25.374642
220	Assistive Technology	Engineering	Domain Skills	2026-10-03 15:56:25.374642
221	Regulatory Affairs	Engineering	Domain Skills	2026-10-03 15:56:25.374642
222	Digital Logic Design	Engineering	Domain Skills	2026-10-03 15:56:25.374642
223	Construction Safety	Engineering	Domain Skills	2026-10-03 15:56:25.374642
224	Fourier Transform	Engineering	Domain Skills	2026-10-03 15:56:25.374642
225	Transportation Planning	Engineering	Domain Skills	2026-10-03 15:56:25.374642
226	Process Validation	Engineering	Domain Skills	2026-10-03 15:56:25.374642
227	Production Planning	Engineering	Domain Skills	2026-10-03 15:56:25.374642
228	Structural Engineering	Engineering	Domain Skills	2026-10-03 15:56:25.374642
229	Networking	Engineering	Domain Skills	2026-10-03 15:56:25.374642
230	Healthcare Systems	Engineering	Domain Skills	2026-10-03 15:56:25.374642
231	Android Development	Engineering	Domain Skills	2026-10-03 15:56:25.374642
232	Hydraulics	Engineering	Domain Skills	2026-10-03 15:56:25.374642
233	Site Management	Engineering	Domain Skills	2026-10-03 15:56:25.374642
234	Drilling Engineering	Engineering	Domain Skills	2026-10-03 15:56:25.374642
235	Biomedical Engineering	Engineering	Domain Skills	2026-10-03 15:56:25.374642
236	Wastewater Treatment	Engineering	Domain Skills	2026-10-03 15:56:25.374642
237	Blockchain	Engineering	Domain Skills	2026-10-03 15:56:25.374642
238	Industrial Safety	Engineering	Domain Skills	2026-10-03 15:56:25.374642
239	Industrial Engineering	Engineering	Domain Skills	2026-10-03 15:56:25.374642
240	Urban Planning	Engineering	Domain Skills	2026-10-03 15:56:25.374642
241	Bioreactors	Engineering	Domain Skills	2026-10-03 15:56:25.374642
242	PCB Design	Engineering	Domain Skills	2026-10-03 15:56:25.374642
243	Security Monitoring	Engineering	Domain Skills	2026-10-03 15:56:25.374642
244	GPS	Engineering	Domain Skills	2026-10-03 15:56:25.374642
245	Circuit Design	Engineering	Domain Skills	2026-10-03 15:56:25.374642
246	Petroleum Engineering	Engineering	Domain Skills	2026-10-03 15:56:25.374642
247	Civil Engineering	Engineering	Domain Skills	2026-10-03 15:56:25.374642
248	Total Station	Engineering	Domain Skills	2026-10-03 15:56:25.374642
249	Battery Management Systems	Engineering	Domain Skills	2026-10-03 15:56:25.374642
250	Environmental Impact Assessment	Engineering	Domain Skills	2026-10-03 15:56:25.374642
251	Spatial Data Analysis	Engineering	Domain Skills	2026-10-03 15:56:25.374642
252	Biochemical Engineering	Engineering	Domain Skills	2026-10-03 15:56:25.374642
253	Software Testing	Engineering	Domain Skills	2026-10-03 15:56:25.374642
254	Test Automation	Engineering	Domain Skills	2026-10-03 15:56:25.374642
255	Scheduling	Engineering	Domain Skills	2026-10-03 15:56:25.374642
256	Communication Systems	Engineering	Domain Skills	2026-10-03 15:56:25.374642
257	Construction Planning	Engineering	Domain Skills	2026-10-03 15:56:25.374642
258	HVAC	Engineering	Domain Skills	2026-10-03 15:56:25.374642
259	Highway Engineering	Engineering	Domain Skills	2026-10-03 15:56:25.374642
260	Risk Assessment	Engineering	Domain Skills	2026-10-03 15:56:25.374642
261	Urban Design	Engineering	Domain Skills	2026-10-03 15:56:25.374642
262	Electric Vehicles	Engineering	Domain Skills	2026-10-03 15:56:25.374642
263	Wireless Communication	Engineering	Domain Skills	2026-10-03 15:56:25.374642
264	Quantity Surveying	Engineering	Domain Skills	2026-10-03 15:56:25.374642
265	Photovoltaic Systems	Engineering	Domain Skills	2026-10-03 15:56:25.374642
266	Programming	Engineering	Domain Skills	2026-10-03 15:56:25.374642
267	Digital Communication	Engineering	Domain Skills	2026-10-03 15:56:25.374642
268	Cost Estimation	Engineering	Domain Skills	2026-10-03 15:56:25.374642
269	Research Methodology	Engineering	Domain Skills	2026-10-03 15:56:25.374642
270	Waste Management	Engineering	Domain Skills	2026-10-03 15:56:25.374642
271	Biotechnology	Engineering	Domain Skills	2026-10-03 15:56:25.374642
272	Energy Engineering	Engineering	Domain Skills	2026-10-03 15:56:25.374642
273	HDL	Engineering	Domain Skills	2026-10-03 15:56:25.374642
274	Microwave Engineering	Engineering	Domain Skills	2026-10-03 15:56:25.374642
275	Embedded Systems	Engineering	Domain Skills	2026-10-03 15:56:25.374642
276	Penetration Testing	Engineering	Domain Skills	2026-10-03 15:56:25.374642
277	iOS Development	Engineering	Domain Skills	2026-10-03 15:56:25.374642
278	Microbiology	Engineering	Domain Skills	2026-10-03 15:56:25.374642
279	REST API	Engineering	Domain Skills	2026-10-03 15:56:25.374642
280	Automation	Engineering	Domain Skills	2026-10-03 15:56:25.374642
281	SIEM	Engineering	Domain Skills	2026-10-03 15:56:25.374642
282	Solidity	Engineering	Domain Skills	2026-10-03 15:56:25.374642
283	Shell Scripting	Engineering	Domain Skills	2026-10-03 15:56:25.374642
284	Quality Control	Engineering	Domain Skills	2026-10-03 15:56:25.374642
285	Pavement Design	Engineering	Domain Skills	2026-10-03 15:56:25.374642
286	Remote Sensing	Engineering	Domain Skills	2026-10-03 15:56:25.374642
287	Geospatial Analysis	Engineering	Domain Skills	2026-10-03 15:56:25.374642
288	Wind Energy	Engineering	Domain Skills	2026-10-03 15:56:25.374642
289	Energy Management	Engineering	Domain Skills	2026-10-03 15:56:25.374642
290	Quality Assurance	Engineering	Domain Skills	2026-10-03 15:56:25.374642
291	Database Administration	Engineering	Domain Skills	2026-10-03 15:56:25.374642
292	Antenna Design	Engineering	Domain Skills	2026-10-03 15:56:25.374642
293	Ethereum	Engineering	Domain Skills	2026-10-03 15:56:25.374642
294	Quality Management Systems	Engineering	Domain Skills	2026-10-03 15:56:25.374642
295	Regulatory Compliance	Engineering	Domain Skills	2026-10-03 15:56:25.374642
296	Sensors	Engineering	Domain Skills	2026-10-03 15:56:25.374642
297	Semiconductor Devices	Engineering	Domain Skills	2026-10-03 15:56:25.374642
\.


--
-- TOC entry 5204 (class 0 OID 32824)
-- Dependencies: 230
-- Data for Name: user_skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_skills (id, user_id, skill_id, source, created_at) FROM stdin;
2	3	2	resume	2026-09-27 10:55:01.412477
18	3	19	resume	2026-09-30 10:21:12.796847
19	3	16	resume	2026-09-30 10:21:12.802886
21	3	35	resume	2026-09-30 10:21:12.815992
22	3	36	resume	2026-09-30 10:21:12.821811
23	3	26	resume	2026-09-30 10:21:12.825368
24	3	27	resume	2026-09-30 10:21:12.828704
25	3	37	resume	2026-09-30 10:21:12.834441
26	3	38	resume	2026-09-30 10:21:12.840238
27	3	39	resume	2026-09-30 10:21:12.845739
28	3	40	resume	2026-09-30 10:21:12.85119
31	3	41	resume	2026-09-30 10:21:12.864703
32	3	42	resume	2026-09-30 10:21:12.870354
33	3	43	resume	2026-09-30 10:21:12.876537
34	3	44	resume	2026-09-30 10:21:12.882383
36	3	45	resume	2026-09-30 10:21:12.891871
37	3	46	resume	2026-09-30 10:21:12.897403
38	3	47	resume	2026-09-30 10:21:12.903137
39	3	48	resume	2026-09-30 10:21:12.908747
40	3	49	resume	2026-09-30 10:21:12.914298
41	3	50	resume	2026-09-30 10:21:12.919659
42	3	51	resume	2026-09-30 10:21:12.928983
43	3	52	resume	2026-09-30 10:21:12.934398
1	3	1	resume	2026-09-27 10:55:01.406943
45	3	53	resume	2026-09-30 10:23:00.485232
3	3	3	resume	2026-09-27 10:55:01.415099
4	3	4	resume	2026-09-27 10:55:01.417515
5	3	5	resume	2026-09-27 10:55:01.419749
6	3	6	resume	2026-09-27 10:55:01.422143
7	3	7	resume	2026-09-27 10:55:01.424478
8	3	8	resume	2026-09-27 10:55:01.426351
9	3	9	resume	2026-09-27 10:55:01.428571
10	3	10	resume	2026-09-27 10:55:01.430676
11	3	11	resume	2026-09-27 10:55:01.433268
14	3	14	resume	2026-09-27 10:55:01.43998
15	3	15	resume	2026-09-27 10:55:01.441897
12	3	12	resume	2026-09-27 10:55:01.435455
13	3	13	resume	2026-09-27 10:55:01.437807
59	4	1	resume	2026-09-30 10:26:16.298447
60	4	2	resume	2026-09-30 10:26:16.31406
61	4	19	resume	2026-09-30 10:26:16.317526
62	4	16	resume	2026-09-30 10:26:16.321074
63	4	3	resume	2026-09-30 10:26:16.323905
64	4	35	resume	2026-09-30 10:26:16.327258
65	4	36	resume	2026-09-30 10:26:16.330647
66	4	26	resume	2026-09-30 10:26:16.3333
67	4	27	resume	2026-09-30 10:26:16.33603
68	4	37	resume	2026-09-30 10:26:16.338519
69	4	38	resume	2026-09-30 10:26:16.341712
70	4	39	resume	2026-09-30 10:26:16.344368
71	4	40	resume	2026-09-30 10:26:16.346923
72	4	9	resume	2026-09-30 10:26:16.350285
73	4	10	resume	2026-09-30 10:26:16.353318
74	4	11	resume	2026-09-30 10:26:16.356431
75	4	42	resume	2026-09-30 10:26:16.358925
76	4	54	resume	2026-09-30 10:26:16.364159
77	4	43	resume	2026-09-30 10:26:16.367331
78	4	55	resume	2026-09-30 10:26:16.371972
79	4	5	resume	2026-09-30 10:26:16.375512
80	4	45	resume	2026-09-30 10:26:16.380987
81	4	46	resume	2026-09-30 10:26:16.384318
82	4	47	resume	2026-09-30 10:26:16.388506
83	4	48	resume	2026-09-30 10:26:16.39322
84	4	56	resume	2026-09-30 10:26:16.398741
85	4	50	resume	2026-09-30 10:26:16.401997
86	4	49	resume	2026-09-30 10:26:16.405638
87	4	57	resume	2026-09-30 10:26:16.410971
\.


--
-- TOC entry 5196 (class 0 OID 24578)
-- Dependencies: 222
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password_hash, created_at) FROM stdin;
2	Test User	test@careeros.com	$2b$10$vkCmXZvnS/1NfYDjZYySNuKzBjvfU91aLTYli28RzFKso5ipHzUSG	2026-09-12 13:25:41.617496
3	Test User	testuser123@gmail.com	$2b$10$Wezs4IbrAjYKdLxjw79T3.YnX7ZB9v9oaUUx0lYkuWBDevNZNiJPy	2026-09-26 15:18:52.118144
4	saravana harish	sample@gmail.com	$2b$10$NI8AgO1pKlHeX8FR8VCFzeikfls/UiQqw.sZJnitbZ9OJC7N3bElK	2026-09-30 10:23:16.856767
\.


--
-- TOC entry 5248 (class 0 OID 0)
-- Dependencies: 223
-- Name: career_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.career_profiles_id_seq', 2, true);


--
-- TOC entry 5249 (class 0 OID 0)
-- Dependencies: 245
-- Name: career_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.career_roles_id_seq', 110, true);


--
-- TOC entry 5250 (class 0 OID 0)
-- Dependencies: 241
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 10, true);


--
-- TOC entry 5251 (class 0 OID 0)
-- Dependencies: 249
-- Name: department_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_roles_id_seq', 167, true);


--
-- TOC entry 5252 (class 0 OID 0)
-- Dependencies: 243
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_id_seq', 10, true);


--
-- TOC entry 5253 (class 0 OID 0)
-- Dependencies: 237
-- Name: learning_resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.learning_resources_id_seq', 57, true);


--
-- TOC entry 5254 (class 0 OID 0)
-- Dependencies: 225
-- Name: resumes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resumes_id_seq', 9, true);


--
-- TOC entry 5255 (class 0 OID 0)
-- Dependencies: 251
-- Name: role_aliases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_aliases_id_seq', 1, false);


--
-- TOC entry 5256 (class 0 OID 0)
-- Dependencies: 235
-- Name: role_requirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_requirements_id_seq', 33, true);


--
-- TOC entry 5257 (class 0 OID 0)
-- Dependencies: 247
-- Name: role_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_skills_id_seq', 674, true);


--
-- TOC entry 5258 (class 0 OID 0)
-- Dependencies: 233
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- TOC entry 5259 (class 0 OID 0)
-- Dependencies: 231
-- Name: skill_relationships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skill_relationships_id_seq', 6, true);


--
-- TOC entry 5260 (class 0 OID 0)
-- Dependencies: 239
-- Name: skill_resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skill_resources_id_seq', 57, true);


--
-- TOC entry 5261 (class 0 OID 0)
-- Dependencies: 227
-- Name: skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skills_id_seq', 297, true);


--
-- TOC entry 5262 (class 0 OID 0)
-- Dependencies: 229
-- Name: user_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_skills_id_seq', 87, true);


--
-- TOC entry 5263 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- TOC entry 4969 (class 2606 OID 32780)
-- Name: career_profiles career_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_profiles
    ADD CONSTRAINT career_profiles_pkey PRIMARY KEY (id);


--
-- TOC entry 4971 (class 2606 OID 32782)
-- Name: career_profiles career_profiles_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_profiles
    ADD CONSTRAINT career_profiles_user_id_key UNIQUE (user_id);


--
-- TOC entry 5011 (class 2606 OID 41000)
-- Name: career_roles career_roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_roles
    ADD CONSTRAINT career_roles_name_key UNIQUE (name);


--
-- TOC entry 5013 (class 2606 OID 40998)
-- Name: career_roles career_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_roles
    ADD CONSTRAINT career_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 5003 (class 2606 OID 40970)
-- Name: courses courses_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_name_key UNIQUE (name);


--
-- TOC entry 5005 (class 2606 OID 40968)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- TOC entry 5021 (class 2606 OID 41036)
-- Name: department_roles department_roles_department_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_roles
    ADD CONSTRAINT department_roles_department_id_role_id_key UNIQUE (department_id, role_id);


--
-- TOC entry 5023 (class 2606 OID 41034)
-- Name: department_roles department_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_roles
    ADD CONSTRAINT department_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 5007 (class 2606 OID 40982)
-- Name: departments departments_course_id_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_course_id_name_key UNIQUE (course_id, name);


--
-- TOC entry 5009 (class 2606 OID 40980)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- TOC entry 4997 (class 2606 OID 32923)
-- Name: learning_resources learning_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.learning_resources
    ADD CONSTRAINT learning_resources_pkey PRIMARY KEY (id);


--
-- TOC entry 4973 (class 2606 OID 32801)
-- Name: resumes resumes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resumes
    ADD CONSTRAINT resumes_pkey PRIMARY KEY (id);


--
-- TOC entry 4975 (class 2606 OID 32803)
-- Name: resumes resumes_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resumes
    ADD CONSTRAINT resumes_user_id_key UNIQUE (user_id);


--
-- TOC entry 5029 (class 2606 OID 41058)
-- Name: role_aliases role_aliases_alias_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_aliases
    ADD CONSTRAINT role_aliases_alias_key UNIQUE (alias);


--
-- TOC entry 5031 (class 2606 OID 41056)
-- Name: role_aliases role_aliases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_aliases
    ADD CONSTRAINT role_aliases_pkey PRIMARY KEY (id);


--
-- TOC entry 4993 (class 2606 OID 32894)
-- Name: role_requirements role_requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_requirements
    ADD CONSTRAINT role_requirements_pkey PRIMARY KEY (id);


--
-- TOC entry 4995 (class 2606 OID 32896)
-- Name: role_requirements role_requirements_role_id_skill_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_requirements
    ADD CONSTRAINT role_requirements_role_id_skill_id_key UNIQUE (role_id, skill_id);


--
-- TOC entry 5017 (class 2606 OID 41012)
-- Name: role_skills role_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_skills
    ADD CONSTRAINT role_skills_pkey PRIMARY KEY (id);


--
-- TOC entry 5019 (class 2606 OID 41014)
-- Name: role_skills role_skills_role_id_skill_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_skills
    ADD CONSTRAINT role_skills_role_id_skill_id_key UNIQUE (role_id, skill_id);


--
-- TOC entry 4989 (class 2606 OID 32883)
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- TOC entry 4991 (class 2606 OID 32881)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4985 (class 2606 OID 32857)
-- Name: skill_relationships skill_relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill_relationships
    ADD CONSTRAINT skill_relationships_pkey PRIMARY KEY (id);


--
-- TOC entry 4987 (class 2606 OID 32859)
-- Name: skill_relationships skill_relationships_source_skill_id_target_skill_id_relatio_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill_relationships
    ADD CONSTRAINT skill_relationships_source_skill_id_target_skill_id_relatio_key UNIQUE (source_skill_id, target_skill_id, relationship_type);


--
-- TOC entry 4999 (class 2606 OID 32934)
-- Name: skill_resources skill_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill_resources
    ADD CONSTRAINT skill_resources_pkey PRIMARY KEY (id);


--
-- TOC entry 5001 (class 2606 OID 32936)
-- Name: skill_resources skill_resources_skill_id_resource_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill_resources
    ADD CONSTRAINT skill_resources_skill_id_resource_id_key UNIQUE (skill_id, resource_id);


--
-- TOC entry 4977 (class 2606 OID 32822)
-- Name: skills skills_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_name_key UNIQUE (name);


--
-- TOC entry 4979 (class 2606 OID 32820)
-- Name: skills skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);


--
-- TOC entry 4981 (class 2606 OID 32834)
-- Name: user_skills user_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_skills
    ADD CONSTRAINT user_skills_pkey PRIMARY KEY (id);


--
-- TOC entry 4983 (class 2606 OID 32836)
-- Name: user_skills user_skills_user_id_skill_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_skills
    ADD CONSTRAINT user_skills_user_id_skill_id_key UNIQUE (user_id, skill_id);


--
-- TOC entry 4965 (class 2606 OID 24592)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4967 (class 2606 OID 24590)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 5024 (class 1259 OID 41065)
-- Name: idx_department_roles_department_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_department_roles_department_id ON public.department_roles USING btree (department_id);


--
-- TOC entry 5025 (class 1259 OID 41066)
-- Name: idx_department_roles_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_department_roles_role_id ON public.department_roles USING btree (role_id);


--
-- TOC entry 5026 (class 1259 OID 41067)
-- Name: idx_role_aliases_alias; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_role_aliases_alias ON public.role_aliases USING btree (alias);


--
-- TOC entry 5027 (class 1259 OID 41064)
-- Name: idx_role_aliases_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_role_aliases_role_id ON public.role_aliases USING btree (role_id);


--
-- TOC entry 5014 (class 1259 OID 41069)
-- Name: idx_role_skills_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_role_skills_role_id ON public.role_skills USING btree (role_id);


--
-- TOC entry 5015 (class 1259 OID 41070)
-- Name: idx_role_skills_skill_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_role_skills_skill_id ON public.role_skills USING btree (skill_id);


--
-- TOC entry 5032 (class 2606 OID 32783)
-- Name: career_profiles career_profiles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_profiles
    ADD CONSTRAINT career_profiles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5045 (class 2606 OID 41037)
-- Name: department_roles department_roles_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_roles
    ADD CONSTRAINT department_roles_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(id) ON DELETE CASCADE;


--
-- TOC entry 5046 (class 2606 OID 41042)
-- Name: department_roles department_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_roles
    ADD CONSTRAINT department_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.career_roles(id) ON DELETE CASCADE;


--
-- TOC entry 5042 (class 2606 OID 40983)
-- Name: departments departments_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 5033 (class 2606 OID 32804)
-- Name: resumes resumes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resumes
    ADD CONSTRAINT resumes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5047 (class 2606 OID 41059)
-- Name: role_aliases role_aliases_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_aliases
    ADD CONSTRAINT role_aliases_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.career_roles(id) ON DELETE CASCADE;


--
-- TOC entry 5038 (class 2606 OID 32897)
-- Name: role_requirements role_requirements_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_requirements
    ADD CONSTRAINT role_requirements_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 5039 (class 2606 OID 32902)
-- Name: role_requirements role_requirements_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_requirements
    ADD CONSTRAINT role_requirements_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.skills(id) ON DELETE CASCADE;


--
-- TOC entry 5043 (class 2606 OID 41015)
-- Name: role_skills role_skills_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_skills
    ADD CONSTRAINT role_skills_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.career_roles(id) ON DELETE CASCADE;


--
-- TOC entry 5044 (class 2606 OID 41020)
-- Name: role_skills role_skills_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_skills
    ADD CONSTRAINT role_skills_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.skills(id) ON DELETE CASCADE;


--
-- TOC entry 5036 (class 2606 OID 32860)
-- Name: skill_relationships skill_relationships_source_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill_relationships
    ADD CONSTRAINT skill_relationships_source_skill_id_fkey FOREIGN KEY (source_skill_id) REFERENCES public.skills(id) ON DELETE CASCADE;


--
-- TOC entry 5037 (class 2606 OID 32865)
-- Name: skill_relationships skill_relationships_target_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill_relationships
    ADD CONSTRAINT skill_relationships_target_skill_id_fkey FOREIGN KEY (target_skill_id) REFERENCES public.skills(id) ON DELETE CASCADE;


--
-- TOC entry 5040 (class 2606 OID 32942)
-- Name: skill_resources skill_resources_resource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill_resources
    ADD CONSTRAINT skill_resources_resource_id_fkey FOREIGN KEY (resource_id) REFERENCES public.learning_resources(id) ON DELETE CASCADE;


--
-- TOC entry 5041 (class 2606 OID 32937)
-- Name: skill_resources skill_resources_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill_resources
    ADD CONSTRAINT skill_resources_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.skills(id) ON DELETE CASCADE;


--
-- TOC entry 5034 (class 2606 OID 32842)
-- Name: user_skills user_skills_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_skills
    ADD CONSTRAINT user_skills_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.skills(id) ON DELETE CASCADE;


--
-- TOC entry 5035 (class 2606 OID 32837)
-- Name: user_skills user_skills_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_skills
    ADD CONSTRAINT user_skills_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2026-10-03 17:13:59

--
-- PostgreSQL database dump complete
--

\unrestrict 82lRAw7pIaZWmC4LMc8rR1PdBQyLM4erAMOGBwT5l2eA3QL75EGozb2mhJNrYef

