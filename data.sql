-- 1. Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
SELECT students.id, students.name, AVG(grades.grade) AS average_grade FROM students
LEFT JOIN grades ON students.id = grades.student_id
GROUP BY students.id
ORDER BY average_grade DESC
LIMIT 5;

-- 2. Знайти студента із найвищим середнім балом з певного предмета (наприклад, Mathematics).
SELECT students.id, students.name, AVG(grades.grade) AS average_grade FROM students
INNER JOIN grades ON students.id = grades.student_id
INNER JOIN subjects ON grades.subject_id = subjects.id
WHERE subjects.name = 'Mathematics'
GROUP BY students.id
ORDER BY average_grade DESC
LIMIT 1;

-- 3. Знайти середній бал у групах з певного предмета (наприклад, Physics).
SELECT groups.name, AVG(grades.grade) AS average_grade FROM students
INNER JOIN groups ON students.group_id = groups.id
INNER JOIN grades ON students.id = grades.student_id
INNER JOIN subjects ON grades.subject_id = subjects.id
WHERE subjects.name = 'Physics'
GROUP BY groups.id;

-- 4. Знайти середній бал на потоці (по всій таблиці оцінок).
SELECT AVG(grade) AS average_grade FROM grades;

-- 5. Знайти які курси читає певний викладач (наприклад, викладач з ідентифікатором 3).
SELECT subjects.name FROM subjects
WHERE teacher_id = 3;

-- 6. Знайти список студентів у певній групі (наприклад, групі "A").
SELECT students.id, students.name FROM students
INNER JOIN groups ON students.group_id = groups.id
WHERE groups.name = 'A';

-- 7. Знайти оцінки студентів у окремій групі з певного предмета (наприклад, Physics).
SELECT students.id, students.name, grades.grade FROM students
INNER JOIN groups ON students.group_id = groups.id
INNER JOIN grades ON students.id = grades.student_id
INNER JOIN subjects ON grades.subject_id = subjects.id
WHERE groups.name = 'A' AND subjects.name = 'Physics';

-- 8. Знайти середній бал, який ставить певний викладач зі своїх предметів (наприклад, викладач з ідентифікатором 3).
SELECT AVG(grades.grade) AS average_grade FROM grades
INNER JOIN subjects ON grades.subject_id = subjects.id
WHERE subjects.teacher_id = 3;

-- 9. Знайти список курсів, які відвідує студент (наприклад, студента з ідентифікатором 1).
SELECT subjects.name FROM subjects
INNER JOIN grades ON subjects.id = grades.subject_id
WHERE grades.student_id = 1;

-- 10. Список курсів, які певному студенту читає певний викладач (наприклад, студента з ідентифікатором 1 та викладача з ідентифікатором 3).
SELECT subjects.name FROM subjects
INNER JOIN grades ON subjects.id = grades.subject_id
WHERE grades.student_id = 1 AND subjects.teacher_id = 3;
