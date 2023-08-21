-- 등가 조인 두 테이블의 공통 속성을 찾음(deptno)
-- 부서번호가 같은 것들만 출력함.
-- 1. 사원번호, 사원이름, 부서이름
select e.empno as empno, -- as 생략 가능
       e.ename as ename,
       d.dname as dname, 
       e.deptno as deptno
from emp e, dept d
where
    e.deptno = d.deptno;

-- 비등가 조인 between 범주 안에 드는 경우에만 출력
-- 2 . 사원번호, 사원이름, 급여, 등급
select e.empno,
       e.ename,
       e.sal,
       s.grade || '등급' as grade
    from emp e, salgrade s
    where e.sal between s.losal and s.hisal;

-- outer join 등가 조인에서 출력되지 않았던 데이터까지 출력
-- 3. 사원번호, 사원이름, 부서이름    
select e.empno empno,
       e.ename ename,
       d.dname dname, 
       d.deptno deptno
from emp e, dept d
where -- emp 테이블에 있지만 출력되지 않던 데이터를 출력하기 위해 e.deptno에 (+)를 붙임
    e.deptno(+) = d.deptno;

-- self join
-- select a.ename || '의 상사는 ' || b.ename || '이다.' as 직속상사관계

--4. 사원번호, 사원이름, 매니저번호, 매니저이름
select a.empno,
       a.ename,
       a.mgr,
       b.ename
    from emp a, emp b
where
    a.mgr = b. empno
