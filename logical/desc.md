# Logical models


**Logical ERD**

<img src = "ldm.png" width =500>

**Many to Many Relationship junctions based on the Conceptual modeling**

**ProgramCourse**

**Program-ProgramCourse**
- A Program is associated with one or many ProgramCourse records
- A ProgramCourse record belongs to one and only one Program

**Course-ProgramCourse**
- A Course may be associated with zero or many ProgramCourse records
- A ProgramCourse record belongs to one and only one Course

- Business requirement: Courses may exist independently(standalone)

**ClassCourse**

**Class-ClassCourse**
- A Class is associated with one or many ClassCourse records
- A ClassCourse record belongs to one and only one Class

**Course-ClassCourse**
- A Course may be associated with zero or many ClassCourse records
- A ClassCourse record belongs to one and only one Course

**EducatorCourse**

**Course-EducatorCourse**
- An Educator may be associated with one or many EducatorCourse records
- An EducatorCourse record belongs to one and only one Educator

**Course-EducatorCourse**
- A Course is associated with one or many EducatorCourse records
- An EducatorCourse record belongs to one and only one Course


