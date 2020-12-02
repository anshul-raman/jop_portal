--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5
-- Dumped by pg_dump version 12.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    id integer NOT NULL,
    pincode integer,
    house_no character varying(10),
    locality character varying(30),
    state character varying(30),
    city character varying(30),
    country character varying(30)
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    id integer NOT NULL,
    name character varying(100),
    profile character varying(50),
    job_description text
);


ALTER TABLE public.companies OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_id_seq OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: criteria_specialisations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.criteria_specialisations (
    id integer NOT NULL,
    criteria_id integer NOT NULL,
    specialisation character varying(50)
);


ALTER TABLE public.criteria_specialisations OWNER TO postgres;

--
-- Name: criteria_specialisations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.criteria_specialisations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.criteria_specialisations_id_seq OWNER TO postgres;

--
-- Name: criteria_specialisations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.criteria_specialisations_id_seq OWNED BY public.criteria_specialisations.id;


--
-- Name: criteria_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.criteria_types (
    id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.criteria_types OWNER TO postgres;

--
-- Name: criteria_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.criteria_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.criteria_types_id_seq OWNER TO postgres;

--
-- Name: criteria_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.criteria_types_id_seq OWNED BY public.criteria_types.id;


--
-- Name: criterias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.criterias (
    id integer NOT NULL,
    type integer DEFAULT 0,
    company_id integer NOT NULL,
    year_min integer DEFAULT 0,
    year_max integer DEFAULT 3000,
    min_cgpa numeric DEFAULT 0,
    min_marks numeric DEFAULT 0,
    min_percentage numeric DEFAULT 0,
    allowed_backlogs integer DEFAULT 10
);


ALTER TABLE public.criterias OWNER TO postgres;

--
-- Name: criterias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.criterias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.criterias_id_seq OWNER TO postgres;

--
-- Name: criterias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.criterias_id_seq OWNED BY public.criterias.id;


--
-- Name: fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fields (
    id integer NOT NULL,
    user_id integer NOT NULL,
    verified boolean DEFAULT false,
    verified_by integer,
    title character varying(100),
    description character varying(200),
    duration character varying(20)
);


ALTER TABLE public.fields OWNER TO postgres;

--
-- Name: fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fields_id_seq OWNER TO postgres;

--
-- Name: fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fields_id_seq OWNED BY public.fields.id;


--
-- Name: personal_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_profiles (
    id integer NOT NULL,
    first_name character varying(30),
    middle_name character varying(30),
    last_name character varying(30),
    dob date,
    email character varying(50),
    fathers_name character varying(50),
    mothers_name character varying(50),
    fathers_occupation character varying(100),
    mothers_occupation character varying(100),
    mother_tongue character varying(30),
    current_address_fk integer,
    permanent_address_fk integer
);


ALTER TABLE public.personal_profiles OWNER TO postgres;

--
-- Name: results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.results (
    id integer NOT NULL,
    result_type integer DEFAULT 0,
    student integer NOT NULL,
    year integer DEFAULT 0,
    univ_id integer,
    specialisation character varying(50),
    cgpa numeric DEFAULT 0,
    marks numeric DEFAULT 0,
    percentage numeric DEFAULT 0,
    backlogs integer DEFAULT 0,
    is_verified boolean DEFAULT false
);


ALTER TABLE public.results OWNER TO postgres;

--
-- Name: results_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.results_id_seq OWNER TO postgres;

--
-- Name: results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.results_id_seq OWNED BY public.results.id;


--
-- Name: resume_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resume_fields (
    field_id integer NOT NULL,
    resume_id integer NOT NULL
);


ALTER TABLE public.resume_fields OWNER TO postgres;

--
-- Name: resumes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resumes (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.resumes OWNER TO postgres;

--
-- Name: resumes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resumes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resumes_id_seq OWNER TO postgres;

--
-- Name: resumes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resumes_id_seq OWNED BY public.resumes.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    role_id integer NOT NULL,
    name character varying(33) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.roles ALTER COLUMN role_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: universities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.universities (
    id integer NOT NULL,
    name character varying(60)
);


ALTER TABLE public.universities OWNER TO postgres;

--
-- Name: universities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.universities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universities_id_seq OWNER TO postgres;

--
-- Name: universities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.universities_id_seq OWNED BY public.universities.id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    user_id integer,
    role_id integer,
    id integer NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(40) NOT NULL,
    password character varying(80) NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: willingness; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.willingness (
    user_id integer NOT NULL,
    company_id integer NOT NULL,
    resume_id integer NOT NULL
);


ALTER TABLE public.willingness OWNER TO postgres;

--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: criteria_specialisations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criteria_specialisations ALTER COLUMN id SET DEFAULT nextval('public.criteria_specialisations_id_seq'::regclass);


--
-- Name: criteria_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criteria_types ALTER COLUMN id SET DEFAULT nextval('public.criteria_types_id_seq'::regclass);


--
-- Name: criterias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criterias ALTER COLUMN id SET DEFAULT nextval('public.criterias_id_seq'::regclass);


--
-- Name: fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fields ALTER COLUMN id SET DEFAULT nextval('public.fields_id_seq'::regclass);


--
-- Name: results id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results ALTER COLUMN id SET DEFAULT nextval('public.results_id_seq'::regclass);


--
-- Name: resumes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resumes ALTER COLUMN id SET DEFAULT nextval('public.resumes_id_seq'::regclass);


--
-- Name: universities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universities ALTER COLUMN id SET DEFAULT nextval('public.universities_id_seq'::regclass);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses (id, pincode, house_no, locality, state, city, country) FROM stdin;
22	\N	\N	\N	\N	\N	\N
23	\N	\N	\N	\N	\N	\N
26	0	\N	\N	\N	\N	\N
27	0	\N	\N	\N	\N	\N
25	250001	99	Defence Enclave	Uttar Pradesh	Meerut	India
24	221005	40	C.V Raman Hostel IIT(BHU)	UttarPradesh	Varansi	India
28	0	\N	\N	\N	\N	\N
29	0	\N	\N	\N	\N	\N
31	0	\N	\N	\N	\N	\N
30	127000	1/120	Patel Nagar			
33	0	\N	\N	\N	\N	\N
32	250001	99	XYZ Colony, 	Uttar Pradesh	Meerut	India
34	0	\N	\N	\N	\N	\N
35	0	\N	\N	\N	\N	\N
36	127001	Room 39	CV Raman Hostel	Uttar Pradesh	Meerut	India
37	127001	99	Defence Enclave	Uttar Pradesh	Meerut, UP West	India
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (id, name, profile, job_description) FROM stdin;
10	Test Company	Ai Engineer	$100000000
11	Coding Cartel	SDE	Web developer with experience in MERN stack
26	Google	SDE	Senior Software Develepor, Location-Hyderabad
29	Microsoft	DevOps	Junior DevOps Engineer, 30LPA, Location-Bengaluru
28	Uber	SDE-1	Backend Develeper
27	Amazon	Frontend Develeper	$150000 CTC
30	Sample Company	Test Profile	test description
\.


--
-- Data for Name: criteria_specialisations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.criteria_specialisations (id, criteria_id, specialisation) FROM stdin;
\.


--
-- Data for Name: criteria_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.criteria_types (id, name) FROM stdin;
0	Not Defined
1	class X
2	class XII
3	UG
4	PG
\.


--
-- Data for Name: criterias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.criterias (id, type, company_id, year_min, year_max, min_cgpa, min_marks, min_percentage, allowed_backlogs) FROM stdin;
8	2	11	0	3000	0	0	96	10
9	3	26	0	3000	8	0	0	10
10	1	30	0	3000	10	0	0	10
11	2	30	0	3000	0	0	96	10
12	3	30	0	3000	8.5	0	0	10
\.


--
-- Data for Name: fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fields (id, user_id, verified, verified_by, title, description, duration) FROM stdin;
34	26	t	1	BTECH CSE IIT(BHU)	9CGPA 	2018-2022
32	26	t	1	Class X	10 CGPA, XYZ SCHOOL	2016
33	26	t	1	Class XII	96% XYZ SCHOOL	2018
39	25	t	1	Achievement 	900 AIR Jee Advanced 2018	
30	25	t	1	Skills	C++, Python, JavaScript	2020
40	28	f	\N	Skills	C++, Python, JavaScript	
41	28	f	\N	Class XII	Dewan Public School, Meerut,  95%	2018
42	28	f	\N	Project	DBMS Project 	Nov-2020
43	28	f	\N	Skills AI	Pytorch	
23	18	f	1	website	-	-
19	18	f	1	Skills	C++, Python, JavaScript	
38	25	f	1	Project	Stock Price prediction	2020
17	18	t	1	Class XII	Dewan Public School, Meerut	2018
22	18	t	1	Explo Project	Stock Price prediction	Nov 2016 - Dec 2016
25	18	t	1	StockPrice Prediction	Stock Price prediction using sentiment analysis	2020
35	26	f	\N	Project Cloud Computing	Implemented Load balancing using Cloudsim	Jan-Jun 2020
36	26	f	\N	SKills	C++, Python, JavaScript	
37	26	f	\N	Skills 	ML, Tensorflow, Pytorch	
\.


--
-- Data for Name: personal_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_profiles (id, first_name, middle_name, last_name, dob, email, fathers_name, mothers_name, fathers_occupation, mothers_occupation, mother_tongue, current_address_fk, permanent_address_fk) FROM stdin;
25	Arpit 	 	Mehta	2020-11-07		 --	--	--	-	---	30	31
26	User1_firstname	User1_midlename	 User1_lastname	1999-05-12	user1@gmail.com	 User1_fathersname	  User1_mothersname	  User1_occupation	  User1_occupation	 English	32	33
27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	35
28	Anshul	 	Raman	2019-06-27	anshulraman360@gmail.com	 --	 -	-	-	-	36	37
18	Anshul	MIDDLE NAME  	Raman         	2000-05-12	anshulraman.cse18@itbhu.ac.in	 Mukesh Raman                 	 Sangeeta Raman                 	Engineer                 	Housewife                 	 Hindi;"drop table users"	24	25
1		 	 	2020-11-17		 	 	 	 	 	22	23
\.


--
-- Data for Name: results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.results (id, result_type, student, year, univ_id, specialisation, cgpa, marks, percentage, backlogs, is_verified) FROM stdin;
20	2	25	0	0		0	0	96	0	f
21	2	18	0	1		0	0	98	0	f
23	2	26	0	0		0	0	96	0	f
24	3	18	0	0		10	0	0	0	f
25	3	28	0	2		9	0	0	0	f
26	2	28	0	1		0	0	96	0	f
\.


--
-- Data for Name: resume_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resume_fields (field_id, resume_id) FROM stdin;
19	8
25	8
17	6
19	6
22	6
23	6
25	6
17	5
19	5
22	5
23	5
25	5
17	7
32	11
33	11
34	11
35	11
36	11
37	11
38	10
39	10
30	10
40	13
41	13
42	13
41	14
42	14
43	14
\.


--
-- Data for Name: resumes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resumes (id, user_id, name) FROM stdin;
8	18	Resume 4
6	18	resume 2
5	18	resume1
7	18	Resume 3
11	26	Resume_final
10	25	NEW RESUME
13	28	Resume1
14	28	Resume_AI
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (role_id, name) FROM stdin;
1	ADMIN
2	STUDENT
3	EMPLOYEE2
4	ROLE_ADMIN
\.


--
-- Data for Name: universities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.universities (id, name) FROM stdin;
0	Not Defined
1	Dewan Public School
2	IIT(BHU)
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (user_id, role_id, id) FROM stdin;
1	1	1
1	4	2
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, password, enabled) FROM stdin;
1	admin	$2a$10$V5E6O2mrh26aM6FZAcNkTuI2Qc5uVBH8FUD15.XnUcccW6opbjYLq	t
18	anshul	$2a$10$qh.SysnrMds.a3zrTF/eOuJ5Xz4d0G9beZJoK0rkJeyfesu3hrmJu	t
25	arpitmehta	$2a$10$A6UiSSBlGet5pTUVYcTLw.K/m2l0455apgw1sI9lRxLfJjVmA/rCi	t
26	user1	$2a$10$kyTBvlVsSVnWzD6vHQuw5ePegPLXR2ee4lfVfK..fhySBNoHrwM3m	t
27	user2	$2a$10$SDzLGojU5smzKQvTZHorrOJXLNTRETCC/stxAc8sralECdAP4jWZ.	t
28	user3	$2a$10$ddmPuzqTNGU5j5EDwUEGzO55nvJjMWrgYQ2xpGIfsc.ag/Yeb6EqC	t
\.


--
-- Data for Name: willingness; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.willingness (user_id, company_id, resume_id) FROM stdin;
25	11	10
25	10	10
26	10	11
26	11	11
18	28	5
18	29	6
18	27	7
18	10	7
18	11	8
18	26	7
25	28	10
25	29	10
25	27	10
26	27	11
26	28	11
26	29	11
28	29	13
28	10	14
28	27	13
28	26	13
28	11	13
28	28	13
\.


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addresses_id_seq', 37, true);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 30, true);


--
-- Name: criteria_specialisations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.criteria_specialisations_id_seq', 21, true);


--
-- Name: criteria_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.criteria_types_id_seq', 23, true);


--
-- Name: criterias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.criterias_id_seq', 12, true);


--
-- Name: fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fields_id_seq', 43, true);


--
-- Name: results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.results_id_seq', 27, true);


--
-- Name: resumes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resumes_id_seq', 14, true);


--
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_role_id_seq', 4, true);


--
-- Name: universities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.universities_id_seq', 2, true);


--
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_roles_id_seq', 2, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 28, true);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: criteria_specialisations criteria_specialisations_criteria_id_specialisation_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criteria_specialisations
    ADD CONSTRAINT criteria_specialisations_criteria_id_specialisation_key UNIQUE (criteria_id, specialisation);


--
-- Name: criteria_specialisations criteria_specialisations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criteria_specialisations
    ADD CONSTRAINT criteria_specialisations_pkey PRIMARY KEY (id);


--
-- Name: criteria_types criteria_types_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criteria_types
    ADD CONSTRAINT criteria_types_name_key UNIQUE (name);


--
-- Name: criteria_types criteria_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criteria_types
    ADD CONSTRAINT criteria_types_pkey PRIMARY KEY (id);


--
-- Name: criterias criterias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criterias
    ADD CONSTRAINT criterias_pkey PRIMARY KEY (id);


--
-- Name: fields fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fields
    ADD CONSTRAINT fields_pkey PRIMARY KEY (id);


--
-- Name: personal_profiles personal_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_profiles
    ADD CONSTRAINT personal_profiles_pkey PRIMARY KEY (id);


--
-- Name: results results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_pkey PRIMARY KEY (id);


--
-- Name: resume_fields resume_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resume_fields
    ADD CONSTRAINT resume_fields_pkey PRIMARY KEY (field_id, resume_id);


--
-- Name: resumes resumes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resumes
    ADD CONSTRAINT resumes_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- Name: universities universities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universities
    ADD CONSTRAINT universities_pkey PRIMARY KEY (id);


--
-- Name: roles unq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT unq UNIQUE (name);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: willingness willingness_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.willingness
    ADD CONSTRAINT willingness_pkey PRIMARY KEY (user_id, company_id);


--
-- Name: criteria_specialisations criteria_specialisations_criteria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criteria_specialisations
    ADD CONSTRAINT criteria_specialisations_criteria_id_fkey FOREIGN KEY (criteria_id) REFERENCES public.criterias(id) ON DELETE CASCADE;


--
-- Name: criterias criterias_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criterias
    ADD CONSTRAINT criterias_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id) ON DELETE CASCADE;


