-- Insert data into Instructor table
INSERT INTO Instructor (InstructorID, Name, Department)
VALUES (1, 'Dr. Smith', 'Computer Science'),
       (2, 'Dr. Johnson', 'Mathematics');

-- Insert data into Student table
-- Insert data into Student table
INSERT INTO Student (StudentID, Name, Email, DOB)
VALUES (1, 'Alice Brown', 'alice@example.com', TO_DATE('1999-05-21', 'YYYY-MM-DD')),
       (2, 'Bob White', 'bob@example.com', TO_DATE('2000-07-11', 'YYYY-MM-DD'));


-- Insert data into Course table
INSERT INTO Course (CourseID, CourseName, Credits, InstructorID)
VALUES (101, 'Database Systems', 3, 1),
       (102, 'Calculus I', 4, 2);

-- Insert data into Enrollment table
INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID, EnrollmentDate, Grade)
VALUES (1, 1, 101, '2023-09-01', 'A'),
       (2, 2, 102, '2023-09-02', 'B');