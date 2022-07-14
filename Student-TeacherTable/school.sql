create table classroom(
cid int not null auto_increment,
grade int,
section varchar(2),
tid int not null,
primary key(cid),
foreign key(tid) references teachers(tid)
);
insert into classroom values
(null,10,"a",101),(null,10,"b",102),(null,12,"a",103),(null,12,"b",104);
select * from classroom;
drop table classroom;
create table students(
sid int not null,
sname varchar(20) not null,
address varchar(30) not null,
contact int not null,
pid int not null,
cid int not null,
primary key(sid),
foreign key(cid) references classroom(cid),
foreign key(pid) references parents(pid)
);
alter table students add gender varchar(10) not null after sname;
insert into students values
(1001,"mani","male","salem",45678,201,1),
(1002,"vicky","male","madurai",78451,202,2),
(1003,"elaki","female","karur",56478,203,3),
(1004,"guna","male","madurai",25364,204,4),
(1005,"anbu","male","tirupur",25968,205,1),
(1006,"anitha","female","madurai",95124,206,2),
(1007,"suba","female","bangalore",75369,205,3),
(1008,"sathish","male","chennai",55864,207,4),
(1009,"somu","male","coimbatore",22558,203,1),
(1010,"raji","female","dindigul",75896,208,4);
select * from students;
drop table students;
create table teachers(
tid int not null,
tname varchar(20) not null,
city varchar(15),
primary key(tid)
);
insert into teachers values
(101,"suresh","karur"),
(102,"hari","velur"),
(103,"jegan","trichy"),
(104,"suganthi","karur");

select * from teachers;

create table parents(
pid int not null,
pname varchar(20) not null,
contact int,
primary key(pid)
);
insert into parents values
(201,"raja",85236),
(202,"surendar",78945),
(203,"vicky",45612),
(204,"gopal",23010),
(205,"dinesh",41257),
(206,"ramesh",78925),
(207,"divagar",10203),
(208,"sekar",45861);

select * from parents;

create table attendance(
aid int not null,
sid int not null,
adate date not null,
astatus varchar(2) not null,
foreign key(sid) references students(sid)
);
insert into attendance values
(1,1001,"2021-01-11","p"),(2,1001,"2021-01-12","p"),(3,1001,"2021-01-13","p"),
(4,1002,"2021-01-11","a"),(5,1002,"2021-01-12","p"),(6,1002,"2021-01-13","p"),
(7,1003,"2021-01-11","p"),(8,1003,"2021-01-12","p"),(9,1003,"2021-01-13","a"),
(10,1004,"2021-01-11","p"),(11,1004,"2021-01-12","a"),(12,1004,"2021-01-13","a"),
(13,1005,"2021-01-11","a"),(14,1005,"2021-01-12","a"),(15,1005,"2021-01-13","a"),
(16,1006,"2021-01-11","p"),(17,1006,"2021-01-12","a"),(18,1006,"2021-01-13","a"),
(19,1007,"2021-01-11","p"),(20,1007,"2021-01-12","p"),(21,1007,"2021-01-13","a"),
(22,1008,"2021-01-11","a"),(24,1008,"2021-01-12","a"),(25,1008,"2021-01-13","p"),
(26,1009,"2021-01-11","p"),(27,1009,"2021-01-12","p"),(28,1009,"2021-01-13","p"),
(28,1010,"2021-01-11","a"),(29,1010,"2021-01-12","a"),(30,1010,"2021-01-13","a");
select * from attendance;

select * from classroom;
select * from teachers;
select * from students;
select * from parents;
select * from attendance;

select * from classroom;
select * from teachers;

select classroom.grade,classroom.section,teachers.tname,teachers.city from classroom
inner join teachers on teachers.tid=classroom.tid;

select * from classroom;
select * from students;

select classroom.grade,classroom.section,students.sname,students.address from classroom
inner join students on classroom.cid=students.cid;

select * from students;
select * from parents;

select students.sid,students.sname,parents.pname,parents.contact from students
inner join parents on students.pid=parents.pid;

select * from students;
select * from attendance;

select students.sid,students.sname,count(adate)as working,
count(if(astatus="p",1,null)) as present
from students
inner join attendance on students.sid=attendance.sid group by sid;





