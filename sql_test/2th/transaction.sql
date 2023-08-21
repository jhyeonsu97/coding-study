/*
[Ʈ�����]
�۾��׷�, ������ �߻� ����, Ŀ�԰� Ŀ�� ���̸� ����
commit/rollback/savepoint
(�۾�����/�۾����/�۾���ġ)
insert/update/delete
*/

create table subject(title VARCHAR2(100), price NUMBER);
/* CMD ȭ�� �α���
c:>sqlplus c##java(���̵�)/1234(��й�ȣ)
sql>desc subject
sql>select * from subject;
*/
insert into subject values('java','10000');
select * from subject;
commit;
insert into subject values('jsp','5000');
insert into subject values('html','8000');
commit;   -- Ŀ���� �ؾ� �ϵ��� ����, insert�� �޸𸮿� ����
rollback; -- Ŀ�� �� �ѹ� �Ұ���

delete from subject where title='jsp';
select * from subject;
rollback;

create table abc(userid VARCHAR2(100));
rollback; -- �ȵ�
-- create�� commit,rollback�� ���� ����(=Ʈ����ǰ� ���þ���)

-- savepoint ������� ���
select * from subject;
insert into subject values('a1','1000');
savepoint sp1;
insert into subject values('a2','2000');
savepoint sp2;
select * from subject;

rollback to sp1;
select * from subject;

/*
[���̺� ���� ����]
alter ��ɾ�
1.�÷�Ÿ�� ����: title�� ũ�⸦ 200byte�� �缳��
alter table �̸� modify �÷��� �÷�Ÿ��(����Ʈũ��);
2.�߰�: name ���ڿ�(50) �߰�
alter table �̸� add �÷��� �÷�Ÿ��(ũ��);
3.����: name column ����
alter table �̸� drop column �÷���;
4.�÷��� ����:
alter table �̸� rename column ���÷��� to ���÷���;
*/
desc subject;
alter table subject modify title varchar2(200);
desc subject;
alter table subject add name varchar2(50);
desc subject;
alter table subject drop column name;
desc subject;
alter table subject rename column price to price100;
desc subject;

-- truncate: ������ ��ü ����(rollback �Ұ���)
truncate table subject;
desc subject;
insert into subject values('a1','1000');
delete from subject where title='a1';
rollback;
-- drop: ���̺� ����(rollback �Ұ���)
drop table subject;

create table subject(title VARCHAR2(100), price NUMBER);
insert into subject values('a1','1000');
insert into subject values('a2','5000');
savepoint s1;
-- delete: ������ ����(commit �� rollback ����)
delete from subject where title='a1'; 
rollback to s1;



