-- Ǯ���
-- 1. �μ��� ���� �ٸ� �λ�޿� ���
select 
    empno,
    ename,
    sal,
    decode(deptno,10,sal*1.1,
                  20,sal*1.2,sal*1.3) as sal2
from emp;

-- 2. job�� ANALYST : �м���, CLERK : ����... �� ���� ���
select empno,
       ename,
       job,
       decode(job,'ANALYST','�м���',
                  'CLERK','����',
                  'MANAGER','������',
                  'SALESMAN','�������',
                  'PRESIDENT','�����','��') job2 -- as���� ����
from emp; 

-- 3. ����޿��� 2000�̻��̸� ��, �̸��̸� �Ϸ� ���
select empno,
       ename,
       sal,
       decode(sign(sal-2000),1,'��','��') sal2
from emp;

select sign (1000) from dual; -- ����� ��� 1
select sign (-100) from dual; -- ������ ��� -1

-- 4 . ������ �λ�޿� ���
select empno,
       ename,
       sal,
       decode(job,'ANALYST',sal*1.1,
                  'CLERK',sal*1.25,
                  'MANAGER',sal*1.2,
                  'SALESMAN',sal*1.3,
                  'PRESIDENT',sal*1.4,sal) job2 
from emp; 

-- 5 . 1~6������ �⵵�� ������� �ش� ���� �Ի��� ��� �� ���
select count(1) from emp
    where to_char(hiredate,'mm')='01';
    
select 
    count(decode(to_char(hiredate,'mm'),'01',1))"1��",
    count(decode(to_char(hiredate,'mm'),'02',1))"2��",
    count(decode(to_char(hiredate,'mm'),'03',1))"3��",
    count(decode(to_char(hiredate,'mm'),'04',1))"4��",
    count(decode(to_char(hiredate,'mm'),'05',1))"5��",
    count(decode(to_char(hiredate,'mm'),'06',1))"6��"
    
from emp;
--------------------------------------------------------------------------------
select count(*), 
       count(ename),
       count(comm) from emp -- �ϳ��� �������� count ��� ����
