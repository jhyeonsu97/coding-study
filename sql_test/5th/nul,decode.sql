-- NVL() 함수
select ename, nvl(mgr,0) mgr from emp; -- null값을 0으로 출력

select ename, sal, comm, (sal+nvl(comm,0)) from emp;
                           -- nvl2(컬럼,널아님,널임)
select ename, sal, comm, (sal+nvl2(comm,comm+100,0)) from emp; 

-- decode() 함수
-- 1. 부서테이블에서 부서번호, 부서명 출력
select deptno,
       dname,
       decode(deptno,10,'회계',20,'조사',30,'영업',40,'기획') as dname2 -- as생략가능
from dept;

select deptno,
       dname,
       decode(deptno,10,'회계',20,'조사','몰라') as dname2 -- as생략가능
from dept;

-- 2. 사원 급여 출력
select ename,
       sal,
       deptno,
       decode(deptno,10,sal*1.1,sal) 인상급여
from emp;