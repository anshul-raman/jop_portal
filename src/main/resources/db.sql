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
VALUES (1, 'ADMIN')
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


