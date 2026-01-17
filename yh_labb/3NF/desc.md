 **3NF JUSTIFICATION**

 **First Normal Form (1NF)**
 - Each table has a primary key
 - No repeating groups or multi-valued attributes
 - Unifrom column data

 **Second Normal Form (2NF)**
 - 1NF
 - All non-prime(key) attributes are fully functionally dependent on the whole primary key
 - No partial dependency exists

 **Third Normal Form (3NF)**
 - 2NF
 - No transitive dependencies exist
 - Sensitive personal information is separated into the Personal_data table
 - Employment type, company, facility, and program details are stored in independent entities
 - Non-prime(key) attributes depend only on the primary key, not on other non-prime attributes


**Database is normalized to Third Normal Form(3NF).**