-- char: ũ�� ����(ũ�Ⱑ �����Ǿ� �޸� ���� ���� �ʷ�), varchar�� ���� �˻� �ӵ� ����
-- varchar2: ũ�� ����(���� ������ ũ�⿡ �°� ���ð��� �����)
create table student(userid varchar2(20) not null, -- not null: null���� ������ ����
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

-- ����Լ��� column ���� (�� ������ X)
select count(*) from student;
select sum(age) from student;
select avg(age) from student;
select min(age) from student;
select max(age) from student;

-- alias(��� Ÿ��Ʋ(�÷���) ����)
select username as �̸�, userid as ���̵� from student;

-- order by(��������/ ��������)
select * from student order by age desc; --��������
select * from student order by age asc;  --��������

--Distinct(������ �ߺ� ����)
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
-- ���ð��� ���� �� �Ʒ��� ���� �ص� ��
-- update student set age='15' where userid='st105' or userid='st107';
update student set grade='1' where age=14 and grade is null;
update student set grade='2' where age=15 and grade is null;
update student set grade='3' where age=16 and grade is null;
update student set gender='M' where gender is null;

select username as �̸�, userid as ���̵� from student;

commit;
select *from student;