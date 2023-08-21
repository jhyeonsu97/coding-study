/*

 1. 테이블 생성
  create table
  2. 테이블 데이터 입력
  insert into 테이블명(컬럼명1, 컬럼명2,...) values(값1,값2,...);
  3. 테이블 구조 변경
  alter table 테이블명 옵션 컬럼명 컬럼타입;
   
  					 (table a (문자열타입 5자리), table b (문자열타입 5자리));
  create table test1(a varchar2(5), b varchar2(5));
  		
  select * from test1; // * = 테이블의 모든내용
  
  회원 	 - 독립적 테이블 저장 : 회원테이블(id,name,pass,...)
  게시판1 - 독립적 테이블 저장
  공지사항 - 독립적 테이블 저장
  
  */

