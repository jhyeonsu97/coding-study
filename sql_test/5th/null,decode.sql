-- NVL() �Լ�
select ename, nvl(mgr,0) mgr from emp; -- null���� 0���� ���

select ename, sal, comm, (sal+nvl(comm,0)) from emp;
                           -- nvl2(�÷�,�ξƴ�,����)
select ename, sal, comm, (sal+nvl2(comm,comm+100,0)) from emp; 

-- decode() �Լ�
-- 1. �μ����̺��� �μ���ȣ, �μ��� ���
select deptno,
       dname,
       decode(deptno,10,'ȸ��',20,'����',30,'����',40,'��ȹ') as dname2 -- as��������
from dept;

select deptno,
       dname,
       decode(deptno,10,'ȸ��',20,'����','����') as dname2 -- as��������
from dept;

-- 2. ��� �޿� ���
select ename,
       sal,
       deptno,
       decode(deptno,10,sal*1.1,sal) �λ�޿�
from emp;