-- 1. 2000�� ���� �Ի��� ����� �����ȣ, �����, �Ի���(0000-00-00) ���
select empno,ename,to_char(hiredate,'yyyy-mm-dd') from emp where to_char(hiredate,'yyyy')>2000;

-- 2. SMITH�� �μ��� ���
-- select deptno from emp where ename=upper('smith'); -- 20
-- select dname from dept where deptno=20;
select (select dname from dept where deptno=emp.deptno)
    from emp where ename=upper('smith');

-- 3. ��ü ��� �����ȣ, �����, �μ��� ���
select empno, ename,
    (select dname from dept where deptno=emp.deptno) as dname
        from emp;

-- 4. SMITH�� ���� �μ� ����� ���
select * from emp 
    where deptno=(select deptno from emp 
        where ename='SMITH' and rownum=1);

-- 5. SMITH�� ���� �ִ� �μ��� ��� �޿� ���
select round(avg(sal),2) as smith_avg from emp 
    where deptno=(select deptno from emp 
        where ename='SMITH' and rownum=1);

-- 6. SMITH���� �޿��� ���� �޴� ������ ���
select empno, ename, sal, deptno from emp
    where sal >=  (select sal from emp
        where ename = 'SMITH' and rownum=1)
            order by sal desc;

-- 7. ��ü ��� �޿����� ���� �޴� ������ ���
select empno, ename, sal, deptno
    from emp 
        where sal >= (select avg(sal) from emp);
--------------------------------------------------------------------
select empno, ename, sal, deptno, (select round (avg(sal)) from emp)
    from emp 
        where sal >= (select avg(sal) from emp);
        
-- 8. �޿��� ���� ���� �޴� ����� ����(�����ȣ, �����, �޿�) ���
select empno, ename, sal, deptno from emp
    where sal = (select max(sal) from emp
        where job!=upper('president')); -- ���� ����