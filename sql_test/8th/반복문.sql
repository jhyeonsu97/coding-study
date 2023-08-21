-- {�ݺ���}
-- loop��
-- ���� 1. loof�� �̿��Ͽ� 1~10���� ���
set serveroutput on;

declare
    cnt number := 1;
begin 
    loop
        dbms_output.put_line(cnt);
        cnt := cnt+1;
        exit when cnt>10;
    end loop;
end;
/

-- for��
-- ���� 2. for�� �̿��Ͽ� 1~10 ���
declare
begin
    for i in 1..10 -- for i in reverse 1..10
    loop
        dbms_output.put_line(i);
    end loop;
end;
/

-- ���� 3. ������ ���
declare
    v_cnt number := &n;
begin
    for i in 2..9 loop
        dbms_output.put_line(v_cnt||'*'||i||'='||v_cnt*i);
    end loop;
end;
/

-- while��
-- ���� 5. while loop �ݺ����� �̿��Ͽ� 1~10 ���
declare
    v_cnt number :=1;
begin
    while v_cnt<=10 loop
        dbms_output.put_line(v_cnt);
        v_cnt:=v_cnt+1;
    end loop;
end;
/

-- Ǯ��� 1. ������� ��� PL/SQL
declare
    v_empno number := &empno;
    v_ename varchar2(100);
    v_sal number;
begin
    select ename, sal into v_ename,v_sal from emp
    where empno=v_empno;
    dbms_output.put_line('�����ȣ : '||v_empno||
                         ', ����̸� : '||v_ename||
                         ', ����޿� : '||v_sal);
end;
/

-- Ǯ��� 2. �μ����� �Է� PL/SQL
declare 
    v_deptno dept.deptno%type:=&p_deptno;
    v_dname dept.dname%type:='&p_dname'; -- Ȭ����ǥ ����
    v_loc dept.loc%type:='&p_loc';
    v_cnt number:=0;
begin
    select count(1) into v_cnt from dept
        where deptno=v_deptno or dname = v_dname;
    if v_cnt=0 then
        insert into dept values(v_deptno,v_dname,v_loc);
        dbms_output.put_line('�ԷµǾ����ϴ�');
    else
        dbms_output.put_line('�̹� �ִ� �μ���ȣ �Դϴ�');
    end if;
end;
/

-- Ǯ��� 3. �μ����� ���� PL/SQL
declare
    v_deptno dept.deptno%type:=&p_deptno;
    v_dname dept.dname%type:=&p_dname;
    v_loc dept.loc%type:='&p_loc';
    v_cnt number:=0;
begin 
    select count(deptno) into v_cnt from dept
        where deptno=v_deptno;
    if v_cnt=0 then
        dbms_output.put_line('���� ��ȣ�Դϴ�.');
    else
        UPDATE dept SET dname=v_dname
                        ,loc = v_loc
                    where 
                        deptno = v_deptno;
         dbms_output.put_line('���� ���� ����.');
    end if;
end;
/

-- Ǯ��� 4. dept ���̺��� �μ� ����, �Ҽ����� ������ ���� �Ұ�
declare
    v_deptno number := &p_deptno;
    v_cnt number:= 0;
begin
    select count(1) into v_cnt from emp
        where deptno=v_deptno;
        
        if v_cnt=0 then
            dbms_output.put_line('���� �μ���ȣ �Դϴ�.');
    else
        select count(1) into v_cnt from emp
        where deptno=v_deptno;
        if v_cnt>0 then
             dbms_output.put_line('�����Ұ�. �Ҽ������� ������');
        else
            delete from dept where deptno=v_deptno;
            dbms_output.put_line('�����Ϸ�');
        end if;
    end if;
end;
/
-- rollback;

-- Ǯ��� 5. ���̺��� no��� �÷��� 1�� �������Ѽ� �� �ֱ�
create table test80 (code varchar2(5));
declare
    v_cnt number := 1;
begin
    loop
        insert into test80 values('a'||v_cnt);
        v_cnt := v_cnt + 1;
        exit when v_cnt>10;
    end loop;
end;
/

-- Ǯ��� 6. 1���� 100���� �����հ�
declare
    hap number := 0;
begin
    for i in 1..100 
    loop
        hap := hap+i;
    end loop;
    dbms_output.put_line('�� : '||hap);
end;
/

-- Ǯ��� 7. �޿��λ�(�Ű������� �����ȣ �Է�) ���α׷� �����
declare
    v_empno emp.empno%type:=&p_empno; -- �ܺε����� ���� �� ������ �տ� &(���ۼ���)��������
    v_cnt number;
    v_sal1 emp.sal%type; -- �ʱⰪ ����
    v_sal2 emp.sal%type:=0; -- �ʱⰪ 0
begin
    select count(1) into v_cnt from emp
    where empno = v_empno;
    
    if v_cnt=0 then
        dbms_output.put_line(v_empno||'�� ���� ��ȣ�Դϴ�.');
    else
        select sal into v_sal1 from emp where empno=v_empno;
    
        if v_sal1 <= 1000 then
            v_sal2 := v_sal1 + 100;
        elsif v_sal1 <= 2000 then
            v_sal2 := v_sal1 + 110;            
        elsif v_sal1 <= 3000 then
            v_sal2 := v_sal1 + 120;        
        else
            v_sal2 := v_sal1;
        end if;
          
        update emp set sal=v_sal2 where empno=v_empno;
            
    end if;
end;
/

-- emp�� ���� �߰��ϱ�?
insert into emp(empno,ename,job)
    values((select max(empno)+1 from emp),'HTML1','HTML');