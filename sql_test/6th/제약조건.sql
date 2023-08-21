create table memberTest (
    unq number not null,
    id varchar2(20) not null,
    pwd varchar2(100) not null,
    name varchar2(30), -- null ���� ����
    gender char(1), -- 'M','F'
    rdate timestamp, -- ����� �ú��� .. date
    constraint mm_gender_ck check(gender in('M','F')),
    -- primary key : ������ ����, �˻�(index)���̺� �ø�, �ߺ��� �����Ͱ� ������ �� ��ȯ
    constraint mm_unq_pk primary key(unq),
    -- unique : ������ ����, �ߺ��� �����Ͱ� ������ �� ��ȯ
    constraint mm_id_un unique(id)
);

comment on table memberTest is 'ȸ�����̺�';
comment on column memberTest.unq is '������ȣ'; -- ���̺�-��,SQL�� ����
comment on column memberTest.id is '���̵�';
--------------------------------------------------------------------------------
create table memberTest2 (
    unq number not null primary key,
    id varchar2(20) not null unique,
    pwd varchar2(100) not null,
    name varchar2(30), -- null ���� ����
    gender char(1) check(gender in('M','F')), -- 'M','F'
    rdate timestamp -- ����� �ú��� .. date
);
--------------------------------------------------------------------------------
 create sequence memberTest_seq
 increment by 1
 start with 1
 maxvalue 99999;

insert into memberTest(unq,id,pwd,name,gender,rdate)
values(memberTest_seq.nextval,'test1','1111','ȫ�浿','M',sysdate);
   
insert into memberTest(unq,id,pwd,name,gender,rdate)
values(memberTest_seq.nextval,'test2','2222','�۸���','A',sysdate); -- üũ �������ǿ� ����

insert into memberTest(unq,id,pwd,name,gender,rdate)
values(memberTest_seq.nextval,'test1','2222','������','M',sysdate); -- ���Ἲ �������ǿ� ����

create table memberTest3 (
    unq number primary key,
    id varchar2(20) unique,
--  id varchar2(20) primary key, -> ����, �⺻Ű�� �ϳ��� ����
    pwd varchar2(100) not null,
    name varchar2(30) unique, 
    gender char(1)default 'M' check(gender in('M','F')), -- 'M','F'
    rdate timestamp 
);

create table memberTest4 (
    id varchar2(20) not null,
    pwd varchar2(100) not null,
    name varchar2(30) not null,
    gender char(1),
    rdate timestamp,
    constraint mm_gender_ck1 check(gender in('M','F')), -- ��Ī�� �ٸ��� ����
 -- primary : �⺻Ű���� ��ȣ�ȿ��� 2�� ���� ���� !�� �� �ϳ��� �ٸ��� ����X, AND�������� �����
    constraint mm_unq_pk1 primary key(id,name)
);

insert into memberTest4(id,pwd,name,gender,rdate)
values('a1','1234','ȣ����','M',sysdate);
insert into memberTest4(id,pwd,name,gender,rdate)
values('a2','1234','ȣ����','F',sysdate);
insert into memberTest4(id,pwd,name,gender,rdate)
values('a2','1111','ȣ����','F',sysdate); -- ���Ἲ �������� ����
insert into memberTest4(id,pwd,name,gender,rdate)
values('a2','1111','ȣ����','M',sysdate); -- ���̵�� �̸� �� �� �ϳ��� �ٸ��� ������ ����

create table memberTest5 (
    id varchar2(20) primary key(id,name), -- x
    pwd varchar2(100) not null,
    name varchar2(30) not null,
    gender char(1),
    rdate timestamp,
);