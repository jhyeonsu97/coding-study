create table dept7 (
	deptno number not null,
	dname varchar2(100) not null,
	loc varchar2(100) not null,

	constraint dept7_deptno_pk primary key(deptno),
	constraint dept7_dname_uk unique(dname)
);

create table emp7 (
    empno number not null,
    ename varchar2(100) not null,
    job varchar2(50),
    mgr number,
    hiredate date,
    sal number default '0',
    comm number,
    deptno number not null,
    
    constraint emp7_empno_pk primary key(empno),
    constraint emp7_dept7_deptno_fk foreign key(deptno)
                               references dept7(deptno)
);

