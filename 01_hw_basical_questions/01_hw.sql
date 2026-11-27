
-- Задание 1
SELECT first_name, last_name 
FROM university.students s
JOIN university.departments d ON s.major_department_id = d.department_id
WHERE d.name = 'Computer Science';

-- Задание 2
SELECT c.code, c.title FROM university.courses c 
JOIN university.departments d ON c.department_id = d.department_id 
WHERE d.name = 'Mathematics'
ORDER BY c.code; 

--Задание 3
SELECT s.first_name, s.last_name FROM university.students s
WHERE s.gpa < 2.5 
ORDER BY s.gpa;

--Задание 4
SELECT s.first_name, s.last_name, e.semester, c.code 
FROM university.students s 
JOIN university.enrollments e ON s.student_id = e.student_id 
JOIN university.courses c ON e.course_id = c.course_id 
WHERE e.grade IS NOT NULL;

--Задание 5
SELECT s.first_name, s.last_name
FROM university.students s 
ORDER BY s.gpa DESC
LIMIT 10;
