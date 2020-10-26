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


