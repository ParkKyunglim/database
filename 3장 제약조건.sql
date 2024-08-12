#날짜 : 2024/07/02
#이름 : 박경림
#내용 : 3장 제약조건

#실습 3-1



CREATE TABLE `User2`(
`uid` VARCHAR(10) PRIMARY KEY,
`name` VARCHAR(10),
`birth` CHAR(10),
`hp` char(13),
`addr` VARCHAR(50)
);

#실습 3-2. User2 데이터 추가하기
insert into user2 values ('A101', '김유신', '1968-05-09', '010-1234-1001', '경남 김해시');
insert into user2 values ('a102', '김춘추', '1972-11-23', '010-1234-1002', '경남 경주시');
insert into user2 values ('A103', '장보고', '1978-03-01', '010-1234-1003', '전남 완도군');
insert into user2 values ('A105', '강감찬', '1979-08-16', '010-1234-1004', '서울시 관악구');
insert into user2 values ('A106', '이순신', '1981-05-23', '010-1234-1005', '부산시 진구');

#실습 3-3
CREATE TABLE `User3` (
`uid` VARCHAR(10) PRIMARY KEY,
`name` VARCHAR(10),
`birth` CHAR(10),
`hp` CHAR(13) UNIQUE,
`addr` VARCHAR(50)
);
    
#실습 3-4
insert into user3 values('A101', '김유신', '1968-05-09', '010-1234-1111', '경남 김해시');
insert into user3 values ('a102', '김춘추', '1972-11-23', '010-1234-2222', '경남 경주시');
insert into user3 values ('A103', '장보고', '1978-03-01', '010-1234-3333', '전남 완도군');
insert into user3 values ('A104', '강감찬', '1979-08-16', '010-1234-4444', '서울시 관악구');
insert into user3 values ('A105', '이순신', '1981-05-23', '010-1234-5555', '부산시 진구');
insert into user3 values ('A106', '정약용', '1981-05-23', null, '부산시 진구');

#실습 3-5
CREATE TABLE `Parent` (
`pid`   VARCHAR(10) PRIMARY KEY,
`name`  VARCHAR(10),
`birth` CHAR(10),
`addr`  VARCHAR(100)
);

drop table `Parent`;

CREATE TABLE `Child` (
`cid` VARCHAR(10) PRIMARY KEY,
`name` VARCHAR(10),
`hp` CHAR(13) UNIQUE,
`parent` VARCHAR(10),
FOREIGN KEY (`parent`) REFERENCES `Parent` (`pid`)
);


#실습 3-6
INSERT INTO `Parent` values ('P101', '김유신', '1968-05-09', '경남 김해시');
insert into `Parent` values ('P102', '김춘추', '1972-11-23', '경남 경주시');
insert into `Parent` values ('P103', '장보고', '1978-03-01', '전남 완도군');
insert into `Parent` values ('P104', '강감찬', '1979-08-16', '서울시 관악구');
insert into `Parent` values ('P105', '이순신', '1981-05-23', '부산시 진구');

insert into `Child` values ('C101', '김철수', '010-1234-1001', 'P101');
insert into `Child` values ('C102', '김영희', '010-1234-1002', 'P101');
insert into `Child` values ('C103', '강철수', '010-1234-1003', 'P103');
insert into `Child` values ('C104', '이철수', '010-1234-1004', 'P105');
insert into `Child` values ('C105', '최철수', '010-1234-1005', 'P107'); # Parent 테이블에 pid P107이 없기 때문에 Insert


#실습 3-7
CREATE TABLE `User4` (
`uid`   VARCHAR(10) PRIMARY KEY,
`name`  VARCHAR(10) NOT NULL,
`gender`CHAR(1),
`age` INT DEFAULT 1,
`hp` CHAR(13) UNIQUE,
`addr` VARCHAR(20)
);

#실습 3-8

insert into `User4` values ('A101', '김유신', 'M', 25, '010-1234-1111', '경남 김해시');
insert into `User4` values ('A102', '김춘추', 'M', 23, '010-1234-2222', '경남 경주시');
insert into `User4` values ('A103', '장보고', 'M', 35, '010-1234-3333', '전남 완도시');
insert into `User4` values ('A104', '강감찬', 'M', 42, '010-1234-4444', '서울시 관악구');
insert into `User4` values ('A105', 'NULL', 'M', 'NULL', '010-1234-5555', '부산시 진구');
insert into `User4` values ('A106', '신사임당', F, 32, 'NULL', '강릉시');
insert into `User4` values ('A107', '허난설헌', F, 27, 'NULL', '경기도 광주시');

#실습 3-9
CREATE TABLE `User5` (
`seq` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(10) NOT NULL,
`gender` CHAR(1) CHECK (`gender` IN ('M', 'F')),
`age` INT DEFAULT 1 CHECK (`age` > 0 AND `age` < 100),
`addr` VARCHAR(20)
);

#실습 3-10
insert into `User5` values ('1', '김유신', 'M', 25 , '경남 김해시');
insert into `User5` values ('2', '김춘추', 'M', 23 , '경남 경주시');
insert into `User5` values ('3', '장보고', 'M', 35 , '전남 완도시');
insert into `User5` values ('4', '강감찬', 'M', 42 , '서울시 관악구');
insert into `User5` values ('5', '이순신', 'A', 51 , '부산시');
insert into `User5` values ('6', '신사임당', 'F', -1 , '강릉시');

select * from `User5`;








