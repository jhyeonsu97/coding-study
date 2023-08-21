create table nboard (
    unq number not null primary key,
    title varchar2(100) not null,
    name varchar2(20)
);

insert into nboard 
    values(nboard_seq.nextval,'aaa11','bbb111');
select * from  nboard;

create sequence nboard_seq
increment by 1
start with 1
maxvalue 99999999;

-- 1. ���� ������ �� nboard_seq.currval
-- 2. ���� ������ �� nboard_seq.nextval

select nboard_seq.nextval from dual; -- ������ �� ���� 1�� ����
select nboard_seq.currval from dual; -- ���� �� ���

