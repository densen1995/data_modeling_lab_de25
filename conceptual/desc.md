# Conceptual models


**Conceptual ERD**

<img src = "cdm.png" width =500>

**Relationship statements**

**Student-Class**
- A Student must belong to *one and only one* Class
- A Class can have *zero or many* Students

**Class-Education_leader**
- A Class is managed by *one and only* Education_leader
- An education_leader manages *three and only three* Classes (business rule)

**Class-Program**
- A Class belongs to *one and only one* Program
- A Program has *three and only three* Classes (business rule)

**Program-Course**
- A Program consists *one or many* Courses
- A course may belong to *zero or many* Programs

**Class-Course**
- A Class can study *one or many* Courses
- A Course can be studied by *zero or many* Classes

**Educator-Course**
- An Educator teaches *one or many* Courses
- A Course can be taught by *one or many* Educators

**Educator-Employment_type**
- An Educator has *one and only one* employment_type 
- An Employment_type may be associated with *zero or many* Educators


**Educator-Consultant**


**Consultant-Company**
- A Consultant works for *one* Company
- A Company may have *zero or many* consultants

**Facility-Class**
- A Facility may have *zero or many* Classes
- A Class has their lectures/classes or takes place in *one* Facility

**Personal_data-Student**
- A Personal data can belong to *zero or one* Student
- A Student may have *one* Personal data

**Personal_data-Educational_leader**
- A Personal data can belong to *zero or one* Educational leader
- An Educational leader may have *one* Personal data


**Personal_data-Educator**
- A Personal data can belong to *zero or one* Educator
- An Educator may have *one* Personal data