--
-- Name: criterias criterias_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criterias
    ADD CONSTRAINT criterias_type_fkey FOREIGN KEY (type) REFERENCES public.criteria_types(id) ON DELETE CASCADE;


--
-- Name: fields fields_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fields
    ADD CONSTRAINT fields_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: fields fields_verified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fields
    ADD CONSTRAINT fields_verified_by_fkey FOREIGN KEY (verified_by) REFERENCES public.users(user_id) ON DELETE SET NULL;


--
-- Name: personal_profiles personal_profiles_current_address_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_profiles
    ADD CONSTRAINT personal_profiles_current_address_fk_fkey FOREIGN KEY (current_address_fk) REFERENCES public.addresses(id) ON DELETE SET NULL;


--
-- Name: personal_profiles personal_profiles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_profiles
    ADD CONSTRAINT personal_profiles_id_fkey FOREIGN KEY (id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: personal_profiles personal_profiles_permanent_address_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_profiles
    ADD CONSTRAINT personal_profiles_permanent_address_fk_fkey FOREIGN KEY (permanent_address_fk) REFERENCES public.addresses(id) ON DELETE SET NULL;


--
-- Name: results results_result_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_result_type_fkey FOREIGN KEY (result_type) REFERENCES public.criteria_types(id) ON DELETE CASCADE;


--
-- Name: results results_student_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_student_fkey FOREIGN KEY (student) REFERENCES public.personal_profiles(id) ON DELETE CASCADE;


--
-- Name: results results_univ_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_univ_id_fkey FOREIGN KEY (univ_id) REFERENCES public.universities(id) ON DELETE SET NULL;


--
-- Name: resume_fields resume_fields_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resume_fields
    ADD CONSTRAINT resume_fields_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.fields(id) ON DELETE CASCADE;


--
-- Name: resume_fields resume_fields_resume_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resume_fields
    ADD CONSTRAINT resume_fields_resume_id_fkey FOREIGN KEY (resume_id) REFERENCES public.resumes(id) ON DELETE CASCADE;


--
-- Name: resumes resumes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resumes
    ADD CONSTRAINT resumes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: user_roles role_fr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT role_fr FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON DELETE CASCADE;


--
-- Name: user_roles user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: willingness willingness_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.willingness
    ADD CONSTRAINT willingness_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id) ON DELETE CASCADE;


--
-- Name: willingness willingness_resume_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.willingness
    ADD CONSTRAINT willingness_resume_id_fkey FOREIGN KEY (resume_id) REFERENCES public.resumes(id) ON DELETE CASCADE;


--
-- Name: willingness willingness_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.willingness
    ADD CONSTRAINT willingness_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

