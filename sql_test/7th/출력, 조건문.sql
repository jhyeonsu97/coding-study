-- {���� �� ���}
-- 1. ��� - ������ �̿��� ���
-- ������ �Է¹޾� �� �޿��� ����Ѵ�
variable sal number; -- �ܺκ��� ����
declare -- ���κ���
    v_sal number := 3000;
begin
    :sal := v_sal/12;
end;
/
print sal;

-- 2. dbms �Լ��� �̿��� ���
declare
    v_sal number(8) := 3000;
    month_sal number(8);
begin 
    month_sal := v_sal/12;
    dbms_output.put_line('�� �޿��� '||month_sal);
end;
/

-- 3. ���̺�Ÿ�� ����ȭ 
declare
    v_deptno dept.deptno%type; -- deptno�÷��� Ÿ���� �����ڴٴ� �ǹ�
    v_dname dept.dname%type; -- dname�÷��� Ÿ���� �����ڴٴ� �ǹ�
begin
    select deptno, dname into v_deptno,v_dname
        from dept
            where loc='BOSTON';
        dbms_output.put_line(v_deptno||'->'||v_dname);
    end;
    /

-- 4. ������ �Է�
declare
    v_deptno dept.deptno%type := 90;
    v_dname dept.dname%type := '�ѹ���';
    v_loc dept.loc%type := '�λ�';
begin
    insert into dept values(v_deptno,v_dname,v_loc);
end;
/

-- Ǯ��� 1. 
declare -- ���κ���
    v_avg number := 0;
begin
    select round(avg(sal)) into v_avg from emp
    where deptno='10';
    dbms_output.put_line('10�� �μ��� ��ձ޿��� '||v_avg||'�Դϴ�.');
end;
/

-- Ǯ��� 2. 
declare
    v_comm emp.comm%type := 400;
begin 
    update emp
        set comm = nvl(comm,0)+v_comm
    where deptno=10;
end;
/
select empno,comm from emp where deptno=10;
rollback;

-- 5. �ܺε����� �Է�
declare
    v_deptno dept.deptno%type:=&dept_no;
begin 
    delete from emp where deptno=v_deptno;
end;
/

-- {���ǹ�}
-- ���� 2. if�� ���
declare
    v_deptno dept.deptno%type:=&deptno;
    v_dname dept.dname%type;
    v_cnt number :=0;
begin
    select count(*) into v_cnt from dept
    where deptno=v_deptno;
    
    if v_cnt = 0 then
        dbms_output.put_line('���� �μ���ȣ �Դϴ�.');    
    else 
        select dname into v_dname 
        from dept
        where deptno=v_deptno;
        dbms_output.put_line('�μ��� : ' || v_dname);
    end if;
end;
/