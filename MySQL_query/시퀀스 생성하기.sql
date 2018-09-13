-- 출처
-- https://blog.naver.com/harksoo1974/220113908761




-- 시퀀스 테이블 생성 (변경하는것 없이 그대로 실행)
CREATE TABLE sequences ( name varchar(32), currval BIGINT UNSIGNED ) ENGINE=InnoDB;
 

-- 시퀀스 프로시저 생성(변경하는것 없이 그대로 실행)
DELIMITER $$
CREATE PROCEDURE `create_sequence`(IN the_name text)
MODIFIES SQL DATA
DETERMINISTIC
BEGIN
    DELETE FROM sequences WHERE name=the_name;
    INSERT INTO sequences VALUES (the_name, 0);
END;


-- 3. nextval function 생성(변경하는것 없이 그대로 실행)
 DELIMITER $$ 
 CREATE FUNCTION `nextSeqVal`(the_name varchar(32))
 RETURNS BIGINT UNSIGNED
 MODIFIES SQL DATA
 DETERMINISTIC
 BEGIN
     DECLARE ret BIGINT UNSIGNED;
     UPDATE sequences SET currval=currval+1 WHERE name=the_name;
     SELECT currval INTO ret FROM sequences WHERE name=the_name limit 1;
     RETURN ret;
 END;


-- 4. 시퀀스명 입력 및 0값 넣기 ('Statistics_seq' 대신 원하는 시퀀스 명을 넣을 것)
INSERT INTO sequences VALUES ('Statistics_seq', 0);

CALL `EBLOCK`.`create_sequence`('Statistics_seq');

-- 5. nextval 값 가져오기 ('Statistics_seq' 대신 생성한 시퀀스 명을 넣을 것)
select nextval('Statistics_seq') as Statistics_seq from dual;


 

-- * 시퀀스를 하나 생성한 후 추가로 시퀀스를 생성할 시 3번부터 진행하시면 됩니다.
-- [출처] [MySql] 시퀀스(sequence) 생성 방법|작성자 이쁜우리




-- 현재 시퀀스번호를 알려주는 펑션

 DELIMITER $$ 
CREATE FUNCTION `currSeqVal`(the_name varchar(32))
 RETURNS BIGINT UNSIGNED
 MODIFIES SQL DATA
 DETERMINISTIC
BEGIN
     DECLARE ret BIGINT UNSIGNED;
     SELECT currval INTO ret FROM sequences WHERE name=the_name limit 1;
     RETURN ret;
 END