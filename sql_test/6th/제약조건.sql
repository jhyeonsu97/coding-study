create table memberTest (
    unq number not null,
    id varchar2(20) not null,
    pwd varchar2(100) not null,
    name varchar2(30), -- null 포함 가능
    gender char(1), -- 'M','F'
    rdate timestamp, -- 년월일 시분초 .. date
    constraint mm_gender_ck check(gender in('M','F')),
    -- primary key : 고유값 보장, 검색(index)테이블에 올림, 중복된 데이터가 들어왔을 시 반환
    constraint mm_unq_pk primary key(unq),
    -- unique : 고유값 보장, 중복된 데이터가 들어왔을 시 반환
    constraint mm_id_un unique(id)
);

comment on table memberTest is '회원테이블';
comment on column memberTest.unq is '고유번호'; -- 테이블-열,SQL에 붙음
comment on column memberTest.id is '아이디';
--------------------------------------------------------------------------------
create table memberTest2 (
    unq number not null primary key,
    id varchar2(20) not null unique,
    pwd varchar2(100) not null,
    name varchar2(30), -- null 포함 가능
    gender char(1) check(gender in('M','F')), -- 'M','F'
    rdate timestamp -- 년월일 시분초 .. date
);
--------------------------------------------------------------------------------
 create sequence memberTest_seq
 increment by 1
 start with 1
 maxvalue 99999;

insert into memberTest(unq,id,pwd,name,gender,rdate)
values(memberTest_seq.nextval,'test1','1111','홍길동','M',sysdate);
   
insert into memberTest(unq,id,pwd,name,gender,rdate)
values(memberTest_seq.nextval,'test2','2222','멍멍이','A',sysdate); -- 체크 제약조건에 위배

insert into memberTest(unq,id,pwd,name,gender,rdate)
values(memberTest_seq.nextval,'test1','2222','순돌이','M',sysdate); -- 무결성 제약조건에 위배

create table memberTest3 (
    unq number primary key,
    id varchar2(20) unique,
--  id varchar2(20) primary key, -> 오류, 기본키는 하나만 가능
    pwd varchar2(100) not null,
    name varchar2(30) unique, 
    gender char(1)default 'M' check(gender in('M','F')), -- 'M','F'
    rdate timestamp 
);

create table memberTest4 (
    id varchar2(20) not null,
    pwd varchar2(100) not null,
    name varchar2(30) not null,
    gender char(1),
    rdate timestamp,
    constraint mm_gender_ck1 check(gender in('M','F')), -- 별칭도 다르게 설정
 -- primary : 기본키지만 괄호안에는 2개 설정 가능 !둘 중 하나라도 다르면 적용X, AND연산으로 보면됨
    constraint mm_unq_pk1 primary key(id,name)
);

insert into memberTest4(id,pwd,name,gender,rdate)
values('a1','1234','호돌이','M',sysdate);
insert into memberTest4(id,pwd,name,gender,rdate)
values('a2','1234','호순이','F',sysdate);
insert into memberTest4(id,pwd,name,gender,rdate)
values('a2','1111','호순이','F',sysdate); -- 무결성 제약조건 위배
insert into memberTest4(id,pwd,name,gender,rdate)
values('a2','1111','호빵맨','M',sysdate); -- 아이디와 이름 둘 중 하나라도 다르면 데이터 삽입

create table memberTest5 (
    id varchar2(20) primary key(id,name), -- x
    pwd varchar2(100) not null,
    name varchar2(30) not null,
    gender char(1),
    rdate timestamp,
);