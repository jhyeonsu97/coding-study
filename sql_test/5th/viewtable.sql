-- view 테이블
-- 가상 테이블(물리적인 공간 없음) 
-- 조회만 가능(데이터 수정/삭제 불가)
-- 원본데이터 변경시 같이 

-- 풀어보기 1 + 급여 인상 출력
create view v_emp_copy as select * from emp;

select * from v_emp_copy;

create view v_emp_sal_desc as

select b.* from(
    select rownum rn,a.*from (
        select empno, ename, job, sal 
            from emp
                order by sal desc)a)b; -- 급여 큰 순서로 역순 정렬
                
select * from v_emp_sal_desc
    where rn >= 6 and rn<=10;
    
update emp
    set sal = 6000 -- 6000으로 변경
        where
            ename='KING';
            
-- 풀어보기 2
create view v_research as

select
        d.deptno, d.dname, e.empno, e.ename
    from
        emp e, dept d
    where
        e.deptno=d.deptno
    and
        d.dname='RESEARCH';