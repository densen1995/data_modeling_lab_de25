CREATE SCHEMA IF NOT EXISTS yh;


CREATE TABLE IF NOT EXISTS yh.program(
  program_id INTEGER PRIMARY KEY,
  program_name VARCHAR(50) NOT NULL,
  descriptions TEXT
);

INSERT INTO yh.program(program_id, program_name, descriptions)
VALUES
    (1, 'Data Engineering', 'Program focused on data pipelines'),
    (2, 'Data Science', 'Program focused on analytics');


CREATE TABLE IF NOT EXISTS yh.course(
  course_id INTEGER PRIMARY KEY,
  course_code VARCHAR(20) UNIQUE NOT NULL,
  course_name VARCHAR(100) NOT NULL,
  credits INTEGER NOT NULL,
  descriptions TEXT,
  is_standalone BOOLEAN DEFAULT false --implies that most courses must belong to a program and could only be few stand alone courses which are exceptions--, 
                                      --so if not 'False then 'True' --
  );

INSERT INTO yh.course(course_id, course_code, course_name, credits, descriptions, is_standalone)
VALUES
    (1, 'SQL101', 'SQL Basics', 20, 'Intro to SQL', FALSE),
    (2, 'PY101', 'Python Basics', 25, 'Intro to Python', TRUE),
    (3, 'DM103', 'Data Modeling', 30, 'Intro to data modeling', FALSE);

CREATE TABLE IF NOT EXISTS yh.facility (
  facility_id INTEGER PRIMARY KEY,
  city_name VARCHAR(50) NOT NULL,
  adress TEXT NOT NULL
);

INSERT INTO yh.facility(facility_id, city_name, adress)
VALUES
    (1, 'Stockholm', 'Sveavägen 10'),
    (2, 'Göteborg', 'Avenyn 5');


CREATE TABLE IF NOT EXISTS yh.educational_leader (
  educational_leader_id INTEGER PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  personal_data_id INTEGER UNIQUE NOT NULL
);

INSERT INTO yh.educational_leader(educational_leader_id, first_name, last_name, email, personal_data_id) 
VALUES
    (1, 'Anita', 'Svensson', 'anna.svensson@yh.se', 1)
    


CREATE TABLE IF NOT EXISTS yh.class (
  class_id INTEGER PRIMARY KEY,
  program_id INTEGER NOT NULL,
  educational_leader_id INTEGER NOT NULL,
  facility_id INTEGER NOT NULL,
  start_year DATE NOT NULL
);

INSERT INTO yh.class(class_id, program_id, educational_leader_id, facility_id, start_year)
VALUES
(1, 1, 1, 1, '2024-08-01'),
(2, 1, 1, 2, '2025-08-01'),
(3, 1, 1, 1, '2026-08-01');

CREATE TABLE IF NOT EXISTS yh.employment_type(
  employment_type_id INTEGER PRIMARY KEY,
  type_name VARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO yh.employment_type(employment_type_id, type_name)
VALUES
    (1, 'Permanent'),
    (2, 'Consultant');


CREATE TABLE IF NOT EXISTS yh.personal_data (
  personal_data_id INTEGER PRIMARY KEY,
  personal_number VARCHAR(12) UNIQUE NOT NULL,
  date_of_birth TIMESTAMP NOT NULL,
  adress TEXT NOT NULL
);

INSERT INTO yh.personal_data(personal_data_id, personal_number, date_of_birth, adress) 
VALUES
(1, '19900101-1234', '1990-01-01', 'Street 1'),
(2, '19850505-6789', '1985-05-05', 'Street 2'),
(3, '20000101-2222', '2000-01-01', 'Student Street'),
(4, '19920101-6722', '1992-01-01', 'Kungsgatan 34'),


CREATE TABLE IF NOT EXISTS yh.educator (
  educator_id INTEGER PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  employment_type_id INTEGER NOT NULL,
  personal_data_id INTEGER UNIQUE NOT NULL
);

INSERT INTO yh.educator(educator_id, first_name, last_name, email, employment_type_id, personal_data_id)
VALUES
    (1, 'Erik', 'Johansson', 'erik@yrkesco.se', 2, 2),
    (2, 'Dennis', 'Jonathan', 'densen@yrkesco.se', 1, 4);

CREATE TABLE IF NOT EXISTS yh.student (
  student_id INTEGER PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  personal_data_id INT UNIQUE NOT NULL,
  class_id INTEGER NOT NULL
);

INSERT INTO yh.student(student_id, first_name, last_name, email, personal_data_id, class_id)
VALUES
    (1, 'Sara', 'Nilsson', 'sara@student.se', 3, 1),
   

CREATE TABLE IF NOT EXISTS yh.company (
  company_id INTEGER PRIMARY KEY,
  company_name VARCHAR(100),
  organization_nr VARCHAR(20),
  f_tax BOOLEAN,
  adress TEXT
);

INSERT INTO yh.company(company_id, company_name, organization_nr, f_tax, adress)
VALUES
    (1, 'TechConsult AB', '556677-8899', TRUE, 'Consult Street');


CREATE TABLE IF NOT EXISTS yh.consultant (
  consultant_id INTEGER PRIMARY KEY,
  educator_id INTEGER UNIQUE NOT NULL,
  company_id INTEGER NOT NULL,
  hourly_pay INTEGER NOT NULL
);


INSERT INTO yh.consultant(consultant_id, educator_id, company_id, hourly_pay)
VALUES
    (1, 1, 1, 900);


CREATE TABLE IF NOT EXISTS yh.program_course (
  program_id INTEGER,
  course_id INTEGER,
  PRIMARY KEY(program_id,course_id)
);

INSERT INTO yh.program_course(program_id, course_id) 
VALUES
    (1, 1),
    (1, 2);
    


CREATE TABLE IF NOT EXISTS yh.class_course(
  class_id INTEGER,
  course_id INTEGER,
  PRIMARY KEY(class_id,course_id)
);

INSERT INTO yh.class_course(class_id, course_id) 
VALUES
    (1, 1),
    (1, 2);
   


CREATE TABLE IF NOT EXISTS yh.educator_course (
  educator_id INTEGER,
  course_id INTEGER,
  PRIMARY KEY(educator_id,course_id)
);

INSERT INTO yh.educator_course(educator_id, course_id)
VALUES
    (1, 1),
    (1, 2);