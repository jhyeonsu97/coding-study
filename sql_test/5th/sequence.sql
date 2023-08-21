-- sequence 연습
create table h_member2(unq number not null primary key,
                       userid varchar2(20) not null, -- 기본키는 not null 필수
                       pass varchar2(100) not null, -- not null 안해도 오류 x
                       name varchar2(20) not null, 
                       birthday date, 
                       phone varchar2(20));
                       
insert into h_member2(unq,userid, pass, name, birthday, phone)
values(h_member1_unq_seq.nextval,'hong','1234','홍길동','2010-04-23',null); 
insert into h_member2(unq,userid, pass, name, birthday, phone)
values(h_member1_unq_seq.nextval,'tiger','1111','호돌이','2010-11-11','010-5555-7777');
insert into h_member2(unq,userid, pass, name, birthday, phone)
values(h_member1_unq_seq.nextval,'linux','qwer','토발즈','2010-08-17','010-2222-1234');
insert into h_member2(unq,userid, pass, name, birthday, phone)
values(h_member1_unq_seq.nextval,'ggg','1212','호떡','2010-01-02','010-111-7777');

create sequence h_member1_unq_seq
increment by 1  -- 증가수치
start with 1    -- 시작수치
maxvalue 99999;

create table a100 (
unq number not null primary key,
title varchar2(20));
insert into a100 values(h_member1_unq_seq.nextval,'aaa'); -- 5, 다음 숫자 적용
insert into a100 values(h_member1_unq_seq.nextval,'bbb'); -- 6

delete from h_number2 where unq='2'; -- 2행 삭제

select h_member1_unq_seq.currval from dual;



