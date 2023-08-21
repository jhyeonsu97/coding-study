-- {반복문}
-- loop문
-- 예제 1. loof문 이용하여 1~10까지 출력
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

-- for문
-- 예제 2. for문 이용하여 1~10 출력
declare
begin
    for i in 1..10 -- for i in reverse 1..10
    loop
        dbms_output.put_line(i);
    end loop;
end;
/

-- 예제 3. 구구단 출력
declare
    v_cnt number := &n;
begin
    for i in 2..9 loop
        dbms_output.put_line(v_cnt||'*'||i||'='||v_cnt*i);
    end loop;
end;
/

-- while문
-- 예제 5. while loop 반복문을 이용하여 1~10 출력
declare
    v_cnt number :=1;
begin
    while v_cnt<=10 loop
        dbms_output.put_line(v_cnt);
        v_cnt:=v_cnt+1;
    end loop;
end;
/

-- 풀어보기 1. 사원정보 출력 PL/SQL
declare
    v_empno number := &empno;
    v_ename varchar2(100);
    v_sal number;
begin
    select ename, sal into v_ename,v_sal from emp
    where empno=v_empno;
    dbms_output.put_line('사원번호 : '||v_empno||
                         ', 사원이름 : '||v_ename||
                         ', 사원급여 : '||v_sal);
end;
/

-- 풀어보기 2. 부서정보 입력 PL/SQL
declare 
    v_deptno dept.deptno%type:=&p_deptno;
    v_dname dept.dname%type:='&p_dname'; -- 홑따옴표 주의
    v_loc dept.loc%type:='&p_loc';
    v_cnt number:=0;
begin
    select count(1) into v_cnt from dept
        where deptno=v_deptno or dname = v_dname;
    if v_cnt=0 then
        insert into dept values(v_deptno,v_dname,v_loc);
        dbms_output.put_line('입력되었습니다');
    else
        dbms_output.put_line('이미 있는 부서번호 입니다');
    end if;
end;
/

-- 풀어보기 3. 부서정보 수정 PL/SQL
declare
    v_deptno dept.deptno%type:=&p_deptno;
    v_dname dept.dname%type:=&p_dname;
    v_loc dept.loc%type:='&p_loc';
    v_cnt number:=0;
begin 
    select count(deptno) into v_cnt from dept
        where deptno=v_deptno;
    if v_cnt=0 then
        dbms_output.put_line('없는 번호입니다.');
    else
        UPDATE dept SET dname=v_dname
                        ,loc = v_loc
                    where 
                        deptno = v_deptno;
         dbms_output.put_line('내용 변경 성공.');
    end if;
end;
/

-- 풀어보기 4. dept 테이블에서 부서 삭제, 소속직원 있으면 삭제 불가
declare
    v_deptno number := &p_deptno;
    v_cnt number:= 0;
begin
    select count(1) into v_cnt from emp
        where deptno=v_deptno;
        
        if v_cnt=0 then
            dbms_output.put_line('없는 부서번호 입니다.');
    else
        select count(1) into v_cnt from emp
        where deptno=v_deptno;
        if v_cnt>0 then
             dbms_output.put_line('삭제불가. 소속직원이 존재함');
        else
            delete from dept where deptno=v_deptno;
            dbms_output.put_line('삭제완료');
        end if;
    end if;
end;
/
-- rollback;

-- 풀어보기 5. 테이블의 no라는 컬럼에 1씩 증가시켜서 값 넣기
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

-- 풀어보기 6. 1부터 100까지 누적합계
declare
    hap number := 0;
begin
    for i in 1..100 
    loop
        hap := hap+i;
    end loop;
    dbms_output.put_line('합 : '||hap);
end;
/

-- 풀어보기 7. 급여인상(매개변수로 사원번호 입력) 프로그램 만들기
declare
    v_empno emp.empno%type:=&p_empno; -- 외부데이터 받을 때 변수명 앞에 &(엔퍼센드)붙혀야함
    v_cnt number;
    v_sal1 emp.sal%type; -- 초기값 없음
    v_sal2 emp.sal%type:=0; -- 초기값 0
begin
    select count(1) into v_cnt from emp
    where empno = v_empno;
    
    if v_cnt=0 then
        dbms_output.put_line(v_empno||'는 없는 번호입니다.');
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

-- emp에 내용 추가하기?
insert into emp(empno,ename,job)
    values((select max(empno)+1 from emp),'HTML1','HTML');