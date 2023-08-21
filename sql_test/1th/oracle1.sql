-- 실습 2
create table sports(code number, name varchar2(10));
insert into sports(code, name) values('101','축구');
insert into sports(code, name) values('102','야구');
insert into sports(code, name) values('103','배구');

-- 모든 컬럼 추출
select *from sports; 
select code, name from sports;

update sports set name='축구' where code = '101';
update sports set name='야구' where code = '102';
update sports set name='배구' where code = '103';

delete from sports where code = '101';
delete from sports;

rollback;

-- 실습 3
-- oracle에서 문자타입 : varchar2
create table flowerInfo(code VARCHAR2(10), name varchar2(20), color varchar(20), price number);
insert into flowerInfo(code,name,color,price) values ('101','rose','red','500');
insert into flowerInfo(code,name,color,price) values ('102','rose','yellow','3000');
insert into flowerInfo(code,name,color,price) values ('103','herb','green','2500');

-- 전체 출력
select * from flowerInfo;
select name from flowerInfo;
select name,price from flowerInfo;

-- 조건별 출력
select * from flowerInfo where name = 'rose';
select * from flowerInfo where price >= 1000;

-- 데이터 수정
update flowerInfo set color='pink' where code='102';

-- 데이터 삭제
delete from flowerInfo where code='103';

-- 실습 4
create table bookinfo ( -- (책정보 테이블) 테이블명은 보통 암호화처리시킴
code varchar2(20),      -- 책 코드
title varchar2(50),     -- 책 제목
country varchar2(30));  -- 책 출판국가

 --테이블 구조 확인
desc bookinfo;

select * from bookinfo;
--테이블 컬럼 세팅이랑 값 갯수랑 동일해야함;
insert into bookInfo (code, title, country)values ('j02','jsp','');
insert into bookInfo (code, title)values ('j03','oracle');
insert into bookInfo (code, title, country)values ('j04','mysql','usa');
insert into bookInfo (code)values ('j05');
insert into bookInfo values ('j06','linux','korea');

-- count() 함수를 이용한 출력
select count(*) from bookInfo;
select count(code) from bookInfo;
select count(title) from bookInfo;
select count(country) from bookInfo;


--(null) ->컬럼 초기화가 안된상태(구조물(데이터)이 없는 상태)

--풀어보기  --oracle에서 공백과 null은 동일시;
select * from bookinfo where title='linux';
select * from bookinfo where country is null;
select * from bookinfo where country is not null;
update bookinfo set country='korea' where code='j02';
update bookinfo set country='korea' where country is null;
select * from bookinfo;