--{프로시저}
-- 1. 사원번호 입력받아 급여 출력하는 프로시저
set serveroutput on; -- off가 기본 설정, 출력함수 켜겠다는 의미

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

-- 2. 사원번호 입력받아 급여를 5000으로 update처리
create or replace procedure proc_up_sal
    (v_empno emp.empno%type,
     v_sal emp.sal%type)
is
begin
    update emp set sal=v_sal
    where empno = v_empno;
    dbms_output.put_line('업데이트 완료');
end;
/

rollback;

-- 3. 사원번호 입력받아 그 사원의 이름과 급여를 출력하는 프로시저
create or replace procedure proc_emp_sal
    (o_empno emp.empno%type)
is
    v_ename emp.ename%type;
    v_sal emp.sal%type;
begin
    select ename,sal into v_ename, v_sal from emp
    where empno=o_empno;
    dbms_output.put_line('사원명은'||v_ename||'입니다');
    dbms_output.put_line('급여는'||v_sal||'입니다');
end;
/

-- Q1. 사원번호 입력받아 삭제 처리하는 프로시저 생성 
create or replace procedure porc_emp_del
    (v_empno emp.empno%type)
is
    v_cnt number := 0;
begin
    select count(*)into v_cnt from emp
    where empno=v_empno;
    if v_cnt=0 then
        dbms_output.put_line(v_empno||'는 존재하지 않는 번호 입니다');
    else
        delete from emp where empno=v_empno;
        dbms_output.put_line(v_empno||' :: 삭제완료');
    end if;
end;
/

-- Q2. 부서 급여 업데이트 - 부서번호 입력받아 아래 내용으로 UPDATE처리
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
    end if; -- else는 생략
    dbms_output.put_line(v_deptno||' :: 급여 변경 완료');
end;
/

-- Q3. 부서테이블에 부서 추가 입력 처리
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
        dbms_output.put_line(v_deptno||'가 저장 처리 되었습니다.');
    else
        dbms_output.put_line('이미 사용중인 부서번호 입니다.');
    end if;
end;
/

-- ??
create table emp101
    as select empno,ename,job from emp where 1=2;
create table emp102
    as select empno,ename,job from emp;
    
-- 1. 1001, 1002, 1003 :: insert시 max함수 
select nvl(max(empno),1000)+1 from emp101;
insert into emp101 values
((select nvl(max(empno),1000)+1 from emp101),'JANE','MANAGER');

-- 2. 1001, 1002, 1003 :: insert시 시퀀스(생성후) 사용
create sequence emp101_seq
increment by 1
start with 1001
maxvalue 999999;

insert into emp102 values(emp101_seq.nextval,'TOM','CLERK');
create table goods (code varchar2(20), name varchar2(20));

-- 3. sm1001, sm1002 :: insert시 사용자 함수 사용
create table goods1 (code varchar2(20), name varchar2(20));
create function fn_goods_code1
return varchar2
is
    v_code1 varchar2(20);
    v_code2 varchar2(20);
begin
    select nvl(max(code),'sm1000') into v_code1 from goods; -- null값 대비
    -- sm1000 or sm1003
    select substr(v_code1,3)+1 into v_code1 from dual;
        v_code2 := 'sm'||v_code1;
    return v_code2;
end;
/

insert into goods values(fn_goods_code1(),'dress');

-- 4. sm0001, sm0002 :: insert시 사용자 함수 사용
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

