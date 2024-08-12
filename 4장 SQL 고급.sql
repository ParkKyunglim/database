#날짜 : 2024/07/03
#이름 : 박경림
#내용 : 4장 SQL 고급

#실습 4-1
CREATE TABLE `Member` (
`uid`   VARCHAR(10) PRIMARY KEY,
`name`  VARCHAR(10) NOT NULL,
`hp`    CHAR(13) UNIQUE NOT NULL,
`pos`   VARCHAR(10) default '사원',
`dep`   TINYINT,
`rdate` DATETIME NOT NULL
);



CREATE TABLE `Department` (
`depNo` TINYINT PRIMARY KEY,
`name` VARCHAR(10) NOT NULL,
`tel` CHAR(12) NOT NULL
);


CREATE TABLE `Sales` (
`no`  INT AUTO_INCREMENT PRIMARY KEY,
`uid` VARCHAR(10) NOT NULL,
`year` YEAR  NOT NULL,
`month` TINYINT NOT NULL,
`sale` INT
);

select * from `Sales`;

#실습 4-2
INSERT INTO `Member` VALUES ('a101', '박혁거세', '010-1234-1001', '부장', '101', now());
INSERT INTO `Member` VALUES ('a102', '김유신', '010-1234-1002', '차장', '101', now());
INSERT INTO `Member` VALUES ('a103', '김춘추', '010-1234-1003', '사원', '101', now());
INSERT INTO `Member` VALUES ('a104', '장보고', '010-1234-1004', '대리', '102', now());
INSERT INTO `Member` VALUES ('a105', '강감찬', '010-1234-1005', '과장', '102', now());
INSERT INTO `Member` VALUES ('a106', '이성계', '010-1234-1006', '차장', '103', now());
INSERT INTO `Member` VALUES ('a107', '정철', '010-1234-1007', '차장', '103', now());
INSERT INTO `Member` VALUES ('a108', '이순신', '010-1234-1008', '부장', '104', now());
INSERT INTO `Member` VALUES ('a109', '허균', '010-1234-1009', '부장', '104', now());
INSERT INTO `Member` VALUES ('a110', '정약용', '010-1234-1010', '사원', '105', now());
INSERT INTO `Member` VALUES ('a111', '박지원', '010-1234-1011', '사원', '102', now());

INSERT INTO `Department` VALUES (101, '영업1부', '051-512-1001');
INSERT INTO `Department` VALUES (102, '영업1부', '051-512-1001');
INSERT INTO `Department` VALUES (103, '영업1부', '051-512-1001');

INSERT INTO `Department` VALUES (104, '영업1부', '051-512-1001');
INSERT INTO `Department` VALUES (105, '영업1부', '051-512-1001');
INSERT INTO `Department` VALUES (106, '영업1부', '051-512-1001');
INSERT INTO `Department` VALUES (107, '영업1부', '051-512-1001');

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 1,  98100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 1, 136000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 1,  80100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2018, 1,  78000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 1,  93000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 2,  23500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 2, 126000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 2,  18500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 2,  19000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2018, 2,  53000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2019, 1,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 1, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 1, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 1,  53500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2019, 1,  24000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 2,  43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2019, 2,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2019, 2, 109000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 1,  63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 1,  74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2020, 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2020, 1, 111000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2020, 2,  93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 2,  84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a108', 2020, 2,  76000);

#실습 4-3
select * from `Member` where `name`='김유신';
select * from `Member` where `pos`='차장' AND dep=101;
select * from `Member` where `pos`='차장' OR dep=101;
select * from `Member` where `name` != '김춘추';
select * from `Member` where `name` <> '김춘추';
select * from `Member` where `pos`='사원' OR `pos`='대리';
select * from `Member` where `dep` IN(101, 102, 103);
select * from `Member` where `name` LIKE '%신';
select * from `Member` where `name` LIKE '김%';
select * from `Member` where `name` LIKE '김__';
select * from `Member` where `name` LIKE '_성_';
select * from `Member` where `name` LIKE '정_';
SELECT * FROM `Sales` WHERE `sale` > 50000;
SELECT * FROM `Sales` WHERE `sale` >= 50000 AND `sale` < 100000 AND `month`=1;
SELECT * FROM `Sales` WHERE `sale` BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `sale` NOT BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `year` IN(2020);
SELECT * FROM `Sales` WHERE `month` IN(1, 2);

