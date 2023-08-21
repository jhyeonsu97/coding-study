-- 날짜 정보 출력  --from dual : 가상테이블 (형식을 위한 테이블) 설정
select sysdate from dual;       --연/월/일
select systimestamp from dual;  --연/월/일 시:분:초

-- 포맷 설정: to_char: 시간을 문자열로 바꿔주는 함수(시간,포맷(형식:----/--/-- --:--:--))
-- yyyy:년도4자리 mm:월2자리 dd:일 2자리   hh24:24시간2자리 mi:분 ss:초 
select to_char(sysdate,'yyyymmdd hh24miss') from dual; --현재시간
select to_char(sysdate +1,'yyyymmdd hh24miss') from dual; --하루 플러스
select to_char(sysdate +1/24,'yyyymmdd hh24miss') from dual; --한시간 플러스
select to_char(sysdate +30/(24*60),'yyyymmdd hh24miss') from dual; --30분 플러스
select to_char(sysdate +10/(24*60*60),'yyyymmdd hh24miss') from dual; --10초 플러스

-- 날짜 증감
SELECT sysdate, sysdate+35 from dual;
SELECT sysdate, sysdate-20 from dual;

-- add_month() : 월단위 증가/감소 -*날짜를 동일하게 세팅해야 정수타입의 결과를 얻음
select add_months(sysdate,4) from dual;

-- months_between() : 월단위의 차이 반환 month_between(큰달,작은달)
select months_between('2022-05-22','2022-04-22') from dual;
select round(months_between('2022-05-22','2022-04-01'),2) from dual;

-- last_day: 해당 달의 마지막 날짜 반환
select last_day(sysdate) from dual;
select last_day('2022-01-2') from dual;

-- to_char() 날짜타입->지정된 포맷 변형 함수
SELECT to_char(sysdate,'yyyy') from dual; -- 2023
SELECT to_char(sysdate,'yy') from dual; -- 23
SELECT to_char(sysdate,'mm-dd') from dual; -- 05-22
SELECT to_char(sysdate,'yy-mm-dd day') from dual; -- 23-05-22 월요일
SELECT to_char(sysdate,'d') from dual; -- 1(일)~7(토)
SELECT to_char(sysdate,'dy') from dual; -- 월
SELECT to_char(sysdate,'day') from dual; -- 월요일

-- to_date() 문자타입->날짜타입 변형 함수
select to_date('20220522','yyyy-mm-dd') from dual; --22/05/22
select to_char('20220522','yyyy-mm-dd') from dual; --to_char 오류(날짜타입으로 써야함)
select to_date('1998','yyyy') from dual;

-- 정수 숫자에 3자리마다 콤마(,) 찍기, 9:숫자 의미 (fm: 주어진 숫자보다 작으면 안됨)
-- as name : 컬럼명을 name 값으로 적용
select to_char(123456,'FM999,999') as num from dual;
-- FML -> ￦XXX,XXX
select to_char(123456450,'FML999,999,999') as num from dual; --컬럼명이 없음 -> as XX 적어줘야함
select to_char(123456,'FM$999,999') as num from dual; --FM$ -> $XXX,XXX ->1234567보다 fm-999,999가 작음

-- to_number() 문자->숫자 함수
select to_number('123') as num from dual; 
select '50'+'30' as sum from dual;






