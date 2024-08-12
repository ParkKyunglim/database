#날짜 : 2024/07/12
#이름 : 박경림
#내용 : SQL 연습문제5 


#실습 5-1
CREATE DATABASE `BookStore`;
CREATE USER 'bookstore'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `BookStore`.* TO 'bookstore'@'%';
FLUSH PRIVILEGES;

#실습 5-2
CREATE TABLE `Customer` (
   `custId`   int AUTO_INCREMENT PRIMARY KEY,
   `name`      VARCHAR(10) NOT NULL,
   `adress`   VARCHAR(20) default NULL,
   `phone`      VARCHAR(13) default NULL
    );

CREATE TABLE `Book` (
	`bookId`		int  			PRIMARY KEY,
	`bookName`    	VARCHAR(20) 	NOT NULL,
	`publisher`		VARCHAR(20) 	NOT NULL,
	`price`   		int				DEFAULT NULL
);

CREATE TABLE `Order` (
	`orderId`		int  	AUTO_INCREMENT	PRIMARY KEY,
	`custId`    	int		NOT NULL,
    `bookId`    	int		NOT NULL,
	`salePrice`		int		NOT NULL,
	`OrderDate`   	DATE	DEFAULT NULL
);
drop table `Order`;

#실습 5-3

insert into `Customer` (`name`, `adress`, `phone`) value ('박지성', '영국 맨체스타', '000-5000-0001');
insert into `Customer` (`name`, `adress`, `phone`) value ('김연아', '대한민국 서울', '000-6000-0001');
insert into `Customer` (`name`, `adress`, `phone`) value ('장미란', '대한민국 강원도', '000-7000-0001');
insert into `Customer` (`name`, `adress`, `phone`) value ('추신수', '미국 클리블랜드', '000-8000-0001');
insert into `Customer` (`name`, `adress`, `phone`) value ('박세리', '대한민국 대전', null);


insert into `Book` values (1, '축구의 역사', '굿스포츠', 7000);
insert into `Book` values (2, '축구아는 여자', '나무수', 13000);
insert into `Book` values (3, '축구의 이해', '대한미디어', 22000);
insert into `Book` values (4, '골프 바이블', '대한미디어', 35000);
insert into `Book` values (5, '피겨 교본', '굿스포츠', 8000);
insert into `Book` values (6, '역도 단계별기술', '굿스포츠', 6000);
insert into `Book` values (7, '야구의 추억', '이상미디어', 20000);
insert into `Book` values (8, '야구를 부탁해', '이상미디어', 13000);
insert into `Book` values (9, '올림픽 이야기', '삼성당', 7500);
insert into `Book` values (10, 'Olympic Champions', 'Pearon', 13000);

insert into `Order` (`custId`, `bookId`, `salePrice`, `OrderDate`) value (1, 1, 6000, '2014-07-01');
insert into `Order` (`custId`, `bookId`, `salePrice`, `OrderDate`) value (1, 3, 21000, '2014-07-03');
insert into `Order` (`custId`, `bookId`, `salePrice`, `OrderDate`) value (2, 5, 8000, '2014-07-03');
insert into `Order` (`custId`, `bookId`, `salePrice`, `OrderDate`) value (3, 6, 6000, '2014-07-04');
insert into `Order` (`custId`, `bookId`, `salePrice`, `OrderDate`) value (4, 7, 20000, '2014-07-05');
insert into `Order` (`custId`, `bookId`, `salePrice`, `OrderDate`) value (1, 2, 12000, '2014-07-07');
insert into `Order` (`custId`, `bookId`, `salePrice`, `OrderDate`) value (4, 8, 13000, '2014-07-07');
insert into `Order` (`custId`, `bookId`, `salePrice`, `OrderDate`) value (3, 10, 12000, '2014-07-08');
insert into `Order` (`custId`, `bookId`, `salePrice`, `OrderDate`) value (2, 10, 7000, '2014-07-09');
insert into `Order` (`custId`, `bookId`, `salePrice`, `OrderDate`) value (3, 8, 13000, '2014-07-10');



#실습 5-4
select `custId`, `name`, `adress` from `Customer`;

#실습 5-5
select `bookName`,`price` FROM `Book`;

#실습 5-6
select `price`, `bookName` FROM `Book`;

#실습 5-7
SELECT * FROM `Book`;

#실습 5-8
select `publisher` from `Book`;

#실습 5-9
SELECT * FROM `Book` WHERE `price` >= 20000 ;

#실습 5-10
select * from `Book` where `price` >= 20000;

#실습 5-11
select * from `Book` where `price` < 20000;

#실습 5-12
select * from `Book` where `price` between 10000 and 20000;

