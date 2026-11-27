# Индексация 

## Пункты домашнего задания 

-- ЗАДАНИЕ 1 (GROUP BY + HAVING):
-- Найдите курсы, у которых доля сдавших (is_passed=true) < 60%.
-- Выведите: code, title, total, passed, passed_percent.

-- ЗАДАНИЕ 2 (WINDOW):
-- Для каждого курса выведите:
--   semester, course_code, enrollments_count,
--   и место курса в семестре (RANK) по числу зачислений.
-- Подсказка: сначала GROUP BY semester, course_id, потом оконная.

-- ЗАДАНИЕ 3 (WINDOW):
-- Выведите студентов, которые входят в TOP-3 по GPA внутри своей кафедры.

-- ЗАДАНИЕ 4 (INDEX DESIGN):
-- Придумайте индексы для запроса:
--   SELECT * FROM enrollments
--   WHERE semester='Fall 2023' AND is_passed=false
--   ORDER BY course_id;
-- Проверьте EXPLAIN (ANALYZE, BUFFERS) до и после.

-- ЗАДАНИЕ 5 (EXPLAIN):
-- Возьмите любой ваш запрос с JOIN + GROUP BY и разберите план:
--   scan (Seq/Index/Bitmap), join (Nested/Hash/Merge), где узкое место.