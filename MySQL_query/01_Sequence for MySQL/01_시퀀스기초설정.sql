/*
	@Title	: Sequence on MySQL [ Author-Jeongryeol Lee ]
	@Info	: 시퀀스기능을 위한 프로시저와 펑션 세팅하기
*/

-- 1. 시퀀스를 담는 테이블 생성
CREATE TABLE sequences (NAME VARCHAR(32), currval BIGINT UNSIGNED)  ENGINE=INNODB;

 
 
-- 2. 시퀀스 프로시저 생성(변경하는것 없이 그대로 실행)
DELIMITER $$

USE `EBLOCK`$$

DROP PROCEDURE IF EXISTS `create_sequence`$$

CREATE DEFINER=`EBlockMaster`@`%` PROCEDURE `create_sequence`(IN the_name TEXT)
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
    DELETE FROM sequences WHERE seq_name=the_name;
    INSERT INTO sequences VALUES (the_name, 0);
END$$

DELIMITER ;

-- 프로시저 호출하여 시퀀스 생성하기
	CALL `EBLOCK`.`create_sequence`('seq_columnName');



-- 3. nextSeqVal function 생성
-- 	기능 : 해당 시퀀스가 존재하면 현재 값을 얻어서 1을 증가시켜서 업데이트를 한 뒤, 이 값을 리턴함.
<<<<<<< HEAD
DELIMITER $$
=======
DELIMITER $$ 
CREATE FUNCTION `nextSeqVal`(the_name varchar(32))
	RETURNS BIGINT UNSIGNED
	MODIFIES SQL DATA
	DETERMINISTIC
BEGIN
     DECLARE ret BIGINT UNSIGNED; -- 변수선언
     UPDATE sequences SET currval=currval+1 WHERE name=the_name;-- 조건과 일치하면 존재하므로 1 증가
     SELECT currval INTO ret FROM sequences WHERE name=the_name limit 1;-- 채번후 변수에 저장
     RETURN ret;-- 변수값 반환
END
$$
DELIMITER ;



>>>>>>> refs/remotes/origin/JL_1007_1

USE `EBLOCK`$$

DROP FUNCTION IF EXISTS `nextSeqVal`$$

CREATE DEFINER=`EBlockMaster`@`%` FUNCTION `nextSeqVal`(the_name VARCHAR(32)) RETURNS BIGINT(20) UNSIGNED
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
     DECLARE ret BIGINT UNSIGNED; -- 변수선언
     UPDATE sequences SET seq_val=seq_val+1 WHERE seq_name=the_name;-- 조건과 일치하면 존재하므로 1 증가
     SELECT seq_val INTO ret FROM sequences WHERE seq_name=the_name LIMIT 1;-- 채번후 변수에 저장
     RETURN ret;-- 변수값 반환
END$$

DELIMITER ;
-- 4. 시퀀스 생성하기 [ 명명규칙 : seq_컬럼명 ]
INSERT INTO sequences VALUES ('seq_columnName', 0);

-- 5. 활용하기 : 생성된 시퀀스로부터 nextval 값 가져오기
select nextSeqVal('seq_columnName') as seq_columnName_val from dual;




-- 6. currSeqVal function 생성
-- 	기능 : 현재 시퀀스번호를 알아내기
DELIMITER $$

USE `EBLOCK`$$

DROP FUNCTION IF EXISTS `currSeqVal`$$

CREATE DEFINER=`EBlockMaster`@`%` FUNCTION `currSeqVal`(the_name VARCHAR(32)) RETURNS BIGINT(20) UNSIGNED
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
     DECLARE ret BIGINT UNSIGNED;
	 SELECT seq_val INTO ret
       FROM sequences
	  WHERE NAME = the_name LIMIT 1;
     RETURN ret;
<<<<<<< HEAD
END$$

DELIMITER ;
=======
END
$$
DELIMITER ;


>>>>>>> refs/remotes/origin/JL_1007_1

-- 7. 활용하기 : 생성된 시퀀스로부터 nextval 값 가져오기
select currSeqVal('seq_columnName') as seq_columnName_val from dual;


