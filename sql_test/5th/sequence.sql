-- sequence ����
create table h_member2(unq number not null primary key,
                       userid varchar2(20) not null, -- �⺻Ű�� not null �ʼ�
                       pass varchar2(100) not null, -- not null ���ص� ���� x
                       name varchar2(20) not null, 
                       birthday date, 
                       phone varchar2(20));
                       
insert into h_member2(unq,userid, pass, name, birthday, phone)
values(h_member1_unq_seq.nextval,'hong','1234','ȫ�浿','2010-04-23',null); 
insert into h_member2(unq,userid, pass, name, birthday, phone)
values(h_member1_unq_seq.nextval,'tiger','1111','ȣ����','2010-11-11','010-5555-7777');
insert into h_member2(unq,userid, pass, name, birthday, phone)
values(h_member1_unq_seq.nextval,'linux','qwer','�����','2010-08-17','010-2222-1234');
insert into h_member2(unq,userid, pass, name, birthday, phone)
values(h_member1_unq_seq.nextval,'ggg','1212','ȣ��','2010-01-02','010-111-7777');

create sequence h_member1_unq_seq
increment by 1  -- ������ġ
start with 1    -- ���ۼ�ġ
maxvalue 99999;

create table a100 (
unq number not null primary key,
title varchar2(20));
insert into a100 values(h_member1_unq_seq.nextval,'aaa'); -- 5, ���� ���� ����
insert into a100 values(h_member1_unq_seq.nextval,'bbb'); -- 6

delete from h_number2 where unq='2'; -- 2�� ����

select h_member1_unq_seq.currval from dual;



