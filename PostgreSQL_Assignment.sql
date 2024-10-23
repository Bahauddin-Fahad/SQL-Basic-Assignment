-- Active: 1729181165628@@127.0.0.1@5432@university_db

-- Create a "students" table with the following fields:
CREATE TABLE students(
student_id SERIAL PRIMARY KEY,
student_name VARCHAR(50),
age INT,
email VARCHAR(100),
frontend_mark INT,
backend_mark INT,
status VARCHAR(100)
)

-- Create a "courses" table with the following fields:
CREATE TABLE courses(
course_id SERIAL PRIMARY KEY,
course_name VARCHAR(50),
credits INT
)

-- Create an "enrollment" table with the following fields:
CREATE TABLE enrollment(
enrollment_id SERIAL PRIMARY KEY,
student_id INT REFERENCES students(student_id) NOT NULL,
course_id  INT REFERENCES courses(course_id) NOT NULL
)

-- INSERT INTO students VALUES 
-- (1, 'Sameer', 21, 'sameer@example.com', 48, 60, NULL),
-- (2, 'Zoya', 23, 'zoya@example.com', 52, 58, NULL),
-- (3, 'Nabil', 22, 'nabil@example.com', 37, 46, NULL),
-- (4, 'Rafi', 24, 'rafi@example.com', 41, 40, NULL),
-- (5, 'Sophia', 22, 'sophia@example.com', 50, 52, NULL),
-- (6, 'Hasan', 23, 'hasan@gmail.com', 43, 39, NULL);

-- INSERT INTO courses
-- VALUES
-- (1, 'Next.js', 3),
-- (2, 'React.js', 4),
-- (3, 'Databases', 3),
-- (4, 'Prisma', 3);

-- INSERT INTO enrollment
-- VALUES
-- (1, 1, 1),
-- (2, 1, 2),
-- (3, 2, 1),
-- (4, 3, 2);

SELECT * FROM students

SELECT * FROM courses

SELECT * FROM enrollment





-- 1. Insert a new student record with the following details:
INSERT INTO students (student_id, student_name, age, email, frontend_mark,backend_mark, status) VALUES (7, 'Fahad', 23, 'fahad@mail.com', 55, 57, NULL)

-- 2. Retrieve the names of all students who are enrolled in the course titled 'Next.js'.
-- SELECT * FROM students WHERE

-- 3. Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.
UPDATE students SET status='Awarded' WHERE (frontend_mark+backend_mark) = 
(SELECT max(frontend_mark+backend_mark) FROM students)

-- 4. Delete all courses that have no students enrolled.
DELETE FROM courses WHERE course_id NOT IN 
(SELECT DISTINCT course_id FROM enrollment)


-- 5. Retrieve the names of students using a limit of 2, starting from the 3rd student.
SELECT student_id,student_name FROM students ORDER BY student_id LIMIT 2 OFFSET 2

-- 6. Retrieve the course names and the number of students enrolled in each course.
-- SELECT course_name,sum(student_id) FROM enrollment JOIN courses on courses.course_id=enrollment.course_id

-- 7. Calculate and display the average age of all students.
SELECT avg(age) as average_age FROM students

-- 8. Retrieve the names of students whose email addresses contain 'example.com'.
SELECT * FROM students WHERE email LIKE '%example.com'