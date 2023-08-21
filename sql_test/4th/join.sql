-- � ���� �� ���̺��� ���� �Ӽ��� ã��(deptno)
-- �μ���ȣ�� ���� �͵鸸 �����.
-- 1. �����ȣ, ����̸�, �μ��̸�
select e.empno as empno, -- as ���� ����
       e.ename as ename,
       d.dname as dname, 
       e.deptno as deptno
from emp e, dept d
where
    e.deptno = d.deptno;

-- �� ���� between ���� �ȿ� ��� ��쿡�� ���
-- 2 . �����ȣ, ����̸�, �޿�, ���
select e.empno,
       e.ename,
       e.sal,
       s.grade || '���' as grade
    from emp e, salgrade s
    where e.sal between s.losal and s.hisal;

-- outer join � ���ο��� ��µ��� �ʾҴ� �����ͱ��� ���
-- 3. �����ȣ, ����̸�, �μ��̸�    
select e.empno empno,
       e.ename ename,
       d.dname dname, 
       d.deptno deptno
from emp e, dept d
where -- emp ���̺� ������ ��µ��� �ʴ� �����͸� ����ϱ� ���� e.deptno�� (+)�� ����
    e.deptno(+) = d.deptno;

-- self join
-- select a.ename || '�� ���� ' || b.ename || '�̴�.' as ���ӻ�����

--4. �����ȣ, ����̸�, �Ŵ�����ȣ, �Ŵ����̸�
select a.empno,
       a.ename,
       a.mgr,
       b.ename
    from emp a, emp b
where
    a.mgr = b. empno
