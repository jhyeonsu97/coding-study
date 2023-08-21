-- ��¥ ���� ���  --from dual : �������̺� (������ ���� ���̺�) ����
select sysdate from dual;       --��/��/��
select systimestamp from dual;  --��/��/�� ��:��:��

-- ���� ����: to_char: �ð��� ���ڿ��� �ٲ��ִ� �Լ�(�ð�,����(����:----/--/-- --:--:--))
-- yyyy:�⵵4�ڸ� mm:��2�ڸ� dd:�� 2�ڸ�   hh24:24�ð�2�ڸ� mi:�� ss:�� 
select to_char(sysdate,'yyyymmdd hh24miss') from dual; --����ð�
select to_char(sysdate +1,'yyyymmdd hh24miss') from dual; --�Ϸ� �÷���
select to_char(sysdate +1/24,'yyyymmdd hh24miss') from dual; --�ѽð� �÷���
select to_char(sysdate +30/(24*60),'yyyymmdd hh24miss') from dual; --30�� �÷���
select to_char(sysdate +10/(24*60*60),'yyyymmdd hh24miss') from dual; --10�� �÷���

-- ��¥ ����
SELECT sysdate, sysdate+35 from dual;
SELECT sysdate, sysdate-20 from dual;

-- add_month() : ������ ����/���� -*��¥�� �����ϰ� �����ؾ� ����Ÿ���� ����� ����
select add_months(sysdate,4) from dual;

-- months_between() : �������� ���� ��ȯ month_between(ū��,������)
select months_between('2022-05-22','2022-04-22') from dual;
select round(months_between('2022-05-22','2022-04-01'),2) from dual;

-- last_day: �ش� ���� ������ ��¥ ��ȯ
select last_day(sysdate) from dual;
select last_day('2022-01-2') from dual;

-- to_char() ��¥Ÿ��->������ ���� ���� �Լ�
SELECT to_char(sysdate,'yyyy') from dual; -- 2023
SELECT to_char(sysdate,'yy') from dual; -- 23
SELECT to_char(sysdate,'mm-dd') from dual; -- 05-22
SELECT to_char(sysdate,'yy-mm-dd day') from dual; -- 23-05-22 ������
SELECT to_char(sysdate,'d') from dual; -- 1(��)~7(��)
SELECT to_char(sysdate,'dy') from dual; -- ��
SELECT to_char(sysdate,'day') from dual; -- ������

-- to_date() ����Ÿ��->��¥Ÿ�� ���� �Լ�
select to_date('20220522','yyyy-mm-dd') from dual; --22/05/22
select to_char('20220522','yyyy-mm-dd') from dual; --to_char ����(��¥Ÿ������ �����)
select to_date('1998','yyyy') from dual;

-- ���� ���ڿ� 3�ڸ����� �޸�(,) ���, 9:���� �ǹ� (fm: �־��� ���ں��� ������ �ȵ�)
-- as name : �÷����� name ������ ����
select to_char(123456,'FM999,999') as num from dual;
-- FML -> ��XXX,XXX
select to_char(123456450,'FML999,999,999') as num from dual; --�÷����� ���� -> as XX ���������
select to_char(123456,'FM$999,999') as num from dual; --FM$ -> $XXX,XXX ->1234567���� fm-999,999�� ����

-- to_number() ����->���� �Լ�
select to_number('123') as num from dual; 
select '50'+'30' as sum from dual;






