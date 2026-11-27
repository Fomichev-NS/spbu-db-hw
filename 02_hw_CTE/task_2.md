# СTE, VIEW, TEMP TABLE

## Пункты домашнего задания 

-- ЗАДАНИЕ 1 (CTE):
-- Найдите студентов, у которых средняя посещаемость >= 85 по всем курсам.
-- Выведите: student_id, ФИО, avg_attendance.

-- ЗАДАНИЕ 2 (CTE + TOP-N):
-- Выведите TOP-3 кафедры по среднему GPA студентов (major_department),

-- ЗАДАНИЕ 3 (VIEW):
-- Создайте VIEW v_instructor_salary_level:
--   salary >= 100000 -> 'high'
--   salary >= 70000  -> 'mid'
--   иначе            -> 'low'
-- Затем посчитайте, сколько преподавателей в каждой категории.

-- ЗАДАНИЕ 4 (TEMP):
-- Создайте TEMP таблицу tmp_failed_enrollments (is_passed = false).
-- Выведите: топ-10 курсов с максимальным числом провалов (id, число провалов).

-- ЗАДАНИЕ 5 (VIEW + CTE):
-- На основе v_student_course_enrollments найдите студентов, у которых >= 2 оценок 'F'.
-- Выведите student_id, ФИО, count_f.