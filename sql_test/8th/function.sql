-- {�Լ�}
-- ���� 1. �Ű��������� �հ踦 ���Ѵ�.
create or replace function fn_mysum(v_num1 in number,v_num2 in number)
return number
is
    v_sum number;
begin
    v_sum := v_num1+v_num2;
    return v_sum;
end;
/

select fn_mysum(50,70) from dual;

-- ���� 2. �μ���ȣ �Է� �޾� �ش� �μ��� �޿� �հ� ���ϴ� �Լ�
create function fn_dept_sal_sum(v_deptno in number)
return number
is
    v_sum number;
begin
    select sum(sal)into v_sum from emp
    where deptno = v_deptno;
    return v_sum;
end;
/

select fn_dept_sal_sum(30) from dual;

-- Ǯ��� 1. �����ȣ �Է¹޾� �޿�+Ŀ�̼��� �����ϴ� �Լ� �ۼ�, null���� 0���� ó��
create function fn_emp_sal(v_empno in emp.empno%type)
return number
is
    v_sal number := 0;
begin
    select nvl(sal,0)+nvl(comm,0) into v_sal from emp -- null���� ���
    where empno=v_empno;
    return v_sal;
end;
/

select fn_emp_sal(7788) from dual;

-- Ǯ��� 2. ������ �Է¹޾� �μ��� �˻��ϴ� �Լ� �ۼ�
create function fn_dept_name(v_ename emp.ename%type)
return varchar2
is
    v_deptno number;
    v_dname dept.dname%type;
begin
    select deptno into v_deptno from emp
    where ename=v_ename;
    select dname into v_dname from dept
    where deptno=v_deptno;
    
    return v_dname;
end;
/

select fn_dept_name('SCOTT') from dual;
--------------------------------------------------------------------------------
-- scott��� �̸� ���� ������ ���
select 
    e.ename, d.dname from emp e, dept d
where 
    e.deptno=d.deptno
and
    e.ename='SCOTT';
--------------------------------------------------------------------------------
create function fn_dept_name(v_ename emp.ename%type)
return varchar2
is
    v_deptno number;
    v_dname dept.dname%type;
begin
    select 
        d.dname into v_dname from emp e, dept d
    where
        e.deptno=d.deptno
    and 
        e.ename=v_ename;
    
    return v_dname;
end;
/

select fn_dept_name('SCOTT') from dual;

-- ���� 4. emp���̺��� ��ü ������ ������ �� ������ ������ ����
-- �Խ��� -> ��ȭ�鿡 5���� ���(ex : 17��/3page -> 17,3) // 17/5 -> 3.4 -> 4
create function fn_empPageCnt(unit number)
return varchar2
is
    tcnt  number;
    tpage  number;
    str  varchar2(100);
begin
    select count(1) into tcnt from emp; -- ���Ǿ��� ��Ż����
    select ceil(tcnt/unit) into tpage from dual;
    str := tcnt||','||tpage;
end;
/

select fn_empPageCnt();

-- {��ü ������ ����}
-- (1) select count(1) from emp; -- 19 -> ��Ī�� ���� 1 �ְڴٴ� �ǹ�
-- (2) select count(*) from emp; -- 19 / max return
-- (3) select count(comm) from emp; --4
-- (4) select count(empno) from emp; --19

-- Ǯ��� 3. �����ȣ �Է¹޾� �Ի���� ���ϱ�
create or replace function fn_emp_periodYear(v_empno in number)
return number
is
    v_year number;
begin
    select to_char(sysdate,'yyyy') - to_char(hiredate,'yyyy') into v_year from emp
    where empno = v_empno;
    return v_year;
end;
/

select fn_emp_periodYear(7788) from dual;

-- Ǯ��� 4. �ش� ������ �Ŵ��� �̸� ���
create or replace function fn_mgrName(v_empno in number)
return varchar2
is
   v_mgr number;
   v_ename varchar2(50);
begin
    select mgr into v_mgr from emp
    where empno=v_empno;
    
    select ename into v_ename from emp
    where empno=v_mgr;
    
    return v_ename;
end;
/

select fn_mgrName(7788) from dual;
--------------------------------------------------------------------------------
-- 7788 -> �Ŵ��� �̸� ���
-- (1) ���߼���Ʈ
select (select ename from emp where empno=e.mgr) as mgr_name
    from emp e
where empno = '7788';
-- (2) join
select e1.ename 
    from emp e1, emp e2
where 
    e1.mgr = e2.empno
and e1.empno = '7788';
--------------------------------------------------------------------------------
-- e1(���������)             e2(�Ŵ���������)
--------------------------------------------------------------------------------
-- mgr, empno, ename..      = empno, ename, mgr..
-- 7756,7788,SCOTT          = 7566   JONES  7839
-- 7788,7876,ADAMS          = 7788   SCOTT  7566
-- 7839,7566,JONES          = 7839   KING   NULL
-- 7902,7369,SMITH          = 7902   FORD   7566
-- 7788,8010,ABC            = 7788   SCOTT  7566