-- show all classes with their program name
--inner join table class and program to achieve this
SELECT
  c.class_id,
  p.program_name,
  c.start_year
FROM yh.class c
JOIN yh.program p
ON c.program_id = p.program_id;

--shows all stand alone course/s
SELECT
  course_id,
  course_code,
  course_name
FROM yh.course
WHERE is_standalone = TRUE;

--stand alone is false
SELECT
  course_id,
  course_code,
  course_name
FROM yh.course
WHERE is_standalone = FALSE;

--Count how many courses each class has
--inner join table class-course and class to achieve this
SELECT
  c.class_id,
  COUNT(cc.course_id) AS number_of_courses
FROM yh.class c
JOIN yh.class_course cc
  ON c.class_id = cc.class_id
GROUP BY c.class_id;

--Show all facilities and how many classes they host
--left join table facility and class to achieve this, introducing a new alias and grouping 
SELECT
  f.city_name,
  COUNT(c.class_id) AS number_of_classes
FROM yh.facility f
LEFT JOIN yh.class c
  ON f.facility_id = c.facility_id
GROUP BY f.city_name;

--Show consultants and their companies
--inner join table consultant ,educator and company to achieve this
SELECT
  e.first_name,
  e.last_name,
  c.company_name,
  con.hourly_pay
FROM yh.consultant con
JOIN yh.educator e
  ON con.educator_id = e.educator_id
JOIN yh.company c
  ON con.company_id = c.company_id;

--Validate a business rule: “An educational leader handles 3 classes”
SELECT
  educational_leader_id,
  COUNT(class_id) AS number_of_classes
FROM yh.class
GROUP BY educational_leader_id;

--Show each educator with their employment status
--inner join table educator and employment-type to achieve this
SELECT
  e.first_name,
  e.last_name,
  et.type_name AS employment_status
FROM yh.educator e
JOIN yh.employment_type et
  ON e.employment_type_id = et.employment_type_id;