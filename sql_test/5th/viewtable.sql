-- view ���̺�
-- ���� ���̺�(�������� ���� ����) 
-- ��ȸ�� ����(������ ����/���� �Ұ�)
-- ���������� ����� ���� 

-- Ǯ��� 1 + �޿� �λ� ���
create view v_emp_copy as select * from emp;

select * from v_emp_copy;

create view v_emp_sal_desc as

select b.* from(
    select rownum rn,a.*from (
        select empno, ename, job, sal 
            from emp
                order by sal desc)a)b; -- �޿� ū ������ ���� ����
                
select * from v_emp_sal_desc
    where rn >= 6 and rn<=10;
    
update emp
    set sal = 6000 -- 6000���� ����
        where
            ename='KING';
            
-- Ǯ��� 2
create view v_research as

select
        d.deptno, d.dname, e.empno, e.ename
    from
        emp e, dept d
    where
        e.deptno=d.deptno
    and
        d.dname='RESEARCH';