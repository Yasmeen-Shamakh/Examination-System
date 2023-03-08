-------------------------------Instructor Table----------------------------
create table Instructor (
Inst_ID int ,
Inst_Fname varchar(50),Inst_Lname varchar(50),Email varchar(50),
Gender varchar(20), Birthdate date,Salary int,Manager_ID int,Age as (year(getdate())-year(Birthdate)),
constraint c1 primary key(Inst_ID),
constraint c2 Foreign key(Manager_ID) references Instructor (Inst_ID) ,
constraint c3 check (Gender = 'M' or Gender= 'F'),
constraint c4 check (Salary>2000)
)
----------------------------------Instructor Qualification Table------------------
Go
create table Inst_Qualification(
Inst_ID int, Scientific_Degree varchar(20), Faculty varchar(50),
constraint c5 primary key(Inst_ID, Scientific_Degree,Faculty),
constraint c6 Foreign key(Inst_ID) references Instructor (Inst_ID)  
)
------------------------------------Instrucror Phone Table-------------------------
Go
create table Inst_Phone (
Inst_ID int , Phone char(11),
constraint c7 primary key(Inst_ID,Phone),
constraint c8 Foreign key(Inst_ID) references Instructor (Inst_ID)  
)
------------------------------Department Table-------------------------------------
Go 
create table Department(
Dept_ID int, Manager_ID int, Dept_Name varchar(50), Duration varchar(20),
Dept_Description varchar(150),
constraint c9 primary key(Dept_ID),
constraint c10 Foreign key(Manager_ID) references Instructor (Inst_ID),
constraint c11 check (Duration = '3 monthes' or Duration = '9 monthes')
)
------------------------------------Student Table---------------------------------
Go
create table Student(
St_ID int ,
St_Fname varchar(50),St_Lname varchar(50), Gender varchar(5),Street varchar(50),
City varchar(50), Governorate varchar(50), Birthdate date,Hiring_Date date,
Certificate varchar(150), Freelancing Varchar(150),ITI_Grad_Date date,Position varchar(50), 
CompanyName varchar(50), Email varchar(50),User_Name varchar(20),Password varchar(50),
Leader_ID int , Dept_ID int ,Age as (year(getdate())-year(Birthdate)),
constraint c12 primary key(St_ID),
constraint c13 Foreign key(Dept_ID) references Department (Dept_ID),
constraint c14 Foreign key(Leader_ID) references Student(St_ID),
constraint c15 check (Gender = 'M' or Gender= 'F')
)
---------------------------------Student Qualification Table-------------------------
Go
create table St_Qualification (
St_ID int , Graduation_Year int , Scientific_Degree varchar(20),Faculty varchar(50),
Grade Varchar(20),
constraint c16 primary key(St_ID,Graduation_Year),
constraint c17 Foreign key(St_ID) references Student(St_ID))

--------------------------------Student Phone Table-------------------------------
Go
create table St_Phone(
St_ID int, Phone char(11),
constraint c18 primary key(St_ID,Phone),
constraint c19 Foreign key(St_ID) references Student (St_ID)  
)
--------------------------------Working Table----------------------------
Go
create table Working
(
Inst_ID int, Dept_ID int , Hiring_Date date,
constraint c20 primary key(Inst_ID,Dept_ID),
constraint c21 Foreign key(Inst_ID) references Instructor (Inst_ID),
constraint c22 Foreign key(Dept_ID) references Department (Dept_ID) 
)
-----------------------------------Branches Table-------------------------------------
Go
Create table Branches(
Branch_ID int , Branch_Name varchar(50), Location varchar(50),
constraint c23 primary key(Branch_ID)
)
---------------------------------------Branch_Department Table--------------------
Go
create table Branch_Department(
Dept_ID int, Branch_ID int,
constraint c24 primary key(Branch_ID,Dept_ID),
constraint c25 Foreign key(Dept_ID) references Department(Dept_ID) ,
constraint c26 Foreign key(Branch_ID) references Branches(Branch_ID) 
)
------------------------------------------Topics------------------------------------
GO
Create table Topics (
Topic_ID int,TopicName varchar(20)
Constraint C27 Primary key (Topic_ID)
)
-----------------------------------------Courses -----------------------------------
GO
create table Courses(
Course_Code int , CourseName varchar(20),Course_Duration int ,Topic_ID int,
Constraint C28 Primary key (Course_Code),
Constraint C29 Foreign key (Topic_ID) references Topics(Topic_ID)
)
-----------------------------------------------Inst_Course Table-------------------------------
Go
create table Inst_Course(
Inst_ID int, Course_Code int, Evaluation int,
Constraint C43 Primary key (Inst_ID,Course_Code),
constraint c44 Foreign key(Inst_ID) references Instructor(Inst_ID),
constraint c45 Foreign key(Course_Code) references Courses(Course_Code) 
)
---------------------------------------St_Course-------------------------------------------------
GO
Create table St_Course (
St_ID int,Course_Code int,Crs_Grade float ,
Constraint C30 Primary key (St_ID,Course_Code),
Constraint C31 Foreign key (St_ID) references Student(St_ID) ,
Constraint C32 Foreign key (Course_Code) references Courses (Course_Code)
)
---------------------------------------------Exam---------------------------------------------------
GO
create table Exam(
Exam_Code int , Grade Float,Exam_Model int,Dept_ID int,
Constraint C33 Primary key (Exam_Code,Exam_Model),
Constraint C34 Foreign key (Dept_ID) references Department(Dept_ID)
)
DROP TABLE dbo.Resualt
DROP TABLE dbo.Exam
GO
create table Exam(
Exam_Code int , Grade INT,Course_Code int,Dept_ID int,
Constraint C48 Primary key (Exam_Code),
Constraint C49 Foreign key (Dept_ID) references Department(Dept_ID),
constraint c50 Foreign key(Course_Code) references Courses(Course_Code) 
)
------------------------------------------Resualt----------------------------------------------------------
GO
create table Resualt (
St_ID int ,Quest_Num int ,Exam_Code int,Answer varchar(20)
Constraint C37 primary key (St_ID,Quest_Num),
Constraint C38 Foreign key (St_ID) references Student(St_ID),
Constraint C39 Foreign key (Quest_Num) references Questions(Quest_Num),
Constraint C40 Foreign key (Exam_Code) references Exam(Exam_Code))
ALTER TABLE dbo.Resualt
ALTER COLUMN Answer VARCHAR(50)
-----------------------------------------------------------------------
Drop table Questions
--------------------------------------Questions Table------------------------------------------------------
Go
create table Questions(
Quest_Num int, Quest_Type varchar(20), Questions varchar(150), 
Correct_Answer Varchar(50),Quest_Grade int , Course_Code int,
constraint c35 primary key(Quest_Num),
constraint c36 Foreign key(Course_Code) references Courses (Course_Code))
-----------------------------------------Choices Table------------------------------------
Create table Choices (Quest_Num int,Choices varchar(50)
constraint c46 primary key(Quest_Num,Choices),
constraint c47 Foreign key(Quest_Num) references Questions(Quest_Num))
-----------------------------Department_Courses--------------------------------
create table Department_Courses
( Dept_ID int, Course_Code int 
constraint c51 PRIMARY key(Dept_ID,Course_Code),
constraint c52 Foreign key(Dept_ID) references Department (Dept_ID),
constraint c53 Foreign key(Course_Code) references Courses(Course_Code))
--------------------------------------------------------------------------------