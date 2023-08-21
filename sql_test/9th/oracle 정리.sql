-- ���̺� ����
create table dept101(
    deptno varchar2(20) primary key,
    dname varchar2(30) unique,
    loc varchar2(100));
    
-- ���̺� ���� Ȯ��
desc dept101; 
    
-- ���̺� ���� ����
alter table dept101 modify loc varchar2(200);
    
-- ������ �Է�
insert into dept101(deptno, dname,loc) 
    values('11','aaa','bbb1');
    
-- ������ ����
update dept101 set dname='aaa2',loc='bbb2'
    where deptno='11';
    
-- ������ ����
delete from dept101 where deptno='11'; 
delete from dept101; -- ��ü ������ ����(�������� ����)
    
-- ���̺� �ʱ�ȭ
truncate table dept101; -- ��ü ������ ����(�������� ����)

-- ���̺� ����
drop table dept101;

-- ����
select empno, deptno, dname
    from emp e, dept d
    where e.deptno = d.deptno;

-- rownum�� �̿��� ���(�޿� ���� ��)
select b.* from (
    select rownum rn, a.*from (
        select empno,ename, sal from emp
            order by sal desc) a ) b
where
    rn>=5 and rn<=10;










