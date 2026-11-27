-- ЗАДАНИЕ 1 (CTE):
WITH stable_students AS (
	SELECT student_id, ROUND(AVG(attendance_percent), 2) AS avg_attendance 
	FROM university.enrollments e
	GROUP BY e.student_id
)

SELECT ss.student_id, s.first_name, s.last_name, ss.avg_attendance FROM university.students s
JOIN stable_students ss ON ss.student_id = s.student_id 
WHERE ss.avg_attendance >= 85;


--ЗАДАНИЕ 2:
WITH strong_departments AS (
	SELECT d.department_id, d.name, ROUND(AVG(s.gpa), 2) AS avg_gpa FROM university.departments d
	JOIN university.students s  ON d.department_id = s.major_department_id 
	GROUP BY d.department_id, d.name 
	ORDER BY avg_gpa DESC
)
SELECT * FROM strong_departments LIMIT 3;


--ЗАДАНИЕ 3:
CREATE OR REPLACE VIEW v_instructor_salary_level AS 
	SELECT 
	CASE
		WHEN salary >= 100000 THEN 'high'
		WHEN salary >= 70000 THEN 'mid'
		ELSE 'low'
	END AS salary_level
FROM university.instructors;

SELECT salary_level, COUNT(*) AS count_level FROM v_instructor_salary_level
GROUP BY salary_level 
ORDER BY count_level DESC;


--ЗАДАНИЕ 4:
CREATE TEMP TABLE tmp_failed_enrollments AS
	SELECT c.course_id, count(*) AS falied_pass FROM university.enrollments e
	JOIN university.courses c ON c.course_id = e.course_id 
	WHERE e.is_passed = FALSE
	GROUP BY c.course_id;

SELECT * FROM tmp_failed_enrollments t
ORDER BY t.falied_pass  DESC
LIMIT 10;

--ЗАДАНИЕ 5:
SET search_path TO university; 
CREATE OR REPLACE VIEW v_student_course_enrollments AS
SELECT
    e.enrollment_id,
    e.semester,
    e.grade,
    e.attendance_percent,
    e.is_passed,

    s.student_id,
    s.first_name AS student_first_name,
    s.last_name  AS student_last_name,
    s.enrollment_year,
    s.gpa,
    s.is_full_time,

    c.course_id,
    c.code AS course_code,
    c.title AS course_title,
    c.credits,
    c.level AS course_level,

    d.department_id AS course_department_id,
    d.name AS course_department_name
FROM enrollments e
JOIN students s  ON s.student_id = e.student_id
JOIN courses  c  ON c.course_id  = e.course_id
JOIN departments d ON d.department_id = c.department_id;

WITH stupid_students AS(
	SELECT student_id, student_first_name, student_last_name, count(*) AS count_bad_grade FROM v_student_course_enrollments
	WHERE grade = 'F'
	GROUP BY student_id, student_first_name, student_last_name
)

SELECT * FROM stupid_students 
WHERE count_bad_grade >= 2;
	
