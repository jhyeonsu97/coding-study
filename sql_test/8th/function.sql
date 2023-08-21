-- {함수}
-- 예제 1. 매개변수의의 합계를 구한다.
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

-- 예제 2. 부서번호 입력 받아 해당 부서의 급여 합계 구하는 함수
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

-- 풀어보기 1. 사원번호 입력받아 급여+커미션을 리턴하는 함수 작성, null값은 0으로 처리
create function fn_emp_sal(v_empno in emp.empno%type)
return number
is
    v_sal number := 0;
begin
    select nvl(sal,0)+nvl(comm,0) into v_sal from emp -- null값에 대비
    where empno=v_empno;
    return v_sal;
end;
/

select fn_emp_sal(7788) from dual;

-- 풀어보기 2. 직원명 입력받아 부서명 검색하는 함수 작성
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
-- scott라는 이름 으로 직업명 얻기
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

-- 예제 4. emp테이블의 전체 데이터 개수와 총 페이지 개수를 리턴
-- 게시판 -> 한화면에 5개씩 출력(ex : 17개/3page -> 17,3) // 17/5 -> 3.4 -> 4
create function fn_empPageCnt(unit number)
return varchar2
is
    tcnt  number;
    tpage  number;
    str  varchar2(100);
begin
    select count(1) into tcnt from emp; -- 조건없는 토탈개수
    select ceil(tcnt/unit) into tpage from dual;
    str := tcnt||','||tpage;
end;
/

select fn_empPageCnt();

-- {전체 데이터 개수}
-- (1) select count(1) from emp; -- 19 -> 매칭된 곳에 1 넣겠다는 의미
-- (2) select count(*) from emp; -- 19 / max return
-- (3) select count(comm) from emp; --4
-- (4) select count(empno) from emp; --19

-- 풀어보기 3. 사원번호 입력받아 입사년차 구하기
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

-- 풀어보기 4. 해당 직원의 매니저 이름 출력
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
-- 7788 -> 매니저 이름 출력
-- (1) 이중셀렉트
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
-- e1(사원데이터)             e2(매니저데이터)
--------------------------------------------------------------------------------
-- mgr, empno, ename..      = empno, ename, mgr..
-- 7756,7788,SCOTT          = 7566   JONES  7839
-- 7788,7876,ADAMS          = 7788   SCOTT  7566
-- 7839,7566,JONES          = 7839   KING   NULL
-- 7902,7369,SMITH          = 7902   FORD   7566
-- 7788,8010,ABC            = 7788   SCOTT  7566