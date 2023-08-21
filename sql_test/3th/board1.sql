-- [ 일반게시판 ] : board1
-- [목록]
-- 번호 제목 글쓴이 등록일 조회수 <-(출력내용)
-- *게시판 생성시 기본 필요 목록*
-- 고유번호 : unq        (숫자) 
-- 제목     : title     (문자열) 100byte
-- 비밀번호 : pass      (문자열) 100
-- 글쓴이   : name      (문자열) 30
-- 내용     : content   (문자열) 4000
-- 등록일   : rdate      (날짜) 연월일시분초
-- 조회수   : hit        (숫자) 

--                                       primary key:중복XX, 고유한 영역 설정됨
create table board1 (unq number not null primary key,
                     title varchar2(100) not null,
                     pass varchar2(100) not null,
                     name varchar2(30),
                     content varchar2(4000),
                     rdate timestamp);

-- (추가하려는 내용)
drop table board1;  
alter table board1 add hit number default '0'; 

insert into board1
      (unq,title,pass,name,content,rdate)
values(1,'oracle수업','1234','홍길동','냉무111',sysdate);

insert into board1
      (unq,title,pass,name,content,rdate)
values(2,'java수업','1111','메이비','냉무222',sysdate);

insert into board1
      (unq,title,pass,name,content,rdate)
values(3,'html수업','2222','나그네','냉무333',sysdate);


-- 1. unq 1번의 제목, 이름, 내용을 출력
select title,name,content from board1 where unq='1';

-- 2. 이름이 "나그네"로 되어 있는 데이터를 출력
select * from board1 where name='나그네';

-- 3. 번호, 제목, 이름을 아래의 형식으로 출력
--   title
--   ---------------------
--   1. oracle수업:홍길동
select unq||':'||title||':'||name as title from board1;  --  || : 연결 연산자

-- 4. 제목과 내용의 길이를 목록 출력
--   oracle수업(4)
--   java수업(5)
--   html수업(5)
select title||'('||length(content)||')' as title from board1;

-- 5. 조회수를 모두 1000으로 변경
update board1 set hit=1000;	-- 모든 데이터

-- 6. 2번의 조회수를 1500, 3번의 조회수를 2000으로 각각 변경
update board1 set hit=1500 where unq='2';

-- 7. 최신글 순으로 출력
update board1 set hit=2000 where unq='3';
commit;

-- 8. 조회수 많은 순으로 출력한다.
select * from board1 order by unq desc;	-- 큰 값부터 출력
select * from board1 order by hit desc;	-- 큰 값부터 출력

-- 9. 제목에서 "java"라는 단어가 들어있는 데이터를 출력
-- LIKE 검색 --> '%':문자열 있어도 되고 없어도 되고., '.' : 문자 한 개(반드시)
-- '%java%' : java라는 단어 앞뒤로 어떠한 문자열이 와도 좋다.
-- 'java%' : java라는 단어로 시작하는 문자열을 의미
-- '.body%' : body라는 단어 앞에 문자 한 개가 반드시 있어야 하고 뒤에 어떠한 문자열이 와도 좋다.
-- (like '%문자%'; : title에서 java가 들어간 단어를 출력)
-- like - %:문자열, _:문자한개
select * from board1 where title like '%java%';

-- 10. unq 3번의 조회수를 +100 한다.
update board1 set hit=hit+100 where unq='3';
--  update board1 set hit=100 where unq='3'; (x)
-- (int a = 1000;
--  a = a + 100;) 