select (select round(avg(sal),2) from emp where deptno='10') as "10_avg",
       (select round(avg(sal),2) from emp where deptno='20') as "20_avg",
       (select round(avg(sal),2) from emp where deptno='30') as "30_avg",
       (select round(avg(sal),2) from emp where deptno='40') as "40_avg"
from 
    dual;

-- 1. 부서별 급여의 합 출력    
select deptno,round(avg(sal),2) from emp
group by deptno order by deptno asc;

-- 2. 사원 테이블에서 부서번호, 최고급여, 최저급여를 부서별 출력
select deptno, max(sal),min(sal) from emp -- 그룹만 올 수 있음
group by deptno order by deptno asc;

-- 3. 최저 급여가 1000이상인 데이터
select deptno, max(sal),min(sal) from emp 
group by deptno having min(sal)>=1000;

-- 4. 직무별 평균 급여 출력
select job, 
       to_char(round(avg(sal)),'999,999') as avg -- 천단위 마다 쉼표 붙히기
    from emp
group by job;

-- Q1. 부서별 사원수 조회
select 
    deptno,count(empno)
from emp
    group by deptno
order by deptno desc;

-- Q2
select 
    deptno,
    count(empno),
    to_char(round(avg(sal)),'999,999,999') as sal_avg,
    to_char(sum(sal),'999,999,999')as sal_sum
from emp
    group by deptno
order by deptno desc;

-- Q3. 사원수가 5명이 넘는 부서와 사원수 조회
select
        deptno,
        (select dname from dept where deptno=e.deptno) as dname,
        count(empno) as cnt
    from emp e
group by deptno
    having count(empno) >=5; -- having에는 알리아스 못씀
--------------------------------------------------------------------------------
select
        dname,
        count(empno) as cnt
    from 
        emp e, dept d
    where e.deptno = d.deptno
group by dname
    having count(empno) >= 5;