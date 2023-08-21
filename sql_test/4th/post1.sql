-- 1. 테이블 전체 데이터(행 기준) 개수를 출력
select count(*) from post1;
-- 2. 서울 지역의 데이터 개수를 출력
select count(*) from post1 where a2 like '%서울%';
-- 3. 서울 지역의 데이터 20개 출력
select * from post1
    where a2 like '%서울%' and rownum <21;
-- 4. 서울 지역의 서초구 출력
select * from post1
    where a2 like '%서울%' and a3 ='서초구';
-- 양재동을 검색하여 출력
select * from post1
    where a4='양재동';
-- 6. 양재동이 무슨구에 속해있는지 '구'이름만 출력
select distinct(a3) from post1 where a4 like '%양재동%';
-- 7. 달서구청 검색하여 정확한 주소 찾아 출력
select * from post1 where a7 like '%달서구청%';
-- 8. 대구지역의 전체 '구' 이름만 출력
select distinct(a3) from post1 where a2 like '%대구%';
-- 9. 우편번호 306762를 검색해 [306762] 대전광역시 대덕수 목상동 동원상수아파트와 같이 출력
select '['||a1||']'||' '||a2||' '||a3||' '||a4||' '||a7 as 결과주소 from post1 
    where a1 like '306762';
-- 10. 서울지역만 따로 추출하여 post_seoul 테이블 생성
select *from post1 where a2 like '%서울%';
-- ?? create talble 테이블명 as select ... : select 내용을 담는 테이블 생성
create table post_seoul as select *from post1 where a2 like '%서울%';
select count(*)from post_seoul ;