#실습 5-13
SELECT * FROM `Book` WHERE MOD(`bookId`, 2) = 0;

#실습 5-14
select * from `Book` where `bookID` in (2, 3, 5);

#실습 5-15
SELECT * FROM `Customer` where `adress` like '%대한민국%';

#실습 5-16
SELECT * FROM `Customer` WHERE `name` LIKE '박%';

#실습 5-17
SELECT * FROM `Customer` WHERE `adress` LIKE '대한민국%';
#실습 5-18
SELECT * FROM `Customer` WHERE `phone` IS NOT NULL;


#실습 5-19
SELECT `publisher` FROM `Book` where `bookName` like '%축구%';

#실습 5-20
select `publisher` from `Book` where `bookName` = '축구의 역사';

#실습 5-21
SELECT `publisher` FROM `Book` where `bookName` like '%축구%';


#실습 5-22
select * from `Book` where `bookname` like '_구%';

#실습 5-23
SELECT * FROM `Book` where `bookName` like '%축구%' and `price` >= 20000;

#실습 5-24
SELECT * FROM `Book` ORDER BY `bookname` ASC;

#실습 5-25

#실습 5-26 
SELECT *
FROM Book
ORDER BY price DESC, publisher ASC;

#실습 5-27
SELECT * FROM `Book` order BY `price` DESC LIMIT 3;
#실습 5-28
select * from Book ORDER BY price ASC limit 3;

#실습 5-29
SELECT SUM(`salePrice`) AS `총판매액` FROM `Order`;

#실습 5-30
SELECT
 SUM(saleprice),
 AVG(saleprice),
 MIN(saleprice),
 MAX(saleprice) 
 FROM `Order`;


#실습 5-31
SELECT COUNT(*) AS `판매건수` FROM `Order`;

#실습 5-32
SELECT bookid, 
REPLACE(bookname, '야구', '농구') 
AS bookname, 
 publisher,
 price
FROM Book;




#실습 5-33
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
select 
	`custId`,
    count(*) as `수량`
from `order` 
where `salePrice` >= 8000
group by `custId`
having `수량` >= 2;
	
#실습 5-34
SELECT * FROM `Customer` AS a 
JOIN `Order` AS b  ON a.custId = b.custId;

SELECT * FROM `Customer` JOIN `Order` USING(`custId`);

SELECT * FROM `Customer` a, `Order` b 
	WHERE a.custId = b.custId;


#실습 5-35
SELECT * FROM `Customer` AS a 
JOIN `Order` AS b  ON a.custId = b.custId
order BY a.`custId`;

#실습 5-36
SELECT
	`name`,
	`salePrice`
FROM `Customer` AS a 
JOIN `Order` AS b  ON a.custId = b.custId;

#실습 5-37
SELECT
	`name`,
	SUM(`salePrice`)
FROM `Customer` AS a 
JOIN `Order` AS b  ON a.custId = b.custId
group by `name`
order by `name`;


#실습 5-38
SELECT 
	`name`,
	`bookName`
FROM `Customer` AS a 
JOIN `Order` AS b ON a.custId = b.custId
JOIN `Book` AS c ON b.bookId = c.bookId;

#실습 5-39
SELECT 
	`name`,
	`bookName`
FROM `Customer` AS a 
JOIN `Order` AS b ON a.custId = b.custId
JOIN `Book` AS c ON b.bookId = c.bookId
where `salePrice`=20000;

#실습 5-40
SELECT 
	`name`,
    `salePrice`
FROM `Customer` AS a 
left JOIN `Order` AS b ON a.custId = b.custId;

#실습 5-41
SELECT 
	SUM(`salePrice`) AS `총매출`
FROM `Customer` AS a
JOIN `Order` AS b ON a.custId = b.custId
WHERE `name`='김연아';

SELECT 
	SUM(`salePrice`) AS `총매출`
FROM `Order`
WHERE `custId`=(SELECT `custId` FROM `Customer` WHERE `name`='김연아');


#실습 5-42
SELECT `bookName` FROM `Book` ORDER BY `price` DESC LIMIT 1;
SELECT `bookName` FROM `Book` WHERE `price`=(SELECT MAX(`price`) FROM `Book`);

#실습 5-43
SELECT `name` FROM `Customer` AS a 
LEFT JOIN `Order` AS b ON a.custId = b.custId
WHERE `orderId` IS NULL;

#실습 5-44
INSERT INTO `Book` SET
					`bookId` = 11,
					`bookName` = '스포츠의학',
					`publisher` = '한솔의학서적';

#실습 5-45
UPDATE `Customer` SET `address`='대한민국 부산' WHERE `custId`=5;

#실습 5-46
DELETE FROM `Customer` WHERE `custId`=5;