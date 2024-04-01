from faker import Faker
import random
import sqlite3

fake = Faker()

# Підключення до бази даних SQLite
conn = sqlite3.connect('university.db')
c = conn.cursor()

# Створення таблиць
c.execute('''CREATE TABLE IF NOT EXISTS students (
                id INTEGER PRIMARY KEY,
                name TEXT,
                group_id INTEGER)''')

c.execute('''CREATE TABLE IF NOT EXISTS groups (
                id INTEGER PRIMARY KEY,
                name TEXT)''')

c.execute('''CREATE TABLE IF NOT EXISTS teachers (
                id INTEGER PRIMARY KEY,
                name TEXT)''')

c.execute('''CREATE TABLE IF NOT EXISTS subjects (
                id INTEGER PRIMARY KEY,
                name TEXT,
                teacher_id INTEGER)''')

c.execute('''CREATE TABLE IF NOT EXISTS grades (
                id INTEGER PRIMARY KEY,
                student_id INTEGER,
                subject_id INTEGER,
                grade INTEGER,
                date TEXT)''')

# Генерація даних
num_students = 50
num_groups = 3
num_subjects = 8
num_teachers = 5

# Додавання груп
for i in range(num_groups):
    c.execute("INSERT INTO groups (name) VALUES (?)",
              (fake.random_element(elements=('A', 'B', 'C')),))

# Додавання студентів
for i in range(num_students):
    c.execute("INSERT INTO students (name, group_id) VALUES (?, ?)",
              (fake.name(), random.randint(1, num_groups)))

# Додавання викладачів
for i in range(num_teachers):
    c.execute("INSERT INTO teachers (name) VALUES (?)", (fake.name(),))

# Додавання предметів
for i in range(num_subjects):
    c.execute("INSERT INTO subjects (name, teacher_id) VALUES (?, ?)",
              (fake.job(), random.randint(1, num_teachers)))

# Додавання оцінок
for student_id in range(1, num_students + 1):
    for subject_id in range(1, num_subjects + 1):
        for _ in range(random.randint(1, 5)):
            c.execute("INSERT INTO grades (student_id, subject_id, grade, date) VALUES (?, ?, ?, ?)",
                      (student_id, subject_id, random.randint(1, 100), fake.date_this_year()))

# Збереження змін у базі даних
conn.commit()
conn.close()
