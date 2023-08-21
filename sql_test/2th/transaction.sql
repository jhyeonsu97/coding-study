/*
[트랜잭션]
작업그룹, 여러개 발생 가능, 커밋과 커밋 사이를 말함
commit/rollback/savepoint
(작업종료/작업취소/작업위치)
insert/update/delete
*/

create table subject(title VARCHAR2(100), price NUMBER);
/* CMD 화면 로그인
c:>sqlplus c##java(아이디)/1234(비밀번호)
sql>desc subject
sql>select * from subject;
*/
insert into subject values('java','10000');
select * from subject;
commit;
insert into subject values('jsp','5000');
insert into subject values('html','8000');
commit;   -- 커밋을 해야 하드웨어에 적용, insert는 메모리에 저장
rollback; -- 커밋 후 롤백 불가능

delete from subject where title='jsp';
select * from subject;
rollback;

create table abc(userid VARCHAR2(100));
rollback; -- 안됨
-- create는 commit,rollback과 관련 없음(=트랜잭션과 관련없음)

-- savepoint 저장시점 기록
select * from subject;
insert into subject values('a1','1000');
savepoint sp1;
insert into subject values('a2','2000');
savepoint sp2;
select * from subject;

rollback to sp1;
select * from subject;

/*
[테이블 구조 변경]
alter 명령어
1.컬럽타입 변경: title의 크기를 200byte로 재설정
alter table 이름 modify 컬럼명 컬럼타입(바이트크기);
2.추가: name 문자열(50) 추가
alter table 이름 add 컬럼명 컬럼타입(크기);
3.삭제: name column 삭제
alter table 이름 drop column 컬럼명;
4.컬럼명 변경:
alter table 이름 rename column 원컬럼명 to 뉴컬럼명;
*/
desc subject;
alter table subject modify title varchar2(200);
desc subject;
alter table subject add name varchar2(50);
desc subject;
alter table subject drop column name;
desc subject;
alter table subject rename column price to price100;
desc subject;

-- truncate: 데이터 전체 삭제(rollback 불가능)
truncate table subject;
desc subject;
insert into subject values('a1','1000');
delete from subject where title='a1';
rollback;
-- drop: 테이블 삭제(rollback 불가능)
drop table subject;

create table subject(title VARCHAR2(100), price NUMBER);
insert into subject values('a1','1000');
insert into subject values('a2','5000');
savepoint s1;
-- delete: 데이터 삭제(commit 전 rollback 가능)
delete from subject where title='a1'; 
rollback to s1;



