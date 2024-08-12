#실습 4-1
CREATE DATABASE `Theater`;
CREATE USER 'theater'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON Theater.* TO 'theater'@'%';
FLUSH PRIVILEGES;

#실습 4-2
create table `Movies` (
	`movie_id` int AUTO_INCREMENT primary key,
    `title` varchar(30) not null,
    `genre` varchar(10) not null,
    `release_date` date not null
    );

CREATE TABLE `Customers` (
	`customer_id`		int     AUTO_INCREMENT	PRIMARY KEY,
	`name`    			VARCHAR(20) 	NOT NULL,
	`email`				VARCHAR(50)  	NOT NULL,
	`phone`   			VARCHAR(13)		NOT NULL
);

CREATE TABLE `Bookings` (
	`booking_id`		int  	PRIMARY KEY,
	`customer_id`    	int 	NOT NULL,
	`movie_id`			int  	NOT NULL,
	`num_tickets`   	int		NOT NULL,
    `booking_date`		DATETIME NOT NULL
);

#실습 4-3
insert into `Movies`(`title`, `genre`, `release_date`) values ('쇼생크의 탈출', '드라마', '1994-10-14');
insert into `Movies`(`title`, `genre`, `release_date`) values ('타이타닉', '로맨스', '1997-03-24');
insert into `Movies`(`title`, `genre`, `release_date`) values ('탑건', '액션', '1987-07-16');
insert into `Movies`(`title`, `genre`, `release_date`) values ('쥬라기공원', '액션', '1994-02-11');
insert into `Movies`(`title`, `genre`, `release_date`) values ('글래디에이터', '액션', '2000-05-03');
insert into `Movies`(`title`, `genre`, `release_date`) values ('시네마천국', '드라마', '1995-04-12');
insert into `Movies`(`title`, `genre`, `release_date`) values ('미션임파서블', '액션', '1995-11-11');
insert into `Movies`(`title`, `genre`, `release_date`) values ('노트북', '로맨스', '2003-08-23');
insert into `Movies`(`title`, `genre`, `release_date`) values ('인터스텔라', 'SF', '2011-05-26');
insert into `Movies`(`title`, `genre`, `release_date`) values ('아바타', 'SF', '2010-02-10');



INSERT INTO `Customers`(`name`, `email`, `phone`) VALUES ('김유신', 'kys@example.com', '010-1234-1001');
INSERT INTO `Customers`(`name`, `email`, `phone`) VALUES ('김춘추', 'kcc@example.com', '010-1234-1002');
INSERT INTO `Customers`(`name`, `email`, `phone`) VALUES ('장보고', 'jbg@example.com', '010-1234-1003');
INSERT INTO `Customers`(`name`, `email`, `phone`) VALUES ('강감찬', 'kgc@example.com', '010-1234-1004');
INSERT INTO `Customers`(`name`, `email`, `phone`) VALUES ('이순신', 'lss@example.com', '010-1234-1005');

INSERT INTO `Bookings` VALUES (101, 1, 1, 2, '2023-01-10 00:00:00');
INSERT INTO `Bookings` VALUES (102, 2, 2, 3, '2023-01-11 00:00:00');
INSERT INTO `Bookings` VALUES (103, 3, 2, 2, '2023-01-13 00:00:00');
INSERT INTO `Bookings` VALUES (104, 4, 3, 1, '2023-01-17 00:00:00');
INSERT INTO `Bookings` VALUES (105, 5, 5, 2, '2023-01-21 00:00:00');
INSERT INTO `Bookings` VALUES (106, 3, 8, 2, '2023-01-21 00:00:00');
INSERT INTO `Bookings` VALUES (107, 1, 10, 4, '2023-01-21 00:00:00');
INSERT INTO `Bookings` VALUES (108, 2, 9, 1, '2023-01-22 00:00:00');
INSERT INTO `Bookings` VALUES (109, 5, 7, 2, '2023-01-23 00:00:00');
INSERT INTO `Bookings` VALUES (110, 3, 4, 2, '2023-01-23 00:00:00');
INSERT INTO `Bookings` VALUES (111, 1, 6, 1, '2023-01-24 00:00:00');
INSERT INTO `Bookings` VALUES (112, 3, 5, 3, '2023-01-25 00:00:00');

drop table `Bookings`;

#실습 4-4
select title from `Movies`;

#실습 4-5
select * from `Movies` where `genre`='로맨스';


#실습 4-6. 개봉일이 2010년 이후인 모든 영화의 제목과 개봉일을 조회하시오. 
SELECT
title,
release_date
FROM Movies WHERE release_date > '2010-01-01';

#실습 4-7
SELECT
booking_id, booking_date
FROM Bookings WHERE `num_tickets` >= 3;

#실습 4-8
select * from `Bookings` where `booking_date` <= '2023-01-20';


#실습 4-9
SELECT * FROM Movies WHERE release_date between '1990-01-01' AND '1999-12-31';


#실습 4-10
SELECT * FROM Bookings
ORDER BY booking_date DESC
limit 3;

#실습 4-11
SELECT title, release_date FROM Movies
ORDER BY release_date ASC
limit 1;

select * from `Movies`;
#실습 4-12  
SELECT
CONCAT(title, ' - ', release_date) AS movie_info
FROM Movies
WHERE `title` LIKE '%공원%'
ORDER BY release_date ASC
LIMIT 1;

#실습 4-13
SELECT booking_date, title
FROM Bookings
JOIN Movies
USING (movie_id)
WHERE customer_id = 2;


#실습 4-14
select
`name`,`phone`, `booking_date`, `title`
FROM bookings B
JOIN Customers C ON B.customer_id = C.customer_id
JOIN Movies M ON B.movie_id = M.movie_id;


