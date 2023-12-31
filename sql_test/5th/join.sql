create table h_member1(userid varchar2(20) not null primary key, -- 기본키는 not null 필수
                       pass varchar2(100) not null, -- not null 안해도 오류 x
                       name varchar2(20) not null, 
                       birthday date, 
                       phone varchar2(20));
                       
insert into h_member1(userid, pass, name, birthday, phone)
values('hong','1234','홍길동','2010-04-23',null); 
insert into h_member1(userid, pass, name, birthday, phone)
values('tiger','1111','호돌이','2010-11-11','010-5555-7777');
insert into h_member1(userid, pass, name, birthday, phone)
values('linux','qwer','토발즈','2010-08-17','010-2222-1234');
insert into h_member1(userid, pass, name, birthday, phone)
values('java','1212','고릴라','2010-01-02','010-111-7777');

create table h_score1(userid varchar2(20) not null primary key,
                     eng number default '0', -- 누락됐을 경우 기본설정값 0
                     kor number default '0');

insert into h_score1(userid, eng, kor)                       
values('hong','90','88');
insert into h_score1(userid, eng, kor) 
values('tiger','68','54');
insert into h_score1(userid, eng, kor) 
values('linux','98','62');

create table h_grade1(grade varchar2(1),
                      loscore number, -- 정수, number(6,2)
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

-- 풀어보기
-- 1. 아이디, 이름, 영어점수, 국어점수
select m.userid, m.name, s.eng, s.kor
    from h_member1 m, h_score1 s
where
    m.userid = s.userid; -- 3개 출력, 등가 조인
    
-- 2. 아이디, 이름, 영어점수, 국어점수 -- 조인되지 않은 데이터 출력
select m.userid, m.name, s.eng, s.kor
    from h_member1 m, h_score1 s
where
    m.userid = s.userid(+); -- 둘중 적은 데이터 쪽에 +붙힘, outer 조인
    
-- 3. 아이디, 이름, 총점, 평균 -- (영어+국어),(영어+국어)/2
select m.userid,
       m.name,
       (s.eng+s.kor) as hap,
       (s.eng+s.kor)/2 as avg
    from h_member1 m, h_score1 s
where
    m.userid = s.userid;
    
-- 4. 아이디, 이름, 영어점수(학점)
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
    AND -- join은 2개씩 묶어야됨
    s.eng between g.loscore and g.hiscore;
    
-- 5. 아이디, 이름, 국어점수(학점)
select
    s.userid, 
    m.name,
    s.kor,
    g.grade
from 
    h_score1 s, h_grade1 g, h_member1 m
where
    s.userid = m.userid
    AND -- join은 2개씩 묶어야됨
    s.kor between g.loscore and g.hiscore;
    
-- 6. 아이디, 이름, 영어점수(학점), 국어점수(학점)
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

-- 7. 아이디, 이름, 나이
select userid,
       name,
       to_char(sysdate,'yyyy')-to_char(birthday,'yyyy') as age
from 
     h_member1;
     
-- 8. 총점합계 1등 정보 출력
select a.* from (
    select m.userid,
           m.name,
           (s.eng+s.kor) as hap,
           (s.eng+s.kor)/2 as avg
        from h_member1 m, h_score1 s
    where
        m.userid = s.userid
    order by hap desc) a -- 역순정렬
where rownum=1; 

-- 8-1. 꼴등 점수 출력 
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

-- 9. 전화번호가 없는 데이터 출력
select * from h_member1 where phone is null;
select * from h_member1 where phone is not null;

-- 10. 회원이름 중 "홍"씨성 검색
select * from h_member1 where name like '%홍%';
