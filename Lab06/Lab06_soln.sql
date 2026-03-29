CREATE DATABASE BPMCE;

USE BPMCE;

CREATE table Department(
	DeptID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Dept_location VARCHAR(10)
    );
    
CREATE table Faculty(
	FacultyID INT PRIMARY KEY,
    Faculty_Name VARCHAR(50),
    Designation VARCHAR(50),
    Official_EmailID VARCHAR(50),
    Department VARCHAR(50)
    );
    
CREATE table Course(
	CourseID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Credits INT,
    Department VARCHAR(50),
    Faculty_teaching VARCHAR(50),
    FacultyID INT
    );
    
CREATE table Student(
	StudentID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    DOB DATE,
    Gender ENUM ('Male','Female'),
    Contact_No BIGINT,
    Department VARCHAR(50)
    );
    
CREATE table Enrollment(
	StudentID INT ,
    FOREIGN KEY (StudentID) references Student(StudentID),
    CourseID INT,
    FOREIGN KEY (CourseID) references Course(CourseID),
    FacultyID INT,
    FOREIGN KEY (FacultyID) references Faculty(FacultyID),
    DeptID INT,
    FOREIGN KEY (DeptID) references Department(DeptID),
    Semester VARCHAR(5),
    Grade VARCHAR(3)
    );

INSERT INTO Department(DeptID,Dept_Name,Dept_location)
VALUES
(105,"CSE","Block-A"),
(157,"CSE(AI&ML)","Block-B"),
(118,"3DAG","Block-C"),
(110,"EEE","Block-D"),
(101,"Civil","Block-E"),
(102,"Mechanical","Block-F");

INSERT INTO Faculty(FacultyID,Faculty_Name,Designation,Official_EmailID,Department)
VAlUES
(101,"Murlidhar Prasad Singh","HOD(CSE)","singhmurlidhar@gmail.com","CSE"),
(102,"E.Haque","HOD(AI-ML)","ehtasham47@gmail.com","AI-ML"),
(103,"H.K Mishra","HOD(EEE)","hare.dbit@gmail.com","EEE"),
(104,"Arbind Kumar Amar","HOD(Mechanical)","ak_amar73@gmail.com","Mechanical"),
(105,"Sujeet Kumar","Asst. Professor","ksujeet.cs@gmail.com","CSE and AI-ML"),
(106,"Md.Izhar","Asst. Professor","mdizhar1996@gmail.com","CSE and AI-ML"),
(107,"Manisha Singh","Asst. Professor","manisha.ks241@gmail.com","CSE"),
(108,"Praveen Kumar","Asst. Professor","praveen123@gmail.com","AI-ML");

INSERT INTO Course(CourseID,Course_Name,Credits,Department,Faculty_teaching)
VALUES
(157501,"DBMS",5,"AI-ML","Sujeet Kumar"),
(157502,"AI",3,"AI-ML","E.Haque"),
(157503,"Computer Network",4,"AI-ML","Md.Izhar"),
(157504,"Machine Learning",3,"AI-ML","Praveen Kumar"),
(100508,"PSD",3,"CSE","Manisha Singh"),
(101504,"Hydraulic Engg.",4,"Civil","H.K Mishra");

INSERT INTO Student(StudentID,Student_Name,DOB,Gender,Contact_No,Department)
VALUES
(18,"Nishant Kumar",'2002-10-22','Male',8409212345,"AI-ML"),
(01,"Ramesh Ranjan",'2003-05-12','Male',9988776655,"CSE"),
(75,"Shradha Kapoor",'2001-08-15','Female',1122334455,"EEE"),
(25,"Mohanlal",'2002-01-23','Male',2233778899,"Civil"),
(15,"Faizal Khan",'2004-04-04','Male',9988776651,"Mechanical"),
(17,"Rakesh Kumar",'2003-03-23','Male',5544332211,"3DAG");

INSERT INTO Enrollment(StudentID,CourseID,FacultyID,DeptID,Semester,Grade)
VALUES
(18,157501,105,157,"5th","A"),
(01,100508,107,105,"5th","B"),
(15,101504,103,101,"4th","C"),
(75,157504,108,110,"6th","A"),
(25,157503,106,118,"5th","D"),
(17,157502,102,157,"3rd","P");

-- Part A: Basic Aggregate Queries
-- 1. Display the total number of students in the Student table.

select count(*) as Total_Students
from Student;

-- 2. Display the total number of faculty members in the Faculty table. 
select count(*) as Total_Faculty
from Faculty;

-- 3. Display the total number of courses available in the Course table. 
select count(*) as Total_Courses
from Course;

-- 4. Display the maximum credits among all courses. 
select max(Credits) as Maximum_Credit
from Course;

-- 5. Display the minimum credits offered by any course. 
select min(Credits) as Minimum_Credits
from Course;

-- Part B: GROUP BY on Single Tables 
-- 6. Display the number of students in each DepartmentID from the Student table.
select d.DeptID,count(StudentID) as Total_Students
from Department as d
join Enrollment as e
on e.DeptID = d.DeptID
group by d.DeptID;

-- 7. Display the number of faculty members in each DepartmentID from the Faculty table. 
select d.DeptID ,count(FacultyID) as Total_Faculty
from Department as d
join Enrollment as e
on d.DeptID=e.DeptID
group by d.DeptID;

-- 8. Display the number of courses offered by each DepartmentID from the Course table.
select d.DeptID ,count(CourseID) as Total_Courses
from Department as d
join Enrollment as e
on d.DeptID=e.DeptID
group by d.DeptID;

-- 9. Display the number of enrollments in each Semester from the Enrollment table.
select Semester ,count(*) as Total_Enrollment
from Enrollment
group by semester;

-- 10. Display the number of students for each Grade in the Enrollment table. 
select Grade,count(*) as Total_Students
from Enrollment
group by Grade;

-- Part C: GROUP BY with HAVING 
-- 11. Display departments having more than 1 students. 
select d.Dept_Name ,count(StudentID) as Total_Students
from Department as d
join Enrollment as e
on d.DeptID=e.DeptID
group by d.DeptID
having count(StudentID)>1;

-- 12. Display semesters where more than 2 enrollments exist. 
select Semester,count(*) as Total_Enrollment
from Enrollment
group by semester
having count(*)>2;

-- 13. Display grades that are assigned to more than one student. 
select Grade,count(*) as Total_Students
from Enrollment
group by Grade
having count(*)>1;

-- 14. Display DepartmentIDs where more than one course is offered. 
select Department,count(*) as No_of_Courses
from Course
group by Department
having count(*)>1;

-- Part D: Aggregation with JOIN 

-- 15. Display the number of students enrolled in each CourseID. 
select c.CourseID ,count(StudentID) as Total_Student
from Course as c
join Enrollment as e
on c.CourseID=e.CourseID
group by c.CourseID;

-- 16. Display CourseName and number of students enrolled in that course. 
select c.Course_Name ,count(StudentID) as Total_Student
from Course as c
join Enrollment as e
on c.CourseID=e.CourseID
group by c.CourseID;

-- 17. Display DepartmentID and number of students belonging to that department. 
select d.DeptID ,count(StudentID) as Total_Student
from Department as d
join Enrollment as e
on d.DeptID=e.DeptID
group by d.DeptID;

-- 18. Display Faculty Name and number of courses taught by each faculty member. 
select f.Faculty_Name ,count(CourseID) as No_of_Courses
from Faculty as f
join Enrollment as e
on f.FacultyID=e.FacultyID
group by f.FacultyID;

-- Part E: Analytical Queries 
-- 19. Display CourseName and maximum grade obtained in that course.
select c.Course_Name,MAX(Grade) as Max_Grade
from Course as c
join Enrollment as e
on c.CourseID=e.CourseID
group by c.CourseID;

-- 20. Display DepartmentID and total number of courses offered in that department. 
select d.DeptID ,count(CourseID) as Total_Courses
from Department as d
join Enrollment as e
on d.DeptID=e.DeptID
group by d.DeptID;

-- 21. Display Semester and total number of students enrolled in that semester. 
select Semester,count(StudentID) as Total_Students
from Enrollment
group by Semester;

-- 22. Display courses that have more than 1 or equal to 1 students enrolled. 
select c.Course_Name ,count(StudentID) as Total_Student
from Course as c
join Enrollment as e
on c.CourseID=e.CourseID
group by c.CourseID
having count(StudentID)>=1;
