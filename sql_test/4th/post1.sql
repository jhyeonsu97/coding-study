-- 1. ���̺� ��ü ������(�� ����) ������ ���
select count(*) from post1;
-- 2. ���� ������ ������ ������ ���
select count(*) from post1 where a2 like '%����%';
-- 3. ���� ������ ������ 20�� ���
select * from post1
    where a2 like '%����%' and rownum <21;
-- 4. ���� ������ ���ʱ� ���
select * from post1
    where a2 like '%����%' and a3 ='���ʱ�';
-- ���絿�� �˻��Ͽ� ���
select * from post1
    where a4='���絿';
-- 6. ���絿�� �������� �����ִ��� '��'�̸��� ���
select distinct(a3) from post1 where a4 like '%���絿%';
-- 7. �޼���û �˻��Ͽ� ��Ȯ�� �ּ� ã�� ���
select * from post1 where a7 like '%�޼���û%';
-- 8. �뱸������ ��ü '��' �̸��� ���
select distinct(a3) from post1 where a2 like '%�뱸%';
-- 9. �����ȣ 306762�� �˻��� [306762] ���������� ����� ��� �����������Ʈ�� ���� ���
select '['||a1||']'||' '||a2||' '||a3||' '||a4||' '||a7 as ����ּ� from post1 
    where a1 like '306762';
-- 10. ���������� ���� �����Ͽ� post_seoul ���̺� ����
select *from post1 where a2 like '%����%';
-- ?? create talble ���̺�� as select ... : select ������ ��� ���̺� ����
create table post_seoul as select *from post1 where a2 like '%����%';
select count(*)from post_seoul ;

