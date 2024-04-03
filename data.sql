-- 1. Повернути список студентів у групі "A":
SELECT * FROM students
INNER JOIN groups ON students.group_id = groups.id
WHERE groups.name = 'A';

-- 2. Повернути список предметів, які викладає конкретний викладач (наприклад, викладач з ідентифікатором 3):
SELECT * FROM subjects
WHERE teacher_id = 3;

-- 3. Повернути середній бал з предмету "Mathematics":
SELECT AVG(grade) AS average_grade FROM grades
INNER JOIN subjects ON grades.subject_id = subjects.id
WHERE subjects.name = 'Mathematics';

-- 4. Повернути список студентів разом з їхніми середніми балами:
SELECT students.id, students.name, AVG(grades.grade) AS average_grade FROM students
LEFT JOIN grades ON students.id = grades.student_id
GROUP BY students.id;

-- 5. Повернути список студентів, які отримали оцінку більше 80 з предмету "Physics":
SELECT students.id, students.name FROM students
INNER JOIN grades ON students.id = grades.student_id
INNER JOIN subjects ON grades.subject_id = subjects.id
WHERE subjects.name = 'Physics' AND grades.grade > 80;
