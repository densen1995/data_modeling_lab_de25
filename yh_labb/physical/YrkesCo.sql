CREATE TABLE "Program" (
  "program_id" INTEGER PRIMARY KEY,
  "program_name" "VARCHAR(50)" NOT NULL,
  "description" TEXT
);

CREATE TABLE "Course" (
  "course_id" INTEGER PRIMARY KEY,
  "course_code" "VARCHAR(20)" UNIQUE NOT NULL,
  "course_name" "VARCHAR(100)" NOT NULL,
  "credits" INTEGER NOT NULL,
  "description" TEXT,
  "is_standalone" BOOLEAN DEFAULT false """implies that most courses must belong to a program and could only be few stand alone courses, 
                                            so if not 'False' then 'True' """
);

CREATE TABLE "Facility" (
  "facility_id" INTEGER PRIMARY KEY,
  "city_name" "VARCHAR(50)" NOT NULL,
  "address" TEXT NOT NULL
);

CREATE TABLE "Educational_leader" (
  "educational_leader_id" INTEGER PRIMARY KEY,
  "first_name" "VARCHAR(50)",
  "last_name" "VARCHAR(50)",
  "email" "VARCHAR(100)",
  "personal_data_id" INTEGER UNIQUE NOT NULL
);

CREATE TABLE "Class" (
  "class_id" INTEGER PRIMARY KEY,
  "program_id" INTEGER NOT NULL,
  "educational_leader_id" INTEGER NOT NULL,
  "facility_id" INTEGER NOT NULL,
  "start_year" DATE NOT NULL
);

CREATE TABLE "Employment_type" (
  "employment_type_id" INTEGER PRIMARY KEY,
  "type_name" "VARCHAR(50)" UNIQUE NOT NULL
);

CREATE TABLE "Personal_data" (
  "personal_data_id" INTEGER PRIMARY KEY,
  "personal_number" "VARCHAR(12)" UNIQUE NOT NULL,
  "date_of_birth" TIMESTAMP NOT NULL,
  "address" TEXT NOT NULL
);

CREATE TABLE "Educator" (
  "educator_id" INTEGER PRIMARY KEY,
  "first_name" "VARCHAR(50)",
  "last_name" "VARCHAR(50)",
  "email" "VARCHAR(100)",
  "employment_type_id" INTEGER NOT NULL,
  "personal_data_id" INTEGER UNIQUE NOT NULL
);

CREATE TABLE "Student" (
  "student_id" INTEGER PRIMARY KEY,
  "first_name" "VARCHAR(50)",
  "last_name" "VARCHAR(50)",
  "email" "VARCHAR(100)",
  "personal_data_id" INT UNIQUE NOT NULL,
  "class_id" INTEGER NOT NULL
);

CREATE TABLE "Company" (
  "company_id" INTEGER PRIMARY KEY,
  "company_name" "VARCHAR(100)",
  "organization_nr" "VARCHAR(20)",
  "f_tax" BOOLEAN,
  "address" TEXT
);

CREATE TABLE "Consultant" (
  "consultant_id" INTEGER PRIMARY KEY,
  "educator_id" INTEGER UNIQUE NOT NULL,
  "company_id" INTEGER NOT NULL,
  "hourly_pay" INTEGER NOT NULL
);

CREATE TABLE "Program_course" (
  "program_id" INTEGER,
  "course_id" INTEGER,
  "PRIMARY" "KEY(program_id,course_id)"
);

CREATE TABLE "Class_course" (
  "class_id" INTEGER,
  "course_id" INTEGER,
  "PRIMARY" "KEY(class_id,course_id)"
);

CREATE TABLE "Educator_course" (
  "educator_id" INTEGER,
  "course_id" INTEGER,
  "PRIMARY" "KEY(educator_id,course_id)"
);

ALTER TABLE "Educational_leader" ADD FOREIGN KEY ("personal_data_id") REFERENCES "Personal_data" ("personal_data_id");

ALTER TABLE "Class" ADD FOREIGN KEY ("program_id") REFERENCES "Program" ("program_id");

ALTER TABLE "Class" ADD FOREIGN KEY ("educational_leader_id") REFERENCES "Educational_leader" ("educational_leader_id");

ALTER TABLE "Class" ADD FOREIGN KEY ("facility_id") REFERENCES "Facility" ("facility_id");

ALTER TABLE "Educator" ADD FOREIGN KEY ("employment_type_id") REFERENCES "Employment_type" ("employment_type_id");

ALTER TABLE "Educator" ADD FOREIGN KEY ("personal_data_id") REFERENCES "Personal_data" ("personal_data_id");

ALTER TABLE "Student" ADD FOREIGN KEY ("personal_data_id") REFERENCES "Personal_data" ("personal_data_id");

ALTER TABLE "Student" ADD FOREIGN KEY ("class_id") REFERENCES "Class" ("class_id");

ALTER TABLE "Consultant" ADD FOREIGN KEY ("educator_id") REFERENCES "Educator" ("educator_id");

ALTER TABLE "Consultant" ADD FOREIGN KEY ("company_id") REFERENCES "Company" ("company_id");

ALTER TABLE "Program_course" ADD FOREIGN KEY ("program_id") REFERENCES "Program" ("program_id");

ALTER TABLE "Program_course" ADD FOREIGN KEY ("course_id") REFERENCES "Course" ("course_id");

ALTER TABLE "Class_course" ADD FOREIGN KEY ("class_id") REFERENCES "Class" ("class_id");

ALTER TABLE "Class_course" ADD FOREIGN KEY ("course_id") REFERENCES "Course" ("course_id");

ALTER TABLE "Educator_course" ADD FOREIGN KEY ("educator_id") REFERENCES "Educator" ("educator_id");

ALTER TABLE "Educator_course" ADD FOREIGN KEY ("course_id") REFERENCES "Course" ("course_id");
