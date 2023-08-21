-- 테이블 생성
create table dept101(
    deptno varchar2(20) primary key,
    dname varchar2(30) unique,
    loc varchar2(100));
    
-- 테이블 구조 확인
desc dept101; 
    
-- 테이블 구조 변경
alter table dept101 modify loc varchar2(200);
    
-- 데이터 입력
insert into dept101(deptno, dname,loc) 
    values('11','aaa','bbb1');
    
-- 데이터 수정
update dept101 set dname='aaa2',loc='bbb2'
    where deptno='11';
    
-- 데이터 삭제
delete from dept101 where deptno='11'; 
delete from dept101; -- 전체 데이터 삭제(제약조건 유지)
    
-- 테이블 초기화
truncate table dept101; -- 전체 데이터 삭제(제약조건 삭제)

-- 테이블 삭제
drop table dept101;

-- 조인
select empno, deptno, dname
    from emp e, dept d
    where e.deptno = d.deptno;

-- rownum을 이용한 출력(급여 높은 순)
select b.* from (
    select rownum rn, a.*from (
        select empno,ename, sal from emp
            order by sal desc) a ) b
where
    rn>=5 and rn<=10;










