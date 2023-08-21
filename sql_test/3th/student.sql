-- char: 크기 고정(크기가 고정되어 메모리 공간 낭비 초래), varchar에 비해 검색 속도 빠름
-- varchar2: 크기 가변(들어온 데이터 크기에 맞게 세팅값이 변경됨)
create table student(userid varchar2(20) not null, -- not null: null값이 허용되지 않음
                     username char(10) not null, 
                     age number, 
                     gender char(1), 
                     grade char(1));

insert into student values('st101','Tom','15','M','2');            
insert into student values('st102','Jane','16','F','3');
insert into student values('st103','Yakima','14','M','1');
insert into student values('st104','Yong','14','','1');
insert into student values('st105','Minyo','0','F','');
insert into student values('st106','Kang','15','','2');
insert into student values('st107','Kim','0','M','');
insert into student values('st108','Miranda','15','F','2');

-- 통계함수는 column 기준 (행 기준은 X)
select count(*) from student;
select sum(age) from student;
select avg(age) from student;
select min(age) from student;
select max(age) from student;

-- alias(출력 타이틀(컬럼명) 변경)
select username as 이름, userid as 아이디 from student;

-- order by(순차정렬/ 역순정렬)
select * from student order by age desc; --내림차순
select * from student order by age asc;  --오름차순

--Distinct(데이터 중복 제거)
select age from student;
select distinct(age) from student; 

-- (Q1)
select username from student where grade=1;
select username, age from student where age>=15;
select userid from student where gender is null;

-- (Q2)
select username,age,grade from student where userid='st101' or userid='st102';
select * from student where gender='F' and age>=15;
select userid, username from student where gender='M' and grade=2;
select avg(age) from student where gender='M' and age!=0;
select * from student where gender='M' order by age asc;

-- (Q3)
update student set age=14 where userid='st105';
update student set age=15 where userid='st107';
-- 세팅값이 같을 땐 아래와 같이 해도 됨
-- update student set age='15' where userid='st105' or userid='st107';
update student set grade='1' where age=14 and grade is null;
update student set grade='2' where age=15 and grade is null;
update student set grade='3' where age=16 and grade is null;
update student set gender='M' where gender is null;

select username as 이름, userid as 아이디 from student;

commit;
select *from student;