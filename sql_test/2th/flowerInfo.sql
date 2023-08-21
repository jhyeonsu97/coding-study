create table flowerInfo (
code varchar2(10),
name varchar2(20),
color varchar2(20),
price number
);

insert into flowerInfo(code,name,color,price) values('101','rose','red','500');
insert into flowerInfo(code,name,color,price) values('102','rose','yellow','3000');
insert into flowerInfo(code,name,color,price) values('103','herb','green','2500');

select * from flowerInfo;
select name from flowerInfo;
select name,price from flowerInfo;

select * from flowerInfo where name='rose';
select * from flowerInfo where price >= 1000;
select * from flowerInfo where price < 1000;
select * from flowerInfo where name='rose';

-- 3. 출력 (2)(e) 꽃 가격 1000 ~ 2000
select * from flowerInfo where price >= 1000 and price <= 2000;

-- 4. 102의 색을 pink로 변경
update flowerInfo set color='pink' where code='102';

-- 5. 103 데이터 삭제
delete from flowerInfo where code='103';

