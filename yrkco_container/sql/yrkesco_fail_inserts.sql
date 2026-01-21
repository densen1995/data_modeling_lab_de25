--primary key constraint violation(duplicate value)--
INSERT INTO yh.company
(company_id, company_name)
VALUES
(1, 'Another Company');


--not null constraint violation(null value in column course_code)--
INSERT INTO yh.course
(course_id, course_name, credits)
VALUES
(10, 'Broken Course', 10);

