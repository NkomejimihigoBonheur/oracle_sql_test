-- Create the Instructor Table
CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(100)
);

-- Create the Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    DOB DATE
);

-- Create the Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT,
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

-- Create the Enrollment Table (Junction Table for Many-to-Many Relationship)
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Grade VARCHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);



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

--inner join

SELECT 
    s.StudentID, 
    s.Name AS StudentName, 
    c.CourseID, 
    c.CourseName
FROM 
    Student s
INNER JOIN 
    Enrollment e ON s.StudentID = e.StudentID
INNER JOIN 
    Course c ON e.CourseID = c.CourseID;

------Left join--------------

SELECT 
    c.CourseID, 
    c.CourseName, 
    i.Name AS InstructorName, 
    i.Department
FROM 
    Course c
LEFT JOIN 
    Instructor i ON c.InstructorID = i.InstructorID;
--------subquery----------------
--------Find All Students Who Are Enrolled in 'Database Systems'------
SELECT Name 
FROM Student
WHERE StudentID IN (
    SELECT StudentID 
    FROM Enrollment
    WHERE CourseID = (
        SELECT CourseID 
        FROM Course
        WHERE CourseName = 'Database Systems'
    )
);
-------GRANT-----------
GRANT SELECT, INSERT ON Student TO Bonheur;
-------REVOKE----------
REVOKE SELECT, INSERT ON Student FROM Bonheur;