#실습 4-4
select * from `Sales`;
select * from `Sales` ORDER BY `sale` ASC;
select * from `Sales` ORDER BY `sale` DESC;
select * from `Member` ORDER BY `name`;
SELECT * FROM `Member` ORDER BY `name` DESC;
SELECT * FROM `Member` ORDER BY `rdate` ASC;
SELECT * FROM `Sales` WHERE `sale` > 50000 ORDER BY `sale` DESC;
SELECT * FROM `Sales`
WHERE `sale` > 50000
ORDER BY `year`, `month`, `sale` DESC;


#실습 4-5
SELECT * FROM Sales LIMIT 3;
SELECT * FROM Sales LIMIT 0, 3;
SELECT * FROM Sales LIMIT 1, 2;
SELECT * FROM Sales LIMIT 5, 3;
SELECT * FROM Sales ORDER BY `sale` DESC LIMIT 3, 5;
SELECT * FROM Sales ORDER BY `sale` DESC LIMIT 10;

SELECT * FROM Sales WHERE `sale` < 50000 ORDER BY `sale` DESC LIMIT 3;
SELECT * FROM Sales
WHERE `sale` > 50000
ORDER BY `year` DESC, `month`, `sale` DESC
LIMIT 5;


#실습 4-6
select sum(`sale`) AS `합계` FROM `Sales`;
SELECT AVG(sale) AS `평균` FROM `Sales`;
SELECT MAX(sale) AS `최대값` FROM `Sales`;
SELECT MIN(sale) AS `최소값` FROM `Sales`;

SELECT CEILING(1.2);
SELECT CEILING(1.8);
SELECT FLOOR(1.2);
SELECT FLOOR(1.8);
SELECT ROUND(1.2);
SELECT ROUND(1.8);
SELECT RAND();
SELECT CEILING(RAND() * 10);
SELECT COUNT(sale) AS `갯수` FROM `Sales`;
select COUNT(*) as `갯수` from `Sales`;

SELECT LEFT('HelloWorld', 5);
SELECT RIGHT('HelloWorld', 5);
SELECT SUBSTRING('HelloWorld', 6, 5);
SELECT CONCAT('Hello', 'World');
SELECT CONCAT(`uid`, `name`, `hp`) FROM `member` WHERE `uid`='a108';
SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();
INSERT INTO `Member` VALUES ('a112', '유관순', '010-1234-1012', '대리', 107, NOW());

#실습 4-7 2018년 1월 매출의 총합을 구하시오.
select sum(`sale`) AS '2018년 1월 매출의 총합'
from `Sales` 
where `year`=2018 
and `month`=1;


#실습 4-8 2019년 2월에 5만원 이상 매출에 대한 총합과 평균을 구하시오.
select
	SUM(sale) as '총합',
    AVG(sale) AS '평균'
FROM `Sales`
WHERE`year` = '2019' and 
    `month` = '2' and 
    `sale` >= 50000;

 select sum(sale) as '2019년 2월에 5만원 이상 매출' , round(avg(sale)) as '2019년 2월에 5만원 이상 평균 매출' 
   from sales
  where `year` = '2019'
    and month = '2'
    and sale >= 50000;

#실습 4-9 2020년 전체 매출 가운데 최저, 최고 매출을 구하시오
select 
	max(sale) as '최고매출',
    min(sale) as '최저매출' 
from `sales`
where `year` = '2020';

 select max(sale) as '최고매출', min(sale) as '최저매출' from sales
 where `year` = '2020';
 
select * from `member`;
select * from `department`;
select * from `sales`;
SHOW TABLES;

#실습 4-10
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

SELECT * FROM `Sales` GROUP BY `uid`;
SELECT * FROM `Sales` GROUP BY `year`;
SELECT * FROM `Sales` GROUP BY `uid`, `year`;


SELECT COUNT(*) AS `건수` FROM `Sales` GROUP BY `uid`;
SELECT `uid`, SUM(sale) AS `합계` FROM `Sales` GROUP BY `uid`;
SELECT `uid`, AVG(sale) AS `평균` FROM `Sales` GROUP BY `uid`;

SELECT `uid`, `year`, SUM(sale) AS `합계`
FROM `Sales`
GROUP BY `uid`, `year`;

SELECT `uid`, `year`, SUM(sale) AS `합계`
FROM `Sales`
GROUP BY `uid`, `year`
ORDER BY `year` ASC, `합계` DESC;

SELECT `uid`, `year`, SUM(sale) AS `합계`
FROM `Sales`
WHERE `sale` >= 50000
GROUP BY `uid`, `year`
ORDER BY `합계` DESC;

#실습 4-11
SELECT `uid`, SUM(sale) AS `합계` 
FROM `Sales`
GROUP BY `uid`
HAVING `합계` >= 200000;

