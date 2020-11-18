CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(40) UNIQUE,
    password VARCHAR(80),
    enabled BOOLEAN DEFAULT TRUE
);

INSERT INTO users (user_id, username, password)
VALUES (1, 'admin', '$2a$10$V5E6O2mrh26aM6FZAcNkTuI2Qc5uVBH8FUD15.XnUcccW6opbjYLq' )
ON CONFLICT DO NOTHING;

CREATE TABLE IF NOT EXISTS roles (
    role_id SERIAL PRIMARY KEY,
    name VARCHAR(33) UNIQUE
);

INSERT INTO roles (role_id, name)
    VALUES 
    (1, 'ADMIN'),
    (1, 'ROLE_ADMIN')
ON CONFLICT DO NOTHING;

CREATE TABLE IF NOT EXISTS user_roles (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    role_id INTEGER,

    FOREIGN KEY (role_id)
        REFERENCES roles(role_id)
        ON DELETE CASCADE,

    FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE

);

INSERT INTO user_roles (id, user_id, role_id)
VALUES (1, 1, 1)
ON CONFLICT DO NOTHING;

CREATE TABLE IF NOT EXISTS addresses (
    id SERIAL PRIMARY KEY,
    pincode INTEGER,
    house_no VARCHAR(10),
    locality VARCHAR(30),
    state VARCHAR(30),
    city VARCHAR(30),
    country VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS personal_profiles (
    id INTEGER PRIMARY KEY,
    first_name VARCHAR(30),
    middle_name VARCHAR(30),
    last_name VARCHAR(30),
    dob DATE,
    email VARCHAR(50),
    fathers_name VARCHAR(50),
    mothers_name VARCHAR(50),
    fathers_occupation VARCHAR(100),
    mothers_occupation VARCHAR(100),
    mother_tongue VARCHAR(30),
    current_address_fk INTEGER,
    permanent_address_fk INTEGER,

    FOREIGN KEY (id)
        REFERENCES users(user_id)
        ON DELETE CASCADE,

    
    FOREIGN KEY (current_address_fk)
        REFERENCES addresses(id)
        ON DELETE SET NULL,    

    FOREIGN KEY (permanent_address_fk)
        REFERENCES addresses(id)
        ON DELETE SET NULL    

);

CREATE TABLE IF NOT EXISTS universities(
    id SERIAL PRIMARY KEY,
    name VARCHAR(60)

);

INSERT INTO universities (id, name) 
VALUES 
    (0, 'Not Defined')
ON CONFLICT DO NOTHING;


CREATE TABLE IF NOT EXISTS criteria_types(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20),
    UNIQUE (name)
);

INSERT INTO criteria_types (id, name) 
VALUES 
    (0, 'Not Defined'),
    (1, 'class X'), 
    (2, 'class XII'),
    (3, 'UG'), 
    (4, 'PG') 
ON CONFLICT DO NOTHING;




CREATE TABLE IF NOT EXISTS results(
    id SERIAL PRIMARY KEY,
    result_type INTEGER ,
    student INTEGER NOT NULL,
    year INTEGER DEFAULT 0,
    univ_id INTEGER,
    specialisation VARCHAR(50),
    cgpa NUMERIC DEFAULT 0,
    marks NUMERIC DEFAULT 0,
    percentage NUMERIC DEFAULT 0,
    backlogs INTEGER DEFAULT 0,
    is_verified BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (result_type)
        REFERENCES criteria_types(id)
        ON DELETE CASCADE,

    FOREIGN KEY (student)
        REFERENCES personal_profiles(id)
        ON DELETE CASCADE, 

    FOREIGN KEY (univ_id)
        REFERENCES universities(id)
        ON DELETE SET NULL  

     

);


CREATE TABLE IF NOT EXISTS companies (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    profile VARCHAR(50),
    job_description TEXT
);


CREATE TABLE IF NOT EXISTS criterias (
    id SERIAL PRIMARY KEY, 
    type INTEGER DEFAULT 0,
    company_id INTEGER NOT NULL,
    year_min INTEGER DEFAULT 0,
    year_max INTEGER DEFAULT 3000,
    min_cgpa NUMERIC DEFAULT 0,
    min_marks NUMERIC DEFAULT 0,
    min_percentage NUMERIC DEFAULT 0,
    allowed_backlogs INTEGER DEFAULT 10,

    FOREIGN KEY (type)
        REFERENCES criteria_types(id)
        ON DELETE CASCADE,

    FOREIGN KEY (company_id)
        REFERENCES companies(id)
        ON DELETE CASCADE 

    

);

CREATE TABLE IF NOT EXISTS criteria_specialisations (
    id SERIAL PRIMARY KEY,
    criteria_id INTEGER NOT NULL,
    specialisation VARCHAR(50),

    FOREIGN KEY (criteria_id)
        REFERENCES criterias(id)
        ON DELETE CASCADE,

    UNIQUE (criteria_id, specialisation)
);


CREATE TABLE IF NOT EXISTS resumes(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    name VARCHAR(30) NOT NULL,

    FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS fields(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    verified BOOLEAN DEFAULT FALSE,
    verified_by INTEGER,
    title VARCHAR(100),
    description VARCHAR(200),
    duration VARCHAR(20),

    FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE,

    FOREIGN KEY (verified_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL

);


CREATE TABLE IF NOT EXISTS resume_fields(
    field_id INTEGER NOT NULL,
    resume_id INTEGER NOT NULL,

    FOREIGN KEY (field_id)
        REFERENCES fields(id)
        ON DELETE CASCADE,
    
    FOREIGN KEY (resume_id)
        REFERENCES resumes(id)
        ON DELETE CASCADE,

    PRIMARY KEY (field_id, resume_id)
);


CREATE TABLE IF NOT EXISTS willingness(
    user_id INTEGER NOT NULL,
    company_id INTEGER NOT NULL,
    resume_id INTEGER NOT NULL,

    FOREIGN KEY (user_id)
        REFERENCES users (user_id)
        ON DELETE CASCADE,

    FOREIGN KEY (company_id)
        REFERENCES companies(id)
        ON DELETE CASCADE,
    
    FOREIGN KEY (resume_id)
        REFERENCES resumes(id)
        ON DELETE CASCADE,

    PRIMARY KEY (user_id, company_id)
);


