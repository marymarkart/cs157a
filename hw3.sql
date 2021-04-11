-- HW#3
-- Section 2
-- Student ID: 015063802
-- Markart, Mary
-- db2 -td"^" -v -f hw3.sql

-- Add values to Student table
insert into hw3.student(student_id,first,last,gender) values(12345,'Mart','Martmart','F')^
insert into hw3.student(student_id,first,last,gender) values(11111,'Elizardbeth','Connor','F')^
insert into hw3.student(student_id,first,last,gender) values(22222,'Austin','Ribbitson','M')^
insert into hw3.student(student_id,first,last,gender) values(33333,'This','Student','M')^
insert into hw3.student(student_id,first,last,gender) values(44444,'That','Student','F')^
insert into hw3.student(student_id,first,last,gender) values(55555,'Undefined','Student','U')^
insert into hw3.student(student_id,first,last,gender) values(54321,'Backwards','Student','U')^

-- Add values to Class table
insert into hw3.class(class_id,name,desc) values(01000,'CS100W','Computer Science Writing')^
insert into hw3.class(class_id,name,desc) values(10000,'CS46A','Intro to Programming')^
insert into hw3.class(class_id,name,desc) values(10001,'CS46B','Intro to Data Structures')^
insert into hw3.class(class_id,name,desc) values(10002,'CS47','Intro to Computer Systems')^
insert into hw3.class(class_id,name,desc) values(10003,'CS49J','Programming in Java')^
insert into hw3.class(class_id,name,desc) values(20000,'CS146','Data Structures and Algorithms')^
insert into hw3.class(class_id,name,desc) values(20001,'CS157A','Intro to DB Management')^
insert into hw3.class(class_id,name,desc) values(20002,'CS149','Operating Systems')^
insert into hw3.class(class_id,name,desc) values(20003,'CS160','Software Engineering')^
insert into hw3.class(class_id,name,desc) values(20004,'CS157B','Database Management Systems II')^
insert into hw3.class(class_id,name,desc) values(20005,'CS157C','NoSQL Database Systems')^
insert into hw3.class(class_id,name,desc) values(20006,'CS151','Object-Oriented Design')^

-- Add values to Prerequisite table
insert into hw3.class_prereq(class_id,prereq_id) values(10001,10000)^
insert into hw3.class_prereq(class_id,prereq_id) values(10002,10001)^
insert into hw3.class_prereq(class_id,prereq_id) values(20000,10001)^
insert into hw3.class_prereq(class_id,prereq_id) values(20001,20000)^
insert into hw3.class_prereq(class_id,prereq_id) values(20002,20000)^
insert into hw3.class_prereq(class_id,prereq_id) values(20003,20000)^
insert into hw3.class_prereq(class_id,prereq_id) values(20003,20006)^
insert into hw3.class_prereq(class_id,prereq_id) values(20003,01000)^
insert into hw3.class_prereq(class_id,prereq_id) values(20004,20001)^
insert into hw3.class_prereq(class_id,prereq_id) values(20005,20001)^
insert into hw3.class_prereq(class_id,prereq_id) values(20006,10001)^




-- fail: Duplicate studentID (Question #1 on homework)
insert into hw3.student(student_id,first,last,gender) values(54321,'Duplicate','Student','U')^
-- fail: Wrong gender char
insert into hw3.student(student_id,first,last,gender) values(87654,'No Gender','Student','X')^

-- fail: duplicate ID (Question #1 on homework)
insert into hw3.class(class_id,name,desc) values(10000,'Dummy','Dummy Class Description')^

-- fail: no class id in class table
insert into hw3.class_prereq(class_id,prereq_id) values(66666,10000)^

-- fail: no prerequisite id in class table
insert into hw3.class_prereq(class_id,prereq_id) values(10000,66666)^

Select * from hw3.student^
Select * from hw3.class^
Select * from hw3.class_prereq^
Select * from hw3.schedule^

--Test cascade drop of HW3.CLASS (Question #2 from homework), the 2 (SELECT * ...) stmts after DELETE should have 0 record
INSERT INTO hw3.class VALUES ('00010','CS42','Discrete Mathematics')^
INSERT INTO hw3.class VALUES ('00020','CS185C','Special Topics')^
INSERT INTO hw3.schedule VALUES ('12345','00020',1,2019,'A')^
INSERT INTO hw3.class_prereq VALUES ('00020','00010')^
SELECT * FROM hw3.class_prereq WHERE hw3.class_prereq.class_id = '00020'^
SELECT * FROM hw3.schedule WHERE hw3.schedule.class_id = '00020'^
DELETE FROM hw3.class WHERE hw3.class.class_id = '00020'^
SELECT * FROM hw3.class_prereq WHERE hw3.class_prereq.class_id = '00020'^
SELECT * FROM hw3.schedule WHERE hw3.schedule.class_id = '00020'^

insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,01000,1,2019,'A')^

-- fail: lowercase grade
insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,10001,1,2019,'a')^

-- fail: not a possible grade
insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,10001,1,2019,'E')^

-- fail: no existing student (Question #3 on homework)
insert into hw3.schedule(student_id,class_id,semester,year,grade) values(99999,01000,1,2019,'A')^

-- fail: no existing class (Question #3 on homework)
insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,99999,1,2019,'A')^

-- fail: missing prereq  (Question #4 on homework)
insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,20003,2,2019,NULL)^

insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,10000,3,2019,'A')^

-- fail: missing prereq  (Question #4 on homework)
insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,20006,1,2020,'B')^

insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,10001,2,2020,'C')^

insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,20006,3,2020,'A')^

insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,20000,3,2020,'A')^

insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,20003,1,2021,'A')^

insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,20001,1,2021,NULL)^

-- fail: grade for prereq is NULL  (Question #4 on homework)
insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,20004,2,2021,'A')^

-- fail: Test different student - missing prereqs  (Question #4 on homework)
insert into hw3.schedule(student_id,class_id,semester,year,grade) values(11111,10001,2,2020,'C')^

insert into hw3.schedule(student_id,class_id,semester,year,grade) values(11111,10000,2,2020,'A')^

insert into hw3.schedule(student_id,class_id,semester,year,grade) values(11111,10001,2,2020,'F')^

-- fail: 'F' grade for prereq  (Question #4 on homework)
insert into hw3.schedule(student_id,class_id,semester,year,grade) values(11111,10002,3,2020,'B')^

insert into hw3.schedule(student_id,class_id,semester,year,grade) values(11111,10001,2,2020,'C')^

insert into hw3.schedule(student_id,class_id,semester,year,grade) values(11111,10002,3,2020,'B')^




Select * from hw3.student^
Select * from hw3.class^
Select * from hw3.class_prereq^
Select * from hw3.schedule^