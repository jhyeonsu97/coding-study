select (select round(avg(sal),2) from emp where deptno='10') as "10_avg",
       (select round(avg(sal),2) from emp where deptno='20') as "20_avg",
       (select round(avg(sal),2) from emp where deptno='30') as "30_avg",
       (select round(avg(sal),2) from emp where deptno='40') as "40_avg"
from 
    dual;

-- 1. �μ��� �޿��� �� ���    
select deptno,round(avg(sal),2) from emp
group by deptno order by deptno asc;

-- 2. ��� ���̺��� �μ���ȣ, �ְ�޿�, �����޿��� �μ��� ���
select deptno, max(sal),min(sal) from emp -- �׷츸 �� �� ����
group by deptno order by deptno asc;

-- 3. ���� �޿��� 1000�̻��� ������
select deptno, max(sal),min(sal) from emp 
group by deptno having min(sal)>=1000;

-- 4. ������ ��� �޿� ���
select job, 
       to_char(round(avg(sal)),'999,999') as avg -- õ���� ���� ��ǥ ������
    from emp
group by job;

-- Q1. �μ��� ����� ��ȸ
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

-- Q3. ������� 5���� �Ѵ� �μ��� ����� ��ȸ
select
        deptno,
        (select dname from dept where deptno=e.deptno) as dname,
        count(empno) as cnt
    from emp e
group by deptno
    having count(empno) >=5; -- having���� �˸��ƽ� ����
--------------------------------------------------------------------------------
select
        dname,
        count(empno) as cnt
    from 
        emp e, dept d
    where e.deptno = d.deptno
group by dname
    having count(empno) >= 5;