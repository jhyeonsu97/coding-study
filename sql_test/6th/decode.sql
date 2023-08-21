-- 풀어보기
-- 1. 부서에 따라 다른 인상급여 출력
select 
    empno,
    ename,
    sal,
    decode(deptno,10,sal*1.1,
                  20,sal*1.2,sal*1.3) as sal2
from emp;

-- 2. job을 ANALYST : 분석가, CLERK : 점원... 과 같이 출력
select empno,
       ename,
       job,
       decode(job,'ANALYST','분석가',
                  'CLERK','점원',
                  'MANAGER','관리자',
                  'SALESMAN','영업사원',
                  'PRESIDENT','사장님','모름') job2 -- as생략 가능
from emp; 

-- 3. 사원급여가 2000이상이면 상, 미만이면 하로 출력
select empno,
       ename,
       sal,
       decode(sign(sal-2000),1,'상','하') sal2
from emp;

select sign (1000) from dual; -- 양수일 경우 1
select sign (-100) from dual; -- 음수일 경우 -1

-- 4 . 업무별 인상급여 출력
select empno,
       ename,
       sal,
       decode(job,'ANALYST',sal*1.1,
                  'CLERK',sal*1.25,
                  'MANAGER',sal*1.2,
                  'SALESMAN',sal*1.3,
                  'PRESIDENT',sal*1.4,sal) job2 
from emp; 

-- 5 . 1~6월까지 년도와 상관없이 해당 월에 입사한 사람 수 출력
select count(1) from emp
    where to_char(hiredate,'mm')='01';
    
select 
    count(decode(to_char(hiredate,'mm'),'01',1))"1월",
    count(decode(to_char(hiredate,'mm'),'02',1))"2월",
    count(decode(to_char(hiredate,'mm'),'03',1))"3월",
    count(decode(to_char(hiredate,'mm'),'04',1))"4월",
    count(decode(to_char(hiredate,'mm'),'05',1))"5월",
    count(decode(to_char(hiredate,'mm'),'06',1))"6월"
    
from emp;
--------------------------------------------------------------------------------
select count(*), 
       count(ename),
       count(comm) from emp -- 하나에 여러개의 count 사용 가능
