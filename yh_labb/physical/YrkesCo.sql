CREATE TABLE program(
  program_id INTEGER PRIMARY KEY,
  program_name VARCHAR(50) NOT NULL,
  descriptions TEXT
);

CREATE TABLE course (
  course_id INTEGER PRIMARY KEY,
  course_code VARCHAR(20) UNIQUE NOT NULL,
  course_name VARCHAR(100) NOT NULL,
  credits INTEGER NOT NULL,
  descriptions TEXT,
  is_standalone BOOLEAN DEFAULT false """implies that most courses must belong to a program and could only be few stand alone courses, 
                                            so if not 'False' then 'True' """
);

CREATE TABLE facility (
  facility_id INTEGER PRIMARY KEY,
  city_name VARCHAR(50) NOT NULL,
  adress TEXT NOT NULL
);

CREATE TABLE educational_leader (
  educational_leader_id INTEGER PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  personal_data_id INTEGER UNIQUE NOT NULL
);

CREATE TABLE class (
  class_id INTEGER PRIMARY KEY,
  program_id INTEGER NOT NULL,
  educational_leader_id INTEGER NOT NULL,
  facility_id INTEGER NOT NULL,
  start_year DATE NOT NULL
);

CREATE TABLE employment_type(
  employment_type_id INTEGER PRIMARY KEY,
  type_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE personal_data (
  personal_data_id INTEGER PRIMARY KEY,
  personal_number VARCHAR(12) UNIQUE NOT NULL,
  date_of_birth TIMESTAMP NOT NULL,
  address TEXT NOT NULL
);

CREATE TABLE educator (
  educator_id INTEGER PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  employment_type_id INTEGER NOT NULL,
  personal_data_id INTEGER UNIQUE NOT NULL
);

CREATE TABLE student (
  student_id INTEGER PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  personal_data_id INT UNIQUE NOT NULL,
  class_id INTEGER NOT NULL
);

CREATE TABLE company (
  company_id INTEGER PRIMARY KEY,
  company_name VARCHAR(100),
  organization_nr VARCHAR(20),
  f_tax BOOLEAN,
  adress TEXT
);

CREATE TABLE consultant (
  consultant_id INTEGER PRIMARY KEY,
  educator_id INTEGER UNIQUE NOT NULL,
  company_id INTEGER NOT NULL,
  hourly_pay INTEGER NOT NULL
);

CREATE TABLE program_course (
  program_id INTEGER,
  course_id INTEGER,
  PRIMARY KEY(program_id,course_id)
);

CREATE TABLE class_course(
  class_id INTEGER,
  course_id INTEGER,
  PRIMARY KEY(class_id,course_id)
);

CREATE TABLE educator_course (
  educator_id INTEGER,
  course_id INTEGER,
  PRIMARY KEY(educator_id,course_id)
);

ALTER TABLE educational_leader ADD FOREIGN KEY ("personal_data_id") REFERENCES personal_data ("personal_data_id");

ALTER TABLE class ADD FOREIGN KEY ("program_id") REFERENCES program ("program_id");

ALTER TABLE class ADD FOREIGN KEY ("educational_leader_id") REFERENCES educational_leader ("educational_leader_id");

ALTER TABLE class ADD FOREIGN KEY ("facility_id") REFERENCES facility ("facility_id");

ALTER TABLE educator ADD FOREIGN KEY ("employment_type_id") REFERENCES employment_type ("employment_type_id");

ALTER TABLE educator ADD FOREIGN KEY ("personal_data_id") REFERENCES personal_data ("personal_data_id");

ALTER TABLE student ADD FOREIGN KEY ("personal_data_id") REFERENCES personal_data ("personal_data_id");

ALTER TABLE student ADD FOREIGN KEY ("class_id") REFERENCES class ("class_id");

ALTER TABLE consultant ADD FOREIGN KEY ("educator_id") REFERENCES educator ("educator_id");

ALTER TABLE consultant ADD FOREIGN KEY ("company_id") REFERENCES company ("company_id");

ALTER TABLE program_course ADD FOREIGN KEY ("program_id") REFERENCES program ("program_id");

ALTER TABLE program_course ADD FOREIGN KEY ("course_id") REFERENCES course ("course_id");

ALTER TABLE class_course ADD FOREIGN KEY ("class_id") REFERENCES class ("class_id");

ALTER TABLE class_course ADD FOREIGN KEY ("course_id") REFERENCES course ("course_id");

ALTER TABLE educator_course ADD FOREIGN KEY ("educator_id") REFERENCES educator ("educator_id");

ALTER TABLE educator_course ADD FOREIGN KEY ("course_id") REFERENCES course ("course_id");