SELECT
C.name,
C.phone,
B.booking_date,
M.title
FROM bookings B
JOIN Customers C ON B.customer_id = C.customer_id
JOIN Movies M ON B.movie_id = M.movie_id;


#실습 4-15 장르별로 평균 예매 티켓 수를 조회하시오. >
SELECT
M.genre,
AVG(B.num_tickets) AS avg_tickets
FROM bookings B
JOIN Movies M ON B.movie_id = M.movie_id
GROUP BY M.genre;


#실습 4-16
SELECT
C.name,
AVG(B.num_tickets) AS avg_tickets
FROM Bookings B
JOIN Customers C ON B.customer_id = C.customer_id
GROUP BY C.name;


#실습 4-17☞ 실습 4-17. 고객별 전체 예매 티켓 수가 가장 많은 고객순으로 이름과, 전체 티켓 수를 조회하시오. > 
SELECT
C.name,
SUM(B.num_tickets) AS `전체 예매 티켓 수`
FROM bookings B
JOIN Customers C ON B.customer_id = C.customer_id
GROUP BY C.customer_id
ORDER BY `전체 예매 티켓 수` DESC;



#실습 4-18 예매일자가 가장 오래된 애매번호, 영화번호, 고객이름, 예매일을 조회하시오.  
SELECT
B.booking_id,
B.movie_id,
C.name,
B.booking_date
FROM Bookings B
JOIN Customers C ON B.customer_id = C.customer_id
ORDER BY B.booking_date ASC
LIMIT 1;
#실습 4-19각 영화의 장르별로 개봉일이 가장 최근인 영화의 제목을 조회하시오
SELECT
genre, title, release_date
FROM Movies
WHERE (genre, release_date) IN (
SELECT genre, MAX(release_date)
FROM Movies
GROUP BY genre
);

#실습 4-20 ‘김유신’ 고객이 예매한 모든 영화정보를 조회하시오. 
SELECT * FROM Movies
WHERE movie_id IN (
SELECT movie_id FROM Bookings
WHERE customer_id = (SELECT customer_id FROM Customers WHERE name = '김유신')
);

#실습 4-21 예매한 영화 중 가장 많은 티켓을 예매한 고객의 이름과 이메일 조회하시오 
SELECT name, email FROM Customers
WHERE customer_id = (
SELECT customer_id
FROM Bookings
GROUP BY customer_id
ORDER BY SUM(num_tickets) DESC
LIMIT 1
);

#실습 4-22 예약된 티켓 수가 평균 예매 티켓 수보다 많은 예매정보를 조회하시오. > 
SELECT * FROM bookings
WHERE num_tickets > (SELECT AVG(num_tickets) FROM Bookings);

#실습 4-23실습 4-23. 각 영화별로 예매된 총 티켓 수를 조회하시오. >
SELECT
M.title, SUM(B.num_tickets) AS total_tickets
FROM Bookings B
JOIN Movies M ON B.movie_id = M.movie_id
GROUP BY M.title;


#실습 4-24 각 고객별로 예매한 총 티켓 수와 평균 티켓 수를 조회하시오. 
SELECT
c.name,
SUM(b.num_tickets) AS total_tickets,
AVG(b.num_tickets) AS avg_tickets
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
GROUP BY c.name;
#실습 4-25
SELECT
c.customer_id,
c.name,
c.email,
SUM(b.num_tickets) AS `예매 티켓수`
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY `예매 티켓수` DESC;

#실습 4-26
SELECT
c.name,
m.title,
b.num_tickets,
b.booking_date
FROM bookings b
JOIN customers c ON b.customer_id = c.customer_id
JOIN movies m ON b.movie_id = m.movie_id
ORDER BY num_tickets DESC;

#실습 4-27 (문제 수정: 마지막 limit 1; 제거)
SELECT
	M.title,
	M.genre,
	SUM(B.num_tickets) AS `예매 티켓 수`,
	AVG(B.num_tickets) AS `평균 티켓 수`
FROM bookings B
JOIN Movies M ON B.movie_id = M.movie_id
WHERE M.genre = '액션'
GROUP BY M.title
ORDER BY `평균 티켓 수` DESC;

#실습 4-28. 
SELECT
B.customer_id,
C.name,
SUM(`num_tickets`) AS `ticket_total`
FROM bookings B
JOIN Customers C ON B.customer_id = C.customer_id
GROUP BY B.customer_id
ORDER BY ticket_total DESC;

#4-29.
 SELECT
B.booking_id,
B.customer_id,
B.movie_id,
MaxTickets.max_tickets
FROM Bookings B
JOIN (
SELECT movie_id, MAX(num_tickets) AS max_tickets
FROM Bookings
GROUP BY movie_id
) AS MaxTickets
ON B.movie_id = MaxTickets.movie_id AND B.num_tickets = MaxTickets.max_tickets;

#4-30. 

SELECT
B.booking_id,
B.customer_id,
C.name,
M.title,
M.genre,
SUM(B.num_tickets) AS `예매 티켓 수`
FROM bookings B
JOIN movies M ON B.movie_id = M.movie_id
JOIN customers C ON B.customer_id = C.customer_id
GROUP BY M.title
HAVING `예매 티켓 수` = (
SELECT MAX(total_tickets)
FROM (
SELECT SUM(B2.num_tickets) AS total_tickets
FROM Bookings B2
JOIN Movies M2 ON B2.movie_id = M2.movie_id
WHERE M2.genre = M.genre
GROUP BY M2.title
) AS SelectMAX
)
ORDER BY `예매 티켓 수` DESC;