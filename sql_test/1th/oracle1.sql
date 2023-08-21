-- �ǽ� 2
create table sports(code number, name varchar2(10));
insert into sports(code, name) values('101','�౸');
insert into sports(code, name) values('102','�߱�');
insert into sports(code, name) values('103','�豸');

-- ��� �÷� ����
select *from sports; 
select code, name from sports;

update sports set name='�౸' where code = '101';
update sports set name='�߱�' where code = '102';
update sports set name='�豸' where code = '103';

delete from sports where code = '101';
delete from sports;

rollback;

-- �ǽ� 3
-- oracle���� ����Ÿ�� : varchar2
create table flowerInfo(code VARCHAR2(10), name varchar2(20), color varchar(20), price number);
insert into flowerInfo(code,name,color,price) values ('101','rose','red','500');
insert into flowerInfo(code,name,color,price) values ('102','rose','yellow','3000');
insert into flowerInfo(code,name,color,price) values ('103','herb','green','2500');

-- ��ü ���
select * from flowerInfo;
select name from flowerInfo;
select name,price from flowerInfo;

-- ���Ǻ� ���
select * from flowerInfo where name = 'rose';
select * from flowerInfo where price >= 1000;

-- ������ ����
update flowerInfo set color='pink' where code='102';

-- ������ ����
delete from flowerInfo where code='103';

-- �ǽ� 4
create table bookinfo ( -- (å���� ���̺�) ���̺���� ���� ��ȣȭó����Ŵ
code varchar2(20),      -- å �ڵ�
title varchar2(50),     -- å ����
country varchar2(30));  -- å ���Ǳ���

 --���̺� ���� Ȯ��
desc bookinfo;

select * from bookinfo;
--���̺� �÷� �����̶� �� ������ �����ؾ���;
insert into bookInfo (code, title, country)values ('j02','jsp','');
insert into bookInfo (code, title)values ('j03','oracle');
insert into bookInfo (code, title, country)values ('j04','mysql','usa');
insert into bookInfo (code)values ('j05');
insert into bookInfo values ('j06','linux','korea');

-- count() �Լ��� �̿��� ���
select count(*) from bookInfo;
select count(code) from bookInfo;
select count(title) from bookInfo;
select count(country) from bookInfo;


--(null) ->�÷� �ʱ�ȭ�� �ȵȻ���(������(������)�� ���� ����)

--Ǯ���  --oracle���� ����� null�� ���Ͻ�;
select * from bookinfo where title='linux';
select * from bookinfo where country is null;
select * from bookinfo where country is not null;
update bookinfo set country='korea' where code='j02';
update bookinfo set country='korea' where country is null;
select * from bookinfo;