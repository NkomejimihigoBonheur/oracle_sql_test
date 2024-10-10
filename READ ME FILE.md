 README File

 1. Problem Statement

The system we are managing is a **University Enrollment System**. This database is designed to manage the relationships between students, courses, instructors, and enrollments. It keeps track of:
- **Students**: Basic details such as name, email, and date of birth.
- **Courses**: Information about courses offered, including credits and the assigned instructor.
- **Instructors**: Faculty members teaching courses.
- **Enrollments**: Records of students enrolled in various courses, including enrollment dates and grades.

 Key Objectives:
- Allow administrators to insert, update, and delete records about students, courses, instructors, and enrollments.
- Provide the ability to retrieve related data across tables, such as which students are enrolled in specific courses or which instructors are teaching certain courses.
- Maintain data integrity through foreign key relationships and proper transaction management.

 2. Common SQL Commands Executed

 2.1 Data Definition Language (DDL)
The following commands were executed to define the database structure:

```sql
-- Create Instructor Table
CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(100)
);

-- Create Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    DOB DATE
);

-- Create Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT,
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

-- Create Enrollment Table
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Grade VARCHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
```

 2.2 Data Manipulation Language (DML)
The following commands were used to manipulate data within the tables:

- **Insert Data**:
```sql
-- Insert data into Student Table
INSERT INTO Student (StudentID, Name, Email, DOB)
VALUES (1, 'Alice Brown', 'alice@example.com', TO_DATE('1999-05-21', 'YYYY-MM-DD')),
       (2, 'Bob White', 'bob@example.com', TO_DATE('2000-07-11', 'YYYY-MM-DD'));
```

- **Update Data**:
```sql
-- Update student's email
UPDATE Student
SET Email = 'alice_new@example.com'
WHERE StudentID = 1;
```

- **Delete Data**:
```sql
-- Delete a course
DELETE FROM Course
WHERE CourseID = 102;
```

 2.3 Data Control Language (DCL)
To manage user access:

```sql
-- Create new user
CREATE USER Bonheur IDENTIFIED BY password123;

-- Grant privileges to the user
GRANT SELECT, INSERT ON Student TO Bonheur;
GRANT CONNECT TO Bonheur;
```

 2.4 Transaction Control Language (TCL)
Transactions were managed using the following commands:

```sql
-- Begin Transaction
BEGIN;

-- Insert a new student
INSERT INTO Student (StudentID, Name, Email, DOB)
VALUES (3, 'Charles Davis', 'charles@example.com', TO_DATE('2001-03-10', 'YYYY-MM-DD'));

-- Commit the transaction
COMMIT;
```

 2.5 Select Queries (Joins and Subqueries)
- **Inner Join**: Retrieve all students and the courses they are enrolled in:

```sql
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
```

- **Subquery**: Find all students enrolled in the course "Database Systems":

```sql
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
```

 3. Screenshots of SQL Queries and Results

Below are screenshots that showcase the execution of SQL queries, the results obtained, and the conceptual database diagram.

 3.1 SQL Query: Retrieve Students and Courses
![SQL Query Screenshot](./screenshots/query1.png)

 3.2 SQL Query: Insert Student Data
![SQL Insert Screenshot](./screenshots/query2.png)

 3.3 Conceptual Database Diagram
![Database Diagram](./screenshots/database_diagram.png)

 4. Explanation of Results and Transactions

1. **Join Queries**: The join query retrieved data by combining the `Student`, `Enrollment`, and `Course` tables. This enabled us to see which students were enrolled in which courses. The `INNER JOIN` only returned students who were actually enrolled in a course, as it filters out any rows that don’t have matches in both joined tables.

2. **Insert and Update Operations**: 
   - The `INSERT` command added new records to the `Student` table. For example, Alice Brown and Bob White were successfully added as students.
   - The `UPDATE` command modified Alice's email, demonstrating how records can be updated while preserving the integrity of the rest of the data.

3. **Delete Operation**: The `DELETE` command removed a specific course (`CourseID = 102`) from the `Course` table. This change was successfully committed, and the course is no longer part of the database.

4. **Transaction Handling**: In the case of the student insertion, a `BEGIN` and `COMMIT` were used to manage the transaction. This ensures that either all changes are applied (if successful) or none at all (if an error occurs), thereby maintaining data integrity.

 Conclusion
This README provided a description of the university enrollment system database, along with SQL commands, results, and screenshots. The system is designed to handle the relationships between students, instructors, courses, and enrollments efficiently.