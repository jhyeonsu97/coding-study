create table student11 (
    userid varchar2(20) not null primary key,
    name varchar2(50)
);

-- 자바 상속 (자식레벨)
create table jumsu11 (
    userid varchar2(20) not null,
    kor number,
    eng number,
    constraint jumsu11_fk foreign key(userid)
                          references student11(userid)
);

insert into student11 values('a1','홍길동');
insert into student11 values('a2','심청이');
insert into student11 values('a3','놀부');

insert into jumsu11 values('a1',100,90);
insert into jumsu11 values('a2',90,70);
insert into jumsu11 values('a5',100,90); -- 무결성 제약조건 위배, 부모키 없음

delete from student11 where userid='a1'; -- 삭제 불가 : 무결성 제약조건 위배, 자식레코드 발견

alter table jumsu11 drop constraint jumsu11_fk; -- 제약조건 삭제
delete from student11 where userid='a1'; -- 삭제 가능

create table jumsu12 (
    userid varchar2(20) not null,
    kor number,
    eng number,
    constraint jumsu12_fk foreign key(userid)
                          references student11(userid)
                            on delete cascade
);

insert into student12 values('a2',90,70); -- 자식레벨에 a2 삽입
delete from student11 where userid='a2'; -- 부모,자식레벨 a2 삭제