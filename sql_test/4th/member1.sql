-- ROWNUM
select empno, ename, job from emp;
select rownum, empno ename, job from emp;
desc emp;
select rownum, deptno, dname from dept;
select rownum, empno, ename, job from emp where rownum < 6;
select rownum, empno, ename, job from emp where rownum >= 6; -- ��¾ȵ�
select a.* from ( select rownum as rn, empno, ename, job from emp ) a
where rn >= 6 ; -- ��ȣ���� ���̺�� ��

-- 3 ~ 7 / 6 ~ 10 / 11 ~ 15 ���
select a.* from (
    select rownum as rn, empno, ename, job from emp ) a
where rn >= 3 and rn <=7 ;
select a.* from ( 
    select rownum as rn, empno, ename, job from emp ) a
where rn >= 6 and rn <=10 ;
select a.* from ( 
    select rownum as rn, empno, ename, job from emp ) a
where rn >= 11 and rn <=15 ;

-- order by �÷��� (asc �Ǵ� desc �׸��� asc�� ��������)
select b.* from(
    select rownum as rn ,a.* from (
        select empno,ename, job from emp 
            order by empno asc) a) b
where rn >= 6 and rn <= 10;

-- �޿��������� 1~5��, 6~10�� ���
-- (1) 1~5�� �����ȣ, ����̸�, ����, �޿�
select b.* from(
    select rownum as rn ,a.* from (
        select empno,ename,job,sal from emp 
            order by sal desc) a) b
where rn >= 1 and rn <= 5;

-- (2) 6~10�� �����ȣ, ����̸�, ����, �޿�
-- between ������
select b.* from(
    select rownum as rn ,a.* from (
        select empno,ename,job,sal from emp 
            order by sal desc) a) b
where rn between 6 and 11;

-- IN �Լ� ( OR �����ڿ� ������ ��� )
-- �μ���ȣ�� 10 or 20���� ������ ���
select empno, ename, deptno from emp
    where deptno in (10,20);
 -- where deptno=10 or deptno=20; �Ϲ�����
 
-- ������ 'CLERK','ANALYST','PRESIDENT'�� ������ ���
select empno, ename, job, deptno from emp
    where job in('CLERK','ANALYST','PRESIDENT');
 -- where job='CLERK' or job='ANALYST' or job='PRESIDENT'; �Ϲ�����

    



