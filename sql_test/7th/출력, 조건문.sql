-- {변수 및 출력}
-- 1. 출력 - 변수를 이용한 출력
-- 연봉을 입력받아 월 급여를 출력한다
variable sal number; -- 외부변수 선언
declare -- 내부변수
    v_sal number := 3000;
begin
    :sal := v_sal/12;
end;
/
print sal;

-- 2. dbms 함수를 이용한 출력
declare
    v_sal number(8) := 3000;
    month_sal number(8);
begin 
    month_sal := v_sal/12;
    dbms_output.put_line('내 급여는 '||month_sal);
end;
/

-- 3. 테이블타입 동기화 
declare
    v_deptno dept.deptno%type; -- deptno컬럼의 타입을 따르겠다는 의미
    v_dname dept.dname%type; -- dname컬럼의 타입을 따르겠다는 의미
begin
    select deptno, dname into v_deptno,v_dname
        from dept
            where loc='BOSTON';
        dbms_output.put_line(v_deptno||'->'||v_dname);
    end;
    /

-- 4. 데이터 입력
declare
    v_deptno dept.deptno%type := 90;
    v_dname dept.dname%type := '총무부';
    v_loc dept.loc%type := '부산';
begin
    insert into dept values(v_deptno,v_dname,v_loc);
end;
/

-- 풀어보기 1. 
declare -- 내부변수
    v_avg number := 0;
begin
    select round(avg(sal)) into v_avg from emp
    where deptno='10';
    dbms_output.put_line('10번 부서의 평균급여는 '||v_avg||'입니다.');
end;
/

-- 풀어보기 2. 
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

-- 5. 외부데이터 입력
declare
    v_deptno dept.deptno%type:=&dept_no;
begin 
    delete from emp where deptno=v_deptno;
end;
/

-- {조건문}
-- 예제 2. if문 사용
declare
    v_deptno dept.deptno%type:=&deptno;
    v_dname dept.dname%type;
    v_cnt number :=0;
begin
    select count(*) into v_cnt from dept
    where deptno=v_deptno;
    
    if v_cnt = 0 then
        dbms_output.put_line('없는 부서번호 입니다.');    
    else 
        select dname into v_dname 
        from dept
        where deptno=v_deptno;
        dbms_output.put_line('부서명 : ' || v_dname);
    end if;
end;
/