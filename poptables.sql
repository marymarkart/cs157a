-- -- db2 -td"^" -v -f poptables.sql
insert into hw3.student(student_id,first,last,gender) values(12345,'Mary','Markart','f')^
insert into hw3.student(student_id,first,last,gender) values(11111,'Elizabeth','Conner','f')^
insert into hw3.student(student_id,first,last,gender) values(22222,'Austin','Ribinson','m')^
insert into hw3.student(student_id,first,last,gender) values(33333,'This','Student','m')^
insert into hw3.student(student_id,first,last,gender) values(44444,'That','Student','f')^
insert into hw3.student(student_id,first,last,gender) values(55555,'Undefined','Student','u')^
insert into hw3.student(student_id,first,last,gender) values(54321,'Backwards','Student','u')^
--Duplicate studentID
insert into hw3.student(student_id,first,last,gender) values(54321,'Duplicate','Student','u')^
-- Wrong gender char
insert into hw3.student(student_id,first,last,gender) values(87654,'No Gender','Student','X')^

-- classes
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

-- Test duplicate ID
insert into hw3.class(class_id,name,desc) values(10000,'Dummy','Dummy Class Description')^


-- prerequisites
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

-- test no class id
insert into hw3.class_prereq(class_id,prereq_id) values(66666,10000)^

-- test no prerequisite id
insert into hw3.class_prereq(class_id,prereq_id) values(10000,66666)^

Select * from hw3.student^
Select * from hw3.class^
Select * from hw3.class_prereq^
Select * from hw3.schedule^

insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,01000,1,2019,'A')^

Select * from hw3.schedule^

-- Fail -prereqs not met
insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,20003,2,2019,NULL)^

Select * from hw3.schedule^

insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,10000,3,2019,'A')^

-- Fail
insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,20006,1,2020,'B')^

insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,10001,2,2020,'C')^

insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,20006,3,2020,'A')^

insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,20003,1,2021,'A')^

Select * from hw3.schedule^

insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,20001,1,2021,NULL)^

-- Fail grade for prereq is NULL
insert into hw3.schedule(student_id,class_id,semester,year,grade) values(12345,20004,2,2021,'A')^

Select * from hw3.schedule
