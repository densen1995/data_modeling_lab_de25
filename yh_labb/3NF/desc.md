 **3NF JUSTIFICATION**

 **First Normal Form (1NF)**
 - Each table has a primary key
 - No repeating groups or multi-valued attributes
 - Uniform column data

 **Second Normal Form (2NF)**
 - 1NF
 - Junction tables (Program_course, Class_course, Educator_course) contain only foreign keys
 - All non-prime(key) attributes are fully functionally dependent on the whole primary key
 - No partial dependency exists

 **Third Normal Form (3NF)**
 - 2NF
 - No transitive dependencies exist
 - Sensitive personal information is separated into the Personal_data table
 - Employment type, company, facility, and program details are stored in independent entities
 - Non-prime(key) attributes depend only on the primary key, not on other non-prime attributes

**Example**
Table Student
student_id (PK)
first_name
last_name
email
personal_data_id (FK, UNIQUE)
class_id (FK)

- student_id uniquely identifies a student
- All non-prime attributes depend only on student_id
- Sensitive attributes (personal number, address, date of birth) are not stored here
- Personal data is stored in a separate table

**Database is normalized to Third Normal Form(3NF).**