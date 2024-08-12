#날짜 : 2024/07/08
#이름 : 박경림
#내용 : SQL 연습문제1 실습하기


#실습 1-1
create database `shop`;
create user 'shop'@'%' identified by '1234';
grant all privileges on `shop`.* to 'shop'@'%';
flush privileges;

drop table Customer;
drop table Product;

#실습 1-2
CREATE TABLE `Customer` (
	`custId` VARCHAR(10)  PRIMARY KEY,
	`name`   VARCHAR(10)  NOT NULL,
	`hp`	 CHAR(13)     DEFAULT NULL,
	`addr`   VARCHAR(100) DEFAULT NULL,
	`rdate`	 DATE         NOT NULL
);

CREATE TABLE `Product` (
`prodNo`  	 	INT PRIMARY KEY,
`prodName`	  	VARCHAR(10) NOT NULL,
`stock`  	  	INT default '0',
`price`  		int DEFAULT NULL,
`company`		VARCHAR(20) NOT NULL
);

CREATE TABLE `Order` (
	`orderNo`	   INT   AUTO_INCREMENT  PRIMARY KEY,
	`orderId`      VARCHAR(10) NOT NULL,
	`orderProduct` INT         NOT NULL,
	`orderCount`   INT         DEFAULT 1,
	`orderDate`    DATETIME    NOT NULL
);


#실습 1-3
INSERT INTO `Customer` VALUES ('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01');
INSERT INTO `Customer` VALUES ('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02');
INSERT INTO `Customer` VALUES ('c103', '장보고', '010-1234-1003', '완도군 청산면', '2022-01-03');
INSERT INTO `Customer` VALUES ('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04');
INSERT INTO `Customer` (`custid`, `name`, `rdate`) VALUES ('c105', '이성계', '2022-01-05');
INSERT INTO `Customer` VALUES ('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06');
INSERT INTO `Customer` (`custid`, `name`, `rdate`) VALUES ('c107', '허준', '2022-01-07');
INSERT INTO `Customer` VALUES ('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08');
INSERT INTO `Customer` VALUES ('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09');
INSERT INTO `Customer` VALUES ('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');

INSERT INTO `Product` VALUES (1, '새우깡',   5000, 1500, '농심');
INSERT INTO `Product` VALUES (2, '초코파이', 2500, 2500, '오리온');
INSERT INTO `Product` VALUES (3, '포카칩',   3600, 1700, '오리온');
INSERT INTO `Product` VALUES (4, '양파링',   1250, 1800, '농심');
INSERT INTO `Product` (`prodNo`, `prodName`, `stock`, `company`) VALUES (5, '죠리퐁',   2200, '크라운');
INSERT INTO `Product` VALUES (6, '마카렛트', 3500, 3500, '롯데');
INSERT INTO `Product` VALUES (7, '뿌셔뿌셔', 1650, 1200, '오뚜기');

INSERT INTO `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) VALUES ('c102', 3, 2, '2022-07-01 13:15:10');
INSERT INTO `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) VALUES ('c101', 4, 1, '2022-07-01 14:16:11');
INSERT INTO `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) VALUES ('c108', 1, 1, '2022-07-01 17:23:18');
INSERT INTO `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) VALUES ('c109', 6, 5, '2022-07-02 10:46:36');
INSERT INTO `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) VALUES ('c102', 2, 1, '2022-07-03 09:15:37');
INSERT INTO `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) VALUES ('c101', 7, 3, '2022-07-03 12:35:12');
INSERT INTO `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) VALUES ('c110', 1, 2, '2022-07-03 16:55:36');
INSERT INTO `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) VALUES ('c104', 2, 4, '2022-07-04 14:23:23');
INSERT INTO `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) VALUES ('c102', 1, 3, '2022-07-04 21:54:34');
INSERT INTO `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) VALUES ('c107', 6, 1, '2022-07-05 14:21:03');



#실습 1-4
select * from `Customer`;

#실습 1-5
select
`custid`, `name`, `hp` 
 from `Customer`;

#실습 1-6
select * from `Product`;

#실습 1-7
select `company` from `Product`;

#실습 1-8
SELECT DISTINCT `company` FROM `Product`;

#실습 1-9
SELECT `prodName`, `price` FROM `Product`;
#실습 1-10
select	`prodName`,`price`+500 as 조정단가 
from `Product`;

#실습 1-11
select prodname, stock, price from product where company = '오리온';

#실습 1-12
select orderproduct, ordercount, orderdate from `order` 
where orderid = 'c102';

#실습 1-13
select orderproduct, ordercount, orderdate from `order` 
where orderid = 'c102'
  and ordercount >= 2;

#실습 1-14
select * from `product`
where price between 1000 and 2000;

#실습 1-15
select custid, name, hp, addr from customer where name like '김%';


#실습 1-16
select custid, name, hp, addr from customer where name like '__';

#실습 1-17
select * from `customer` where hp is null;

#실습 1-18
select * from customer where addr is null;

#실습 1-19
select * from customer order by rdate desc;





#실습 1-20
select * from `order` where ordercount >=3
order by ordercount desc, orderproduct;

#실습 1-21
select avg(price) from product;

#실습 1-22
select sum(stock) as '재고량 합계' from product where company = '농심' ;

#실습 1-23
select count(custid) as '고객수' from customer;

#실습 1-24
select count(distinct(company))as '제조업체 수' from product;

#실습 1-25
select  `orderproduct` as '주문 상품번호', sum(`ordercount`)as '총 주문수량' 
  from `order`
 group by orderproduct
 order by orderproduct;

#실습 1-26
select company as '제조업체', count(*) as '제품수', max(price) as '최고가' from product
group by company
order by company;

#실습 1-27
select company as '제조업체', count(*) as '제품수', max(price) as '최고가' from product
group by company
having `제품수`>=2
order by company;


#실습 1-28
select 
	orderproduct, 
    orderid, 
    sum(`orderCount`) as '총 주문수량'  
  from `order`
 group by orderproduct, orderid
 order by orderproduct ;

#실습 1-29
 select 
	a.orderid, 
	b.prodname
   from `order` a
   join product b
	on a.orderproduct = b.prodno
  where orderid = 'c102';
 
#실습 1-30
  
SELECT `orderid`, `name`, `prodName`, `orderDate` 
  FROM `Order` AS a
  JOIN `Customer` AS b
    ON a.orderId = b.custId
  JOIN `Product` AS c
    ON a.orderProduct = c.prodNo
 WHERE left(`orderDate`, 10) = '2022-07-03'; 