create database homework
use homework
create table students
(
id int primary key identity(1,1),
name nvarchar(15),
surname nvarchar(15)
)
insert into students
values
('name1','surname1'),
('name2','surname2'),
('name3','surname3'),
('name4','surname4')
 select* from students

 create table sgroups
 (
 id int primary key identity,
 no int 
 )
 select *from sgroups
 insert into sgroups
 values
 (83),
 (52),
 (75),
 (95)
  alter table students
  add sgroupsid int FOREIGN KEY REFERENCES sgroups(id) 
  --no yazmaq isteseydim ya da nece deyeri varsa nece olacaq

SELECT * FROM students
LEFT JOIN sgroups
ON students.sgroupsId=sgroups.Id

SELECT students.Id, CONCAT(students.Name,' ',Surname) AS 'FullName', sgroups.no FROM students 
FULL OUTER JOIN sgroups
ON students.sgroupsid=sgroups.id

CREATE TABLE exams
(
	Id INT PRIMARY KEY IDENTITY,
	studentsId INT FOREIGN KEY REFERENCES students(Id),
	StartDate DATETIME2
)
insert into exams (studentsId,StartDate)
values
(4,'2022-11-22 13:00'),
(3,'2022-06-12 14:00'),
(2,'2022-07-18 18:00'),
(2,'2022-09-15 21:00')
SELECT *,(SELECT COUNT(Id) FROM exams WHERE studentsId=students.Id) 
AS examsCount FROM students 
JOIN sgroups 
ON students.sgroupsId=sgroups.Id

SELECT s.Id, CONCAT(s.Name,' ',s.Surname) AS 'FullName', sg.no AS 'GroupNo', 
       e.StartDate AS 'ExamStartDate'
FROM students s
LEFT JOIN sgroups sg ON s.sgroupsid=sg.id
LEFT JOIN exams e ON s.Id=e.studentsId
CREATE TABLE subjects
(
	Id INT PRIMARY KEY IDENTITY,
	examsId INT FOREIGN KEY REFERENCES exams(Id),
	name nvarchar(15)
)
insert into subjects (examsId,name)
values
(1,'exam1'),
(3,'exam2'),
(2,'exam3'),
(2,'exam4')


