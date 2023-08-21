create table h_member1(userid varchar2(20) not null primary key, -- �⺻Ű�� not null �ʼ�
                       pass varchar2(100) not null, -- not null ���ص� ���� x
                       name varchar2(20) not null, 
                       birthday date, 
                       phone varchar2(20));
                       
insert into h_member1(userid, pass, name, birthday, phone)
values('hong','1234','ȫ�浿','2010-04-23',null); 
insert into h_member1(userid, pass, name, birthday, phone)
values('tiger','1111','ȣ����','2010-11-11','010-5555-7777');
insert into h_member1(userid, pass, name, birthday, phone)
values('linux','qwer','�����','2010-08-17','010-2222-1234');
insert into h_member1(userid, pass, name, birthday, phone)
values('java','1212','����','2010-01-02','010-111-7777');

create table h_score1(userid varchar2(20) not null primary key,
                     eng number default '0', -- �������� ��� �⺻������ 0
                     kor number default '0');

insert into h_score1(userid, eng, kor)                       
values('hong','90','88');
insert into h_score1(userid, eng, kor) 
values('tiger','68','54');
insert into h_score1(userid, eng, kor) 
values('linux','98','62');

create table h_grade1(grade varchar2(1),
                      loscore number, -- ����, number(6,2)
                      hiscore number);
                       
insert into h_grade1(grade, loscore, hiscore) 
values('A','90','100');            
insert into h_grade1(grade, loscore, hiscore) 
values('B','80','89');
insert into h_grade1(grade, loscore, hiscore) 
values('C','70','79');
insert into h_grade1(grade, loscore, hiscore) 
values('D','60','69');            
insert into h_grade1(grade, loscore, hiscore) 
values('F','0','59');

-- Ǯ���
-- 1. ���̵�, �̸�, ��������, ��������
select m.userid, m.name, s.eng, s.kor
    from h_member1 m, h_score1 s
where
    m.userid = s.userid; -- 3�� ���, � ����
    
-- 2. ���̵�, �̸�, ��������, �������� -- ���ε��� ���� ������ ���
select m.userid, m.name, s.eng, s.kor
    from h_member1 m, h_score1 s
where
    m.userid = s.userid(+); -- ���� ���� ������ �ʿ� +����, outer ����
    
-- 3. ���̵�, �̸�, ����, ��� -- (����+����),(����+����)/2
select m.userid,
       m.name,
       (s.eng+s.kor) as hap,
       (s.eng+s.kor)/2 as avg
    from h_member1 m, h_score1 s
where
    m.userid = s.userid;
    
-- 4. ���̵�, �̸�, ��������(����)
select
    s.userid, s.eng, g.grade
from 
    h_score1 s, h_grade1 g
where
    s.eng between g.loscore and g.hiscore;
---------------------------------------------------------------
select
    s.userid, 
    (select name from h_member1 where userid=s.userid) as name,
    s.eng,
    g.grade
from 
    h_score1 s, h_grade1 g
where
    s.eng between g.loscore and g.hiscore;
----------------------------------------------------------------    
select
    s.userid, 
    m.name,
    s.eng,
    g.grade
from 
    h_score1 s, h_grade1 g, h_member1 m
where
    s.userid = m.userid
    AND -- join�� 2���� ����ߵ�
    s.eng between g.loscore and g.hiscore;
    
-- 5. ���̵�, �̸�, ��������(����)
select
    s.userid, 
    m.name,
    s.kor,
    g.grade
from 
    h_score1 s, h_grade1 g, h_member1 m
where
    s.userid = m.userid
    AND -- join�� 2���� ����ߵ�
    s.kor between g.loscore and g.hiscore;
    
-- 6. ���̵�, �̸�, ��������(����), ��������(����)
select
    s.userid,
    s.eng,
    g1.grade,
    s.kor,
    g2.grade
from 
    h_score1 s, h_grade1 g1, h_grade1 g2
where
    s.eng between g1.loscore and g1.hiscore
    AND 
    s.kor between g2.loscore and g2.hiscore;

-- 7. ���̵�, �̸�, ����
select userid,
       name,
       to_char(sysdate,'yyyy')-to_char(birthday,'yyyy') as age
from 
     h_member1;
     
-- 8. �����հ� 1�� ���� ���
select a.* from (
    select m.userid,
           m.name,
           (s.eng+s.kor) as hap,
           (s.eng+s.kor)/2 as avg
        from h_member1 m, h_score1 s
    where
        m.userid = s.userid
    order by hap desc) a -- ��������
where rownum=1; 

-- 8-1. �õ� ���� ��� 
select a.* from (
    select m.userid,
           m.name,
           (s.eng+s.kor) as hap,
           (s.eng+s.kor)/2 as avg
        from h_member1 m, h_score1 s
    where
        m.userid = s.userid
    order by hap asc) a
where rownum=1; 

-- 9. ��ȭ��ȣ�� ���� ������ ���
select * from h_member1 where phone is null;
select * from h_member1 where phone is not null;

-- 10. ȸ���̸� �� "ȫ"���� �˻�
select * from h_member1 where name like '%ȫ%';
