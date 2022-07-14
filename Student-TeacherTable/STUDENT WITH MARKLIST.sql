create table STUDENTS(
ID int not null auto_increment,
NAME varchar(25) not null,
AGE int not null,
primary key(id)
);
alter table STUDENTS
  add CITY varchar(20) not null,
  add CONTACT varchar(10);
  alter table STUDENTS add COURSE varchar(5) not null after CONTACT;
alter table STUDENTS add GENDER varchar(10) after AGE;
select * from STUDENTS;

drop table students;

INSERT INTO STUDENTS VALUES
(null,'SURESH',28,'MALE','HOSUR','2400048352','BCA'),
(null,'HARI',11,'MALE','VELUR','2456896352','B.COM'),
(null,'DIVYA',19,'FEMALE','SALEM','0006896352','B.Sc'),
(null,'RAVI',20,'MALE','COIMBATORE','2456895555','B.Sc'),
(null,'DEVI',24,'FEMALE','HOSUR','2450000052','BBA');
INSERT INTO STUDENTS VALUES
(null,'MANI',22,'MALE','VELUR','5896478596','BBA'),
(null,'HARSATH',38,'MALE','HOSUR','2400048352','B.Sc'),
(null,'SURIYA',13,'MALE','KARUR','2456896352','BCA'),
(null,'SARANYA',18,'FEMALE','SALEM','0006896352','B.COM'),
(null,'SAMY',21,'MALE','COIMBATORE','2456895555','B.LIT');
SELECT * FROM STUDENTS;
SELECT * FROM STUDENTS ORDER BY city;
SELECT DISTINCT STUDENTS;
SELECT NAME,AGE FROM STUDENTS;

SELECT NAME,AGE FROM STUDENTS WHERE CITY='HOSUR' AND AGE>=22;

SELECT NAME,AGE FROM STUDENTS WHERE GENDER='MALE' OR CITY='KARUR';

SELECT NAME,AGE,GENDER,CITY FROM STUDENTS WHERE (GENDER='MALE' OR CITY='KARUR') AND AGE>=20;

SELECT COUNT(CITY) FROM STUDENTS;
SELECT COUNT(CITY) AS TOTAL FROM STUDENTS;

SELECT max(AGE) FROM STUDENTS;
SELECT min(AGE) FROM STUDENTS;
SELECT avg(AGE) FROM STUDENTS;
SELECT round(AVG (AGE),0) FROM STUDENTS;

SELECT GENDER,COUNT(ID) FROM STUDENTS GROUP BY GENDER;
SELECT CITY,COUNT(ID) AS TOTAL FROM STUDENTS GROUP BY CITY;

SELECT NAME FROM STUDENTS WHERE NAME LIKE '%A%';
SELECT NAME FROM STUDENTS WHERE NAME LIKE '%A';



create table marks(
mid int not null auto_increment,
id int not null,
tamil int not null,
english int not null,
maths int not null,
primary key(mid)
);
alter table marks
  add physics int not null,
  add chemistry int not null,
  add biology int not null;
select * from marks;

insert into marks values
(null,1,150,124,158,163,120,188),
(null,2,180,98,102,158,85,70),
(null,3,170,184,198,193,190,198),
(null,4,80,94,58,69,78,69),
(null,5,100,136,159,153,120,189);

insert into marks values
(null,6,150,194,155,152,111,158),
(null,7,160,99,152,169,120,120),
(null,8,180,184,108,133,170,98),
(null,9,90,84,68,99,70,56),
(null,10,60,56,59,53,60,74);
select * from marks;


select students.ID,students.NAME,marks.TAMIL,marks.ENGLISH,marks.MATHS,marks.PHYSICS,marks.CHEMISTRY,marks.BIOLOGY from students
inner join marks on students.id=marks.mid;

CREATE VIEW REPORTS AS
select students.ID,students.NAME,marks.TAMIL,marks.ENGLISH,marks.MATHS,marks.PHYSICS,marks.CHEMISTRY,marks.BIOLOGY,
(marks.TAMIL+marks.ENGLISH+marks.MATHS+marks.PHYSICS+marks.CHEMISTRY+marks.BIOLOGY) as TOTAL,
(marks.TAMIL+marks.ENGLISH+marks.MATHS+marks.PHYSICS+marks.CHEMISTRY+marks.BIOLOGY)/6 as AVERAGE,
CASE
   WHEN marks.TAMIL>=70 AND marks.ENGLISH>=70 AND marks.MATHS>=70 AND marks.PHYSICS>=70 AND marks.CHEMISTRY>=70 AND marks.BIOLOGY>=70 THEN'PASS'
   ELSE'FAIL'
END AS 'RESULT',
CASE
   WHEN marks.TAMIL>=70 AND marks.ENGLISH>=70 AND marks.MATHS>=70 AND marks.PHYSICS>=70 AND marks.CHEMISTRY>=70 AND marks.BIOLOGY>=70 THEN
     CASE
      WHEN ROUND((marks.TAMIL+marks.ENGLISH+marks.MATHS+marks.PHYSICS+marks.CHEMISTRY+marks.BIOLOGY)/6,0)>=180 AND ROUND((marks.TAMIL+marks.ENGLISH+marks.MATHS+marks.PHYSICS+marks.CHEMISTRY+marks.BIOLOGY)/6,0)<=200 THEN'A'
      WHEN ROUND((marks.TAMIL+marks.ENGLISH+marks.MATHS+marks.PHYSICS+marks.CHEMISTRY+marks.BIOLOGY)/6,0)>=160 AND ROUND((marks.TAMIL+marks.ENGLISH+marks.MATHS+marks.PHYSICS+marks.CHEMISTRY+marks.BIOLOGY)/6,0)<=179 THEN'B'
       ELSE'C'
     END
   ELSE 'NO GRADE'
END AS GRADE
 from students
inner join marks on students.id=marks.mid;

update marks inner join students on students.id=marks.mid
set tamil=200,english=200,maths=200,physics=200,chemistry=200,biology=200
where students.id=1;

select * from reports;
select total from reports where id=10;