SELECT `uid`, `year`, SUM(sale) AS `합계`
FROM `Sales`
WHERE `sale` >= 100000
GROUP BY `uid`, `year`
HAVING `합계` >= 200000
ORDER BY `합계` DESC;

#실습 4-12
CREATE TABLE `Sales2` LIKE `Sales`; # 테이블 복사
INSERT INTO `Sales2` SELECT * FROM `Sales`; # 데이터 복사

set sql_safe_updates=0; # 조건 없이 update 실행
UPDATE `Sales2` SET `year` = `year` + 3;


SELECT * FROM `Sales` UNION SELECT * FROM `Sales2`;

SELECT * FROM `Sales` WHERE `sale` >= 100000
UNION
SELECT * FROM `Sales2` WHERE `sale` >= 100000;

SELECT `uid`, `year`, `sale` FROM Sales
UNION
SELECT `uid`, `year`, `sale` FROM Sales2;

SELECT `uid`, `year`, SUM(sale) AS `합계`
FROM `Sales`
GROUP BY `uid`, `year`
UNION
SELECT `uid`, `year`, SUM(sale) AS `합계`
FROM `Sales2`
GROUP BY `uid`, `year`
ORDER BY `year` ASC, `합계` DESC;


#실습 4-13
select * FROM `sales` 
INNER JOIN `Member` ON `Sales`.`uid` = `Member`.`uid`;

SELECT * FROM `Sales` as a
join `Member` as b
on a.uid = b.uid;
SELECT * FROM `Member` as a
join `Department` as b
on a.dep = b.depNo;

SELECT * FROM `Sales` as a,`Member` as b WHERE a.uid = b.uid;
SELECT * FROM `Member` AS a, `Department` AS b WHERE a.dep = b.depNo;

select 
	a.`no`, 
    a.`uid`, 
    `sale`, 
    `name`, 
    `pos`, 
FROM `Sales` as a
join `Member` as b 
ON a.`uid` = b.`uid`;

select a.`no`,a.`uid`, `sale`, `name`, `pos`, FROM `Sales` as a
join `Member` as b USING (uid);


SELECT 
a.`no`
a.`uid`, 
a.`sale`, 
c.`name`, 
b.`pos`, 
c.`name`
 FROM `Sales` AS a
 JOIN `Member` AS b ON a.uid = b.uid
 JOIN `Department` AS c ON b.dep = c.depNo
 WHERE `sale` > 100000
 ORDER BY `sale` DESC;


SELECT 
a.`no`, 
a.`uid`, 
a.`sale`, 
b.`name`, 
b.`pos`, 
c.`name` 
FROM `Sales` AS a
 JOIN `Member` AS b ON a.uid = b.uid
 JOIN `Department` AS c ON b.dep = c.depNo
 WHERE `sale` > 100000
 ORDER BY `sale` DESC;


#실습 4-14
SELECT * FROM `Sales` AS a 
LEFT JOIN `Member` AS b 
ON a.uid = b.uid;

select * from `Sales` as a
RIGHT join `Member` AS b
ON a.`uid` = b.`uid`;

SELECT a.`no`, a.uid, `sale`, `name`, `pos` FROM Sales AS a
 RIGHT JOIN Member AS b USING(uid); 


#실습 4-15 모든 직원의 아이디, 이름, 직급, 부서명을 조회하시오.

select 
	`uid`,
	a.`name` as `직원명`,
	`pos`,
	b.`name` as `부서명`
from `member` as a
join `department` as b
on a.dep = b.depNo;


#실습 4-16 '김유신' 직원의 2019년도 매출의 합을 조회하시오.

SELECT 
    a.`uid`, `name`, SUM(`sale`) AS 2019년도 매출합
FROM
    Sales AS a
        JOIN
    member AS b ON a.uid = b.uid
WHERE
    year = 2019 AND name = '김유신';



#실습 4-17 2019년 50,000이상 매출에 대해 직원별 매출의 합이 100,000원 이상인 직원이름, 부서명, 직급, 년도, 매출 합을 조회하시오. 단, 매출 합이 큰 순서부터 정렬
select	
	b.`name`,
    c.`name`,
    `pos`,
    `year`,
	SUM(`sale`) as `합계` 
from `Sales` as a
join `member` as b on a.uid = b.uid
join `department` as c on b.dep = c.depNo
where `year`=2019 and `sale` >= 50000
group by a.`uid`
having `합계` >= 100000
order by `합계` desc
limit 2;


