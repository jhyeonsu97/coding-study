CREATE TABLE  DEPT
(
  DEPTNO  NUMBER(2),     -- �μ���ȣ
  DNAME   VARCHAR2(14),  -- �μ��̸�
  LOC     VARCHAR2(13)    -- �μ���ġ
);

insert into dept values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept values(20, 'RESEARCH', 'DALLAS');
insert into dept values(30, 'SALES', 'CHICAGO');
insert into dept values(40, 'OPERATIONS', 'BOSTON');
  

CREATE TABLE  EMP
(
  EMPNO     NUMBER(4),      -- �����ȣ
  ENAME     VARCHAR2(10),   -- ����̸� 
  JOB       VARCHAR2(9),     -- ���� 
  MGR       NUMBER(4),      -- �Ŵ���
  HIREDATE  DATE,           -- �Ի���
  SAL       NUMBER(7,2),     -- �޿�
  COMM      NUMBER(7,2),    -- �߰��޿�
  DEPTNO    NUMBER(2)      -- �μ���ȣ
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
grade number,    -- ���
losal number,     -- �����޿�
hisal number );   -- �ְ�޿�

insert into salgrade values (1, 700, 1200);
insert into salgrade values (2, 1201, 1400);
insert into salgrade values (3, 1401, 2000);
insert into salgrade values (4, 2001, 3000);
insert into salgrade values (5, 3001, 9999);

insert into emp values('8001','TOM','CLERK','7788','2023-05-23','350','','20');
insert into emp values('8002','JANE','CLERK','7788','20220523','350','','20');
insert into emp values('8003','SAM','CLERK','7788',to_date('20210523','yyyy-mm-dd'),'350','','20');

-- Ǯ���
-- 1. �� ���̺��� ���� ���
desc emp;

-- 2. �� ���̺��� ��ü ������ ���
select * from dept;
select * from emp;
select * from salgrade;

-- 3. 10�� �μ����� �ٹ��ϴ� ����� ���
select * from emp where deptno='10';

-- 4. �޿��� 1500 �̻��� ������ ���
select * from emp where sal >= 1500;

-- 5. �޿��� 1500�� ��� � ��޿� ���ϴ��� ���
select '1500�� '||grade||'����Դϴ�.' as str from salgrade where losal <= 1500 and hisal >= 1500;

-- 6. �����Ͱ��� ��ҹ��� ����
select * from emp where job != upper('president') and mgr is null;
SELECT * FROM emp WHERE job = upper('President');
-- = SELECT * FROM emp WHERE job = 'PRESIENT';

-- 7. �̸�(1~2)���, �̸��� ����, �������� *�� ä��
-- LPAD,RPAD ("��", "�� ���ڱ���", "ä����")
-- substr(���ڿ�,���۹�ȣ,��°���)
select substr(ename,1,2)||'***' from emp;
-- ��� �̸� ���(�� 2�ڸ��� �����ϰ� ������ *ó��)
-- rpad(��¹���,��±���,ä����)  
select rpad(substr(ename,1,2),length(ename),'*') from emp;
--          ab***
select rpad('ab',5,'*') from dual;

-- rownum: ���� ������ ����ϴ� �����÷�, ���ȣ �÷�
select rownum,empno,ename from emp where rownum < 6;
select * from emp where rownum <= 10;
--emp.* : emp ���̺� �ִ� ��� ��
select rownum,emp.*from emp where rownum <= 10; -- rownum�� �ٿ��� ����ϴ� ���

-- 1. �ְ�/���� �޿� ���
select max(sal) from emp;
select min(sal) from emp;

-- 2. �޿��հ�/�޿���� ���
select sum(sal) from emp;
select avg(sal) from emp;

-- 3. �ݿø����� ��� - �޿����
select round(avg(sal)) from emp; -- �ݿø�(����)
select round(avg(sal),2) from emp; -- �Ҽ��� 2�ڸ����� ǥ��(�������� �ݿø�)

-- 4. �ø��Լ�/�����Լ� �����Ͽ� ���
select ceil(avg(sal)) from emp;  -- �ø�
select floor(avg(sal)) from emp; -- ����

-- 5. Ŀ�̼� �ʵ� �����͵��� �̿��Ͽ� �հ�,��� ���
select sum(comm) from emp;  -- 2200
select avg(comm) from emp;  -- 5500
select 1400+500+300 from dual; -- 2200
select (1400+500+300)/4 from dual; -- 550

-- 6. ��ü ��� �� ���
select count(*) from emp;

-- 7. ���� ���� ���
-- distinct �ߺ� ����
select distinct(job) from emp;

-- Ǯ���
-- 1. 10�� �μ��� �ٹ��ϴ� ���� �� �ְ� �޿� ���
select max(sal) from emp where deptno='10';

-- 2. 10�� �μ��� �ٹ��ϴ� ���� �� �ְ� �޿����� �̸��� �޿� ���
select ename,sal from emp where deptno='10' and sal=(select max(sal) from emp where deptno='10');

-- 3. �޿� ���� 1000 ~ 2000 ������ ������ ���
select * from emp where sal >= 1000 and sal <=2000;

-- 4. �μ���ȣ 10��, 20�� ������ ���
select * from emp where deptno='10' and deptno='20';

-- 5. �����ȣ 7566�� �Ŵ����μ� �����ϰ� �ִ� ��� �� ���
select count(*) from emp where mgr='7566';

-- 6. ANALYS�� ���ϴ� ��� �� ���
select count(*) from emp where job=upper('analys');

-- 7. �����,�Ի���(��/��/��) ���
select ename,to_char(hiredate,'yyyy-mm-dd') as hiredate from emp;

-- 8. �����,�Ի���(��/��/��) ���(2000�� ���� �Ի���)
select ename,hiredate from emp where to_char(hiredate,'yyyy') >= 2000;
