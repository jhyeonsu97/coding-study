CREATE TABLE  DEPT
(
  DEPTNO  NUMBER(2),     -- 부서번호
  DNAME   VARCHAR2(14),  -- 부서이름
  LOC     VARCHAR2(13)    -- 부서위치
);

insert into dept values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept values(20, 'RESEARCH', 'DALLAS');
insert into dept values(30, 'SALES', 'CHICAGO');
insert into dept values(40, 'OPERATIONS', 'BOSTON');
  

CREATE TABLE  EMP
(
  EMPNO     NUMBER(4),      -- 사원번호
  ENAME     VARCHAR2(10),   -- 사원이름 
  JOB       VARCHAR2(9),     -- 업무 
  MGR       NUMBER(4),      -- 매니저
  HIREDATE  DATE,           -- 입사일
  SAL       NUMBER(7,2),     -- 급여
  COMM      NUMBER(7,2),    -- 추가급여
  DEPTNO    NUMBER(2)      -- 부서번호
);

insert into emp values( 7839, 'KING', 'PRESIDENT', null, to_date('1996-11-17','yyyy-mm-dd'), 5000, null, 10);
insert into emp values( 7698, 'BLAKE', 'MANAGER', 7839, to_date('1991-1-05','yyyy-mm-dd'), 2850, null, 30);
insert into emp values( 7782, 'CLARK', 'MANAGER', 7839, to_date('1999-9-06','yyyy-mm-dd'), 2450, null, 10);
insert into emp values( 7566, 'JONES', 'MANAGER', 7839, to_date('2001-02-04','yyyy-mm-dd'), 2975, null, 20);
insert into emp values( 7788, 'SCOTT', 'ANALYST', 7566, to_date('2003-06-17','yyyy-mm-dd'), 3000, null, 20);
insert into emp values( 7902, 'FORD', 'ANALYST', 7566, to_date('1981-03-12','yyyy-mm-dd'), 3000, null, 20);
insert into emp values( 7369, 'SMITH', 'CLERK', 7902, to_date('2007-12-1','yyyy-mm-dd'), 800, null, 20);
insert into emp values( 7499, 'ALLEN', 'SALESMAN', 7698, to_date('20-2-1981','dd-mm-yyyy'), 1600, 300, 30);
insert into emp values( 7521, 'WARD', 'SALESMAN', 7698, to_date('22-2-1981','dd-mm-yyyy'), 1250, 500, 30);
insert into emp values( 7654, 'MARTIN', 'SALESMAN', 7698, to_date('28-9-1981','dd-mm-yyyy'), 1250, 1400, 30);
insert into emp values( 7844, 'TURNER', 'SALESMAN', 7698, to_date('8-9-1981','mm-dd-yyyy'), 1500, 0, 30);
insert into emp values( 7876, 'ADAMS', 'CLERK', 7788, to_date('13-7-87', 'dd-mm-yy') - 51, 1100, null, 20);
insert into emp values( 7900, 'JAMES', 'CLERK', 7698, to_date('3-12-1981','mm-dd-yyyy'), 950, null, 30);
insert into emp values( 7934, 'MILLER', 'CLERK', 7782, to_date('2003-1-23','yyyy-mm-dd'), 1300, null, 10);
  
CREATE TABLE salgrade (
grade number,    -- 등급
losal number,     -- 최저급여
hisal number );   -- 최고급여

insert into salgrade values (1, 700, 1200);
insert into salgrade values (2, 1201, 1400);
insert into salgrade values (3, 1401, 2000);
insert into salgrade values (4, 2001, 3000);
insert into salgrade values (5, 3001, 9999);

insert into emp values('8001','TOM','CLERK','7788','2023-05-23','350','','20');
insert into emp values('8002','JANE','CLERK','7788','20220523','350','','20');
insert into emp values('8003','SAM','CLERK','7788',to_date('20210523','yyyy-mm-dd'),'350','','20');

