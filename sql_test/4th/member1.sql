-- ROWNUM
select empno, ename, job from emp;
select rownum, empno ename, job from emp;
desc emp;
select rownum, deptno, dname from dept;
select rownum, empno, ename, job from emp where rownum < 6;
select rownum, empno, ename, job from emp where rownum >= 6; -- 출력안됨
select a.* from ( select rownum as rn, empno, ename, job from emp ) a
where rn >= 6 ; -- 괄호안을 테이블로 봄

-- 3 ~ 7 / 6 ~ 10 / 11 ~ 15 출력
select a.* from (
    select rownum as rn, empno, ename, job from emp ) a
where rn >= 3 and rn <=7 ;
select a.* from ( 
    select rownum as rn, empno, ename, job from emp ) a
where rn >= 6 and rn <=10 ;
select a.* from ( 
    select rownum as rn, empno, ename, job from emp ) a
where rn >= 11 and rn <=15 ;

-- order by 컬럼명 (asc 또는 desc 그리고 asc는 생략가능)
select b.* from(
    select rownum as rn ,a.* from (
        select empno,ename, job from emp 
            order by empno asc) a) b
where rn >= 6 and rn <= 10;

-- 급여기준으로 1~5등, 6~10등 출력
-- (1) 1~5등 사원번호, 사원이른, 업무, 급여
select b.* from(
    select rownum as rn ,a.* from (
        select empno,ename,job,sal from emp 
            order by sal desc) a) b
where rn >= 1 and rn <= 5;

-- (2) 6~10등 사원번호, 사원이른, 업무, 급여
-- between 연산자
select b.* from(
    select rownum as rn ,a.* from (
        select empno,ename,job,sal from emp 
            order by sal desc) a) b
where rn between 6 and 11;

-- IN 함수 ( OR 연산자와 동일한 기능 )
-- 부서번호가 10 or 20번인 직원들 출력
select empno, ename, deptno from emp
    where deptno in (10,20);
 -- where deptno=10 or deptno=20; 일반조건
 
-- 직업이 'CLERK','ANALYST','PRESIDENT'인 직원들 출력
select empno, ename, job, deptno from emp
    where job in('CLERK','ANALYST','PRESIDENT');
 -- where job='CLERK' or job='ANALYST' or job='PRESIDENT'; 일반조건

    



