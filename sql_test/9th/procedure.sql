--{���ν���}
-- 1. �����ȣ �Է¹޾� �޿� ����ϴ� ���ν���
set serveroutput on; -- off�� �⺻ ����, ����Լ� �Ѱڴٴ� �ǹ�

create or replace procedure procTest1
    (v_empno in number)
is
    v_sal number;
begin
    select sal into v_sal from emp 
    where empno = v_empno;
    dbms_output.put_line(v_sal);
end;
/

-- 2. �����ȣ �Է¹޾� �޿��� 5000���� updateó��
create or replace procedure proc_up_sal
    (v_empno emp.empno%type,
     v_sal emp.sal%type)
is
begin
    update emp set sal=v_sal
    where empno = v_empno;
    dbms_output.put_line('������Ʈ �Ϸ�');
end;
/

rollback;

-- 3. �����ȣ �Է¹޾� �� ����� �̸��� �޿��� ����ϴ� ���ν���
create or replace procedure proc_emp_sal
    (o_empno emp.empno%type)
is
    v_ename emp.ename%type;
    v_sal emp.sal%type;
begin
    select ename,sal into v_ename, v_sal from emp
    where empno=o_empno;
    dbms_output.put_line('�������'||v_ename||'�Դϴ�');
    dbms_output.put_line('�޿���'||v_sal||'�Դϴ�');
end;
/

-- Q1. �����ȣ �Է¹޾� ���� ó���ϴ� ���ν��� ���� 
create or replace procedure porc_emp_del
    (v_empno emp.empno%type)
is
    v_cnt number := 0;
begin
    select count(*)into v_cnt from emp
    where empno=v_empno;
    if v_cnt=0 then
        dbms_output.put_line(v_empno||'�� �������� �ʴ� ��ȣ �Դϴ�');
    else
        delete from emp where empno=v_empno;
        dbms_output.put_line(v_empno||' :: �����Ϸ�');
    end if;
end;
/

-- Q2. �μ� �޿� ������Ʈ - �μ���ȣ �Է¹޾� �Ʒ� �������� UPDATEó��
create or replace procedure proc_emp_sal_update
    (v_deptno dept.deptno%type)
is

begin
    if v_deptno=10 then
        update emp set sal=round(sal*1.2)
        where deptno=v_deptno;
    elsif v_deptno=20 then
        update emp set sal=round(sal*1.3)
        where deptno=v_deptno;
    elsif v_deptno=30 then
        update emp set sal=round(sal*1.1)
        where deptno=v_deptno;    
    end if; -- else�� ����
    dbms_output.put_line(v_deptno||' :: �޿� ���� �Ϸ�');
end;
/

-- Q3. �μ����̺� �μ� �߰� �Է� ó��
create or replace procedure proc_dept_insert
    (v_deptno in dept.deptno%type,
     v_dname in dept.dname%type,
     v_loc in dept.loc%type)
is
    v_cnt number;
begin
    select count(*) into v_cnt from dept
    where deptno=v_deptno;
    
    if v_cnt=0 then
        insert into dept(deptno,dname,loc)
        values(v_deptno,v_dname,v_loc);
        dbms_output.put_line(v_deptno||'�� ���� ó�� �Ǿ����ϴ�.');
    else
        dbms_output.put_line('�̹� ������� �μ���ȣ �Դϴ�.');
    end if;
end;
/

-- ??
create table emp101
    as select empno,ename,job from emp where 1=2;
create table emp102
    as select empno,ename,job from emp;
    
-- 1. 1001, 1002, 1003 :: insert�� max�Լ� 
select nvl(max(empno),1000)+1 from emp101;
insert into emp101 values
((select nvl(max(empno),1000)+1 from emp101),'JANE','MANAGER');

-- 2. 1001, 1002, 1003 :: insert�� ������(������) ���
create sequence emp101_seq
increment by 1
start with 1001
maxvalue 999999;

insert into emp102 values(emp101_seq.nextval,'TOM','CLERK');
create table goods (code varchar2(20), name varchar2(20));

-- 3. sm1001, sm1002 :: insert�� ����� �Լ� ���
create table goods1 (code varchar2(20), name varchar2(20));
create function fn_goods_code1
return varchar2
is
    v_code1 varchar2(20);
    v_code2 varchar2(20);
begin
    select nvl(max(code),'sm1000') into v_code1 from goods; -- null�� ���
    -- sm1000 or sm1003
    select substr(v_code1,3)+1 into v_code1 from dual;
        v_code2 := 'sm'||v_code1;
    return v_code2;
end;
/

insert into goods values(fn_goods_code1(),'dress');

-- 4. sm0001, sm0002 :: insert�� ����� �Լ� ���
create table goods2 (code varchar2(20), name varchar2(20));
create function fn_goods_code2
return varchar2
is
    v_code1 varchar2(20);
    v_code2 varchar2(20);
begin
    select nvl(max(code),'sm0000') into v_code1 from goods2;
    -- v_code1 -> sm0000 or sm0003
    v_code1 := substr(v_code1,3);
    select ('1'||v_code1)+1 into v_code1 from dual;
    v_code2 := 'sm'||substr(v_code1,2);
    return v_code2;
end;
/

insert into goods values(fn_goods_code2(),'jeans');
-------------------------------------------------------------------------------- 
    select 1003+1 from dual; -- 1004
    select '0003'+1 from dual; -- 4 (x)
    select ('1'||'003')+1 from dual; -- 1004
    select 'sm'+substr('1004',2) from dual; -- sm0004
    return v_code2;

