#날짜 : 2024/07/19
#이름 : 박경림
#내용 : 8장 트랜잭션 실습하기




#실습 8-1
SET AUTOCOMMIT = 0;
SELECT @@AUTOCOMMIT;

update `bank_account` set `a_balance` = 100000 WHERE `a_no` = '101-11-1001';



start transaction; -- 트랜잭션 시작

select * from `bank_account`;

update `bank_account` set `a_balance` = `a_balance` - 10000
						WHERE `a_no` = '101-11-1001';

UPDATE `bank_account` SET `a_balance` = `a_balance` + 10000
						WHERE `a_no` = '101-11-1212';
                        
COMMIT; -- 작업 확정 (트랜잭션 종료)
SELECT * FROM `bank_account`;

#실습 8-2

update `bank_account` set `a_balance` = 100000 WHERE `a_no` = '101-11-1001';
SELECT * FROM `bank_account`;

start transaction; -- 트랜잭션 시작

select * from `bank_account`;
update `bank_account` set `a_balance` = `a_balance` - 10000
						WHERE `a_no` = '101-11-1001';

UPDATE `bank_account` SET `a_balance` = `a_balance` + 10000
						WHERE `a_no` = '101-11-1212';
                        
COMMIT; -- 작업 확정 (트랜잭션 종료)
SELECT * FROM `bank_account`;