-- 풀어보기
-- 1. 각 테이블의 구조 출력
desc emp;

-- 2. 각 테이블의 전체 데이터 출력
select * from dept;
select * from emp;
select * from salgrade;

-- 3. 10번 부서에서 근무하는 사원들 출력
select * from emp where deptno='10';

-- 4. 급여가 1500 이상인 직원들 출력
select * from emp where sal >= 1500;

-- 5. 급여가 1500인 경우 어떤 등급에 속하는지 출력
select '1500은 '||grade||'등급입니다.' as str from salgrade where losal <= 1500 and hisal >= 1500;

-- 6. 데이터값은 대소문자 구별
select * from emp where job != upper('president') and mgr is null;
SELECT * FROM emp WHERE job = upper('President');
-- = SELECT * FROM emp WHERE job = 'PRESIENT';

-- 7. 이름(1~2)출력, 이름의 길이, 나머지를 *로 채움
-- LPAD,RPAD ("값", "총 문자길이", "채움문자")
-- substr(문자열,시작번호,출력개수)
select substr(ename,1,2)||'***' from emp;
-- 사원 이름 출력(앞 2자리만 노출하고 나머지 *처리)
-- rpad(출력문자,출력길이,채움문자)  
select rpad(substr(ename,1,2),length(ename),'*') from emp;
--          ab***
select rpad('ab',5,'*') from dual;

-- rownum: 쿼리 내에서 사용하는 가상컬럼, 행번호 컬럼
select rownum,empno,ename from emp where rownum < 6;
select * from emp where rownum <= 10;
--emp.* : emp 테이블에 있는 모든 것
select rownum,emp.*from emp where rownum <= 10; -- rownum을 붙여서 출력하는 경우

-- 1. 최고/최저 급여 출력
select max(sal) from emp;
select min(sal) from emp;

-- 2. 급여합계/급여평균 출력
select sum(sal) from emp;
select avg(sal) from emp;

-- 3. 반올림으로 출력 - 급여평균
select round(avg(sal)) from emp; -- 반올림(정수)
select round(avg(sal),2) from emp; -- 소수점 2자리까지 표현(마지막은 반올림)

-- 4. 올림함수/내림함수 적용하여 출력
select ceil(avg(sal)) from emp;  -- 올림
select floor(avg(sal)) from emp; -- 내림

-- 5. 커미션 필드 데이터들을 이용하여 합계,평균 출력
select sum(comm) from emp;  -- 2200
select avg(comm) from emp;  -- 5500
select 1400+500+300 from dual; -- 2200
select (1400+500+300)/4 from dual; -- 550

-- 6. 전체 사원 수 출력
select count(*) from emp;

-- 7. 업무 종류 출력
-- distinct 중복 제거
select distinct(job) from emp;

-- 풀어보기
-- 1. 10번 부서에 근무하는 직원 중 최고 급여 출력
select max(sal) from emp where deptno='10';

-- 2. 10번 부서에 근무하는 직원 중 최고 급여자의 이름과 급여 출력
select ename,sal from emp where deptno='10' and sal=(select max(sal) from emp where deptno='10');

-- 3. 급여 기준 1000 ~ 2000 사이의 데이터 출력
select * from emp where sal >= 1000 and sal <=2000;

-- 4. 부서번호 10번, 20번 데이터 출력
select * from emp where deptno='10' and deptno='20';

-- 5. 사원번호 7566이 매니저로서 관리하고 있는 사원 수 출력
select count(*) from emp where mgr='7566';

-- 6. ANALYS로 일하는 사원 수 출력
select count(*) from emp where job=upper('analys');

-- 7. 사원명,입사일(년/월/일) 출력
select ename,to_char(hiredate,'yyyy-mm-dd') as hiredate from emp;

-- 8. 사원명,입사일(년/월/일) 출력(2000년 이후 입사자)
select ename,hiredate from emp where to_char(hiredate,'yyyy') >= 2000;
