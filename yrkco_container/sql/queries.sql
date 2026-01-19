SELECT
    c.class_id,
    el.first_name AS leader_first_name,
    el.last_name AS leader_last_name,
    co.course_name,
    e.first_name AS educator_first_name,
    e.last_name AS educator_last_name
FROM yh.class c
JOIN yh.educational_leader el
    ON c.educational_leader_id = el.educational_leader_id
JOIN yh.class_course cc
    ON c.class_id = cc.class_id
JOIN yh.course co
    ON cc.course_id = co.course_id
JOIN yh.educator_course ec
    ON co.course_id = ec.course_id
JOIN yh.educator e
    ON ec.educator_id = e.educator_id;
--WHERE c.class_id = 1;


SELECT * FROM yh.company;