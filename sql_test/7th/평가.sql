-- 도서정보 명세서
create table book_tbl(
b_no number not null primary key,
b_name varchar2(50) not null unique,
b_coverimg varchar2(20),
b_date date,
b_content varchar2(4000),
b_price number,
b_publisher varchar2(50),
b_info varchar2(2000));

-- 시퀀스 생성
create sequence b_no_seq
  start with 101
  increment by 1
  maxvalue 99999;

-- 데이터 입력
insert into book_tbl
      (b_no,b_name,b_coverimg,b_date,b_price,b_publisher,b_info)
values(101,'리눅스시작','101.png','22/01/01',24000,'영진','운영체제와 네트워크');

insert into book_tbl
      (b_no,b_name,b_coverimg,b_date,b_price,b_publisher,b_info)
values(102,'자바초급','102.png','21/03/03',20000,'시공사','프로그래밍 시작하기');

insert into book_tbl
      (b_no,b_name,b_coverimg,b_date,b_price,b_publisher,b_info)
values(103,'자바고급','103.png','22/08/20',30000,'시공사','데이터베이스 연동');

insert into book_tbl
      (b_no,b_name,b_coverimg,b_date,b_price,b_publisher,b_info)
values(104,'오라클박사','104.png','23/02/02',32000,'하움','테이블과 제약조건');

insert into book_tbl
      (b_no,b_name,b_coverimg,b_date,b_price,b_publisher,b_info)
values(105,'JAVASCRIPT','105.png','22/02/12',15000,'다산북스','기초에서 계산기');


-- 대여정보 명세서
create table rent_tbl(
r_no number not null primary key,
b_no number not null ,
r_price number default 0 not null,
r_date date not null,
r_status char(1) default 0 not null ,
CONSTRAINT FK_RENT_BOOK FOREIGN KEY (B_NO) REFERENCES BOOK_TBL (B_NO),
CONSTRAINT CHK_RENT_STATUS CHECK (R_STATUS IN ('0', '1')));

-- 시퀀스 생성
CREATE SEQUENCE r_no_seq
  START WITH 10001
  INCREMENT BY 1
  MAXVALUE 99999;

-- 데이터 입력
insert into rent_tbl(r_no,b_no,r_price,r_date,r_status)
values(10001,101,2400,'23/05/20',0);
insert into rent_tbl(r_no,b_no,r_price,r_date,r_status)
values(10002,102,2000,'23/05/20',0);
insert into rent_tbl(r_no,b_no,r_price,r_date,r_status)
values(10003,101,2400,'23/05/21',0);
insert into rent_tbl(r_no,b_no,r_price,r_date,r_status)
values(10004,101,2400,'23/05/22',0);
insert into rent_tbl(r_no,b_no,r_price,r_date,r_status)
values(10005,103,3000,'23/05/22',1);
insert into rent_tbl(r_no,b_no,r_price,r_date,r_status)
values(10006,104,3500,'23/05/22',1);
insert into rent_tbl(r_no,b_no,r_price,r_date,r_status)
values(10007,102,2000,'23/05/25',1);

commit;

-- 출력
select * from book_tbl;

select b_name, b_price, b_publisher
from book_tbl
where b_info LIKE '%네트워크%';

select b_no, b_name, b_price
from book_tbl
where b_price = (select max(b_price) from book_tbl);

select *from rent_tbl
fetch first 3 rows only;

select r_no, r_price, r_date,
       case when r_status = 0 then '대여 중' else '반납완료' end as r_status
from rent_tbl;

select rent_tbl.r_no, book_tbl.b_no, book_tbl.b_name, to_char(book_tbl.b_price, '9,999') as b_price, to_char(rent_tbl.r_date, 'YYYY-MM-DD') AS r_date
from rent_tbl
join book_tbl on rent_tbl.b_no = book_tbl.b_no;

update book_tbl
set b_no = 110
where b_no = 101;

commit;

select book_tbl.b_name, book_tbl.b_publisher, to_char(rent_tbl.r_date, 'YYYY-MM-DD') as r_date
from rent_tbl
join book_tbl on rent_tbl.b_no = book_tbl.b_no
where to_char(rent_tbl.r_date, 'YYYY-MM-DD') = '2023-05-22'
  and book_tbl.b_publisher like '%시공사%';
  
DESCRIBE book_tbl;
DESCRIBE rent_tbl;

commit;
