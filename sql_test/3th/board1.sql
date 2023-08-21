-- [ �ϹݰԽ��� ] : board1
-- [���]
-- ��ȣ ���� �۾��� ����� ��ȸ�� <-(��³���)
-- *�Խ��� ������ �⺻ �ʿ� ���*
-- ������ȣ : unq        (����) 
-- ����     : title     (���ڿ�) 100byte
-- ��й�ȣ : pass      (���ڿ�) 100
-- �۾���   : name      (���ڿ�) 30
-- ����     : content   (���ڿ�) 4000
-- �����   : rdate      (��¥) �����Ͻú���
-- ��ȸ��   : hit        (����) 

--                                       primary key:�ߺ�XX, ������ ���� ������
create table board1 (unq number not null primary key,
                     title varchar2(100) not null,
                     pass varchar2(100) not null,
                     name varchar2(30),
                     content varchar2(4000),
                     rdate timestamp);

-- (�߰��Ϸ��� ����)
drop table board1;  
alter table board1 add hit number default '0'; 

insert into board1
      (unq,title,pass,name,content,rdate)
values(1,'oracle����','1234','ȫ�浿','�ù�111',sysdate);

insert into board1
      (unq,title,pass,name,content,rdate)
values(2,'java����','1111','���̺�','�ù�222',sysdate);

insert into board1
      (unq,title,pass,name,content,rdate)
values(3,'html����','2222','���׳�','�ù�333',sysdate);


-- 1. unq 1���� ����, �̸�, ������ ���
select title,name,content from board1 where unq='1';

-- 2. �̸��� "���׳�"�� �Ǿ� �ִ� �����͸� ���
select * from board1 where name='���׳�';

-- 3. ��ȣ, ����, �̸��� �Ʒ��� �������� ���
--   title
--   ---------------------
--   1. oracle����:ȫ�浿
select unq||':'||title||':'||name as title from board1;  --  || : ���� ������

-- 4. ����� ������ ���̸� ��� ���
--   oracle����(4)
--   java����(5)
--   html����(5)
select title||'('||length(content)||')' as title from board1;

-- 5. ��ȸ���� ��� 1000���� ����
update board1 set hit=1000;	-- ��� ������

-- 6. 2���� ��ȸ���� 1500, 3���� ��ȸ���� 2000���� ���� ����
update board1 set hit=1500 where unq='2';

-- 7. �ֽű� ������ ���
update board1 set hit=2000 where unq='3';
commit;

-- 8. ��ȸ�� ���� ������ ����Ѵ�.
select * from board1 order by unq desc;	-- ū ������ ���
select * from board1 order by hit desc;	-- ū ������ ���

-- 9. ���񿡼� "java"��� �ܾ ����ִ� �����͸� ���
-- LIKE �˻� --> '%':���ڿ� �־ �ǰ� ��� �ǰ�., '.' : ���� �� ��(�ݵ��)
-- '%java%' : java��� �ܾ� �յڷ� ��� ���ڿ��� �͵� ����.
-- 'java%' : java��� �ܾ�� �����ϴ� ���ڿ��� �ǹ�
-- '.body%' : body��� �ܾ� �տ� ���� �� ���� �ݵ�� �־�� �ϰ� �ڿ� ��� ���ڿ��� �͵� ����.
-- (like '%����%'; : title���� java�� �� �ܾ ���)
-- like - %:���ڿ�, _:�����Ѱ�
select * from board1 where title like '%java%';

-- 10. unq 3���� ��ȸ���� +100 �Ѵ�.
update board1 set hit=hit+100 where unq='3';
--  update board1 set hit=100 where unq='3'; (x)
-- (int a = 1000;
--  a = a + 100;) 