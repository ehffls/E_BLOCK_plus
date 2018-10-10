/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 10.1.23-MariaDB-9+deb9u1 : Database - EBLOCK
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`EBLOCK` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `EBLOCK`;

/*Table structure for table `attd_list` */

DROP TABLE IF EXISTS `attd_list`;

CREATE TABLE `attd_list` (
  `ask_eno` decimal(6,0) NOT NULL,
  `sign_eno` decimal(6,0) DEFAULT NULL,
  `at_no` decimal(8,0) NOT NULL,
  `ask_date` varchar(10) DEFAULT NULL,
  `at_sort` varchar(5) DEFAULT NULL,
  `ask_rsn` varchar(500) DEFAULT NULL,
  `at_sdate` varchar(10) DEFAULT NULL,
  `at_fdate` varchar(10) DEFAULT NULL,
  `at_days` decimal(3,1) DEFAULT NULL,
  `outcome` varchar(5) DEFAULT NULL,
  `sign_rsn` varchar(500) DEFAULT NULL,
  `sign_date` varchar(10) DEFAULT NULL,
  `d_no` decimal(4,0) NOT NULL,
  PRIMARY KEY (`at_no`),
  KEY `FK__attd_list_ask_eno__emp_e_no` (`ask_eno`),
  KEY `FK__attd_list_sign_eno__emp_e_no` (`sign_eno`),
  KEY `FK__attd_list_d_no__dept_d_no` (`d_no`),
  CONSTRAINT `FK__attd_list_ask_eno__emp_e_no` FOREIGN KEY (`ask_eno`) REFERENCES `emp` (`e_no`),
  CONSTRAINT `FK__attd_list_d_no__dept_d_no` FOREIGN KEY (`d_no`) REFERENCES `dept` (`d_no`),
  CONSTRAINT `FK__attd_list_sign_eno__emp_e_no` FOREIGN KEY (`sign_eno`) REFERENCES `emp` (`e_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `auth` */

DROP TABLE IF EXISTS `auth`;

CREATE TABLE `auth` (
  `au_no` decimal(4,0) NOT NULL,
  `au_scope` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`au_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `bg_ex_list` */

DROP TABLE IF EXISTS `bg_ex_list`;

CREATE TABLE `bg_ex_list` (
  `be_no` decimal(8,0) NOT NULL,
  `d_no` decimal(4,0) NOT NULL,
  `ex_eno` decimal(6,0) NOT NULL,
  `ex_sort` varchar(5) DEFAULT NULL,
  `ex_cash` decimal(12,0) DEFAULT NULL,
  `ex_date` varchar(10) DEFAULT NULL,
  `ex_rsn` varchar(500) DEFAULT NULL,
  `outcome` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`be_no`),
  KEY `FK__bg_ex_list_d_no__dept_d_no` (`d_no`),
  KEY `FK__bg_ex_list_ex_eno__emp_e_no` (`ex_eno`),
  CONSTRAINT `FK__bg_ex_list_d_no__dept_d_no` FOREIGN KEY (`d_no`) REFERENCES `dept` (`d_no`),
  CONSTRAINT `FK__bg_ex_list_ex_eno__emp_e_no` FOREIGN KEY (`ex_eno`) REFERENCES `emp` (`e_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `cmt_list` */

DROP TABLE IF EXISTS `cmt_list`;

CREATE TABLE `cmt_list` (
  `cmt_no` decimal(8,0) NOT NULL,
  `e_no` decimal(6,0) NOT NULL,
  `cmt_date` varchar(10) DEFAULT NULL,
  `cmt_time` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`cmt_no`),
  KEY `FK__cmt_list_e_no__emp_e_no` (`e_no`),
  CONSTRAINT `FK__cmt_list_e_no__emp_e_no` FOREIGN KEY (`e_no`) REFERENCES `emp` (`e_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `cntr_list` */

DROP TABLE IF EXISTS `cntr_list`;

CREATE TABLE `cntr_list` (
  `e_no` decimal(6,0) NOT NULL,
  `cntr_date` varchar(10) NOT NULL,
  `cntr_sort` varchar(5) DEFAULT NULL,
  `cntr_sal` decimal(9,0) DEFAULT NULL,
  `cntr_sdate` varchar(10) DEFAULT NULL,
  `cntr_fdate` varchar(10) DEFAULT NULL,
  `e_rank` varchar(30) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `cntr_state` varchar(5) DEFAULT '����',
  PRIMARY KEY (`e_no`,`cntr_date`),
  CONSTRAINT `FK__cntr_list_e_no__emp_e_no` FOREIGN KEY (`e_no`) REFERENCES `emp` (`e_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `comp` */

DROP TABLE IF EXISTS `comp`;

CREATE TABLE `comp` (
  `c_no` decimal(4,0) NOT NULL,
  `c_name` varchar(50) NOT NULL,
  `c_addr` varchar(100) DEFAULT NULL,
  `c_ph` varchar(13) DEFAULT NULL,
  `c_lat` decimal(9,6) DEFAULT NULL,
  `c_lgt` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`c_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `d_no` decimal(4,0) NOT NULL,
  `d_name` varchar(30) DEFAULT NULL,
  `d_ph` varchar(13) DEFAULT NULL,
  `d_addr` varchar(100) DEFAULT NULL,
  `c_no` decimal(4,0) NOT NULL,
  PRIMARY KEY (`d_no`),
  KEY `FK__dept_c_no__comp_c_no` (`c_no`),
  CONSTRAINT `FK__dept_c_no__comp_c_no` FOREIGN KEY (`c_no`) REFERENCES `comp` (`c_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `emp` */

DROP TABLE IF EXISTS `emp`;

CREATE TABLE `emp` (
  `e_no` decimal(6,0) NOT NULL,
  `d_no` decimal(4,0) NOT NULL,
  `e_id` varchar(30) DEFAULT NULL,
  `e_pw` varchar(30) DEFAULT NULL,
  `e_name` varchar(30) DEFAULT NULL,
  `e_jdate` varchar(10) DEFAULT NULL,
  `au_no` decimal(4,0) DEFAULT '0',
  `e_ph` varchar(13) DEFAULT NULL,
  `e_email` varchar(50) DEFAULT NULL,
  `e_addr` varchar(100) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `e_bdate` varchar(10) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `e_rank` decimal(2,0) DEFAULT '0',
  PRIMARY KEY (`e_no`),
  KEY `FK__emp_d_no__dept_d_no` (`d_no`),
  CONSTRAINT `FK__emp_d_no__dept_d_no` FOREIGN KEY (`d_no`) REFERENCES `dept` (`d_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `eq` */

DROP TABLE IF EXISTS `eq`;

CREATE TABLE `eq` (
  `eq_no` decimal(8,0) NOT NULL,
  `eq_sort` varchar(5) DEFAULT NULL,
  `eq_name` varchar(50) DEFAULT NULL,
  `cost` decimal(12,0) DEFAULT NULL,
  `eq_date` varchar(10) DEFAULT NULL,
  `mk_no` decimal(4,0) NOT NULL,
  PRIMARY KEY (`eq_no`),
  KEY `FK__eq_mk_no__eq_market_mk_no` (`mk_no`),
  CONSTRAINT `FK__eq_mk_no__eq_market_mk_no` FOREIGN KEY (`mk_no`) REFERENCES `eq_market` (`mk_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `eq_add_list` */

DROP TABLE IF EXISTS `eq_add_list`;

CREATE TABLE `eq_add_list` (
  `eq_addno` decimal(8,0) NOT NULL,
  `ask_eno` decimal(6,0) NOT NULL,
  `sign_eno` decimal(6,0) DEFAULT NULL,
  `ask_date` varchar(10) DEFAULT NULL,
  `eq_sort` varchar(5) DEFAULT NULL,
  `eq_name` varchar(50) DEFAULT NULL,
  `outcome` varchar(5) DEFAULT 'eqa-1',
  `mk_no` decimal(4,0) NOT NULL,
  `sign_date` varchar(10) DEFAULT NULL,
  `sign_rsn` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`eq_addno`),
  KEY `FK__eq_add_list_ask_eno__emp_e_no` (`ask_eno`),
  KEY `FK__eq_add_list_sign_eno__emp_e_no` (`sign_eno`),
  KEY `FK__eq_add_list_mk_no__eq_market_mk_no` (`mk_no`),
  CONSTRAINT `FK__eq_add_list_ask_eno__emp_e_no` FOREIGN KEY (`ask_eno`) REFERENCES `emp` (`e_no`),
  CONSTRAINT `FK__eq_add_list_mk_no__eq_market_mk_no` FOREIGN KEY (`mk_no`) REFERENCES `eq_market` (`mk_no`),
  CONSTRAINT `FK__eq_add_list_sign_eno__emp_e_no` FOREIGN KEY (`sign_eno`) REFERENCES `emp` (`e_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `eq_market` */

DROP TABLE IF EXISTS `eq_market`;

CREATE TABLE `eq_market` (
  `mk_no` decimal(4,0) NOT NULL,
  `mk_cname` varchar(50) NOT NULL,
  `mk_ename` varchar(30) NOT NULL,
  `mk_ph` varchar(13) NOT NULL,
  `mk_fax` varchar(14) DEFAULT NULL,
  `mk_email` varchar(50) DEFAULT NULL,
  `mk_adate` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`mk_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `eq_purc_list` */

DROP TABLE IF EXISTS `eq_purc_list`;

CREATE TABLE `eq_purc_list` (
  `eq_pno` decimal(8,0) NOT NULL,
  `ask_date` varchar(10) DEFAULT NULL,
  `outcome` varchar(5) DEFAULT 'ibp-1',
  `sign_date` varchar(10) DEFAULT NULL,
  `num` decimal(4,0) DEFAULT NULL,
  `subtotal` decimal(12,0) DEFAULT NULL,
  `ask_eno` decimal(6,0) NOT NULL,
  `sign_eno` decimal(6,0) DEFAULT NULL,
  `eq_no` decimal(8,0) NOT NULL,
  PRIMARY KEY (`eq_pno`),
  KEY `FK__eq_purc_list_ask_eno__emp_e_no` (`ask_eno`),
  KEY `FK__eq_purc_list_sign_eno__emp_e_no` (`sign_eno`),
  KEY `FK__eq_purc_list_eq_no__eq_eq_no` (`eq_no`),
  CONSTRAINT `FK__eq_purc_list_ask_eno__emp_e_no` FOREIGN KEY (`ask_eno`) REFERENCES `emp` (`e_no`),
  CONSTRAINT `FK__eq_purc_list_eq_no__eq_eq_no` FOREIGN KEY (`eq_no`) REFERENCES `eq` (`eq_no`),
  CONSTRAINT `FK__eq_purc_list_sign_eno__emp_e_no` FOREIGN KEY (`sign_eno`) REFERENCES `emp` (`e_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `eq_sort` */

DROP TABLE IF EXISTS `eq_sort`;

CREATE TABLE `eq_sort` (
  `eq_sort` varchar(30) NOT NULL,
  PRIMARY KEY (`eq_sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `inb_eq` */

DROP TABLE IF EXISTS `inb_eq`;

CREATE TABLE `inb_eq` (
  `inb_no` varchar(6) NOT NULL,
  `inb_date` varchar(10) DEFAULT NULL,
  `inb_state` varchar(5) DEFAULT 'inb-1',
  `eq_no` decimal(8,0) NOT NULL,
  PRIMARY KEY (`inb_no`),
  KEY `FK__inb_eq_eq_no__eq_eq_no` (`eq_no`),
  CONSTRAINT `FK__inb_eq_eq_no__eq_eq_no` FOREIGN KEY (`eq_no`) REFERENCES `eq` (`eq_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `inb_io_list` */

DROP TABLE IF EXISTS `inb_io_list`;

CREATE TABLE `inb_io_list` (
  `io_no` decimal(8,0) NOT NULL,
  `inb_state` varchar(5) DEFAULT 'inb-1',
  `sign_date` varchar(10) DEFAULT NULL,
  `inb_no` varchar(6) NOT NULL,
  `ask_eno` decimal(6,0) NOT NULL,
  PRIMARY KEY (`io_no`),
  KEY `FK__inb_io_list_inb_no__inb_eq_inb_no` (`inb_no`),
  KEY `FK__inb_io_list_ask_eno__emp_e_no` (`ask_eno`),
  CONSTRAINT `FK__inb_io_list_ask_eno__emp_e_no` FOREIGN KEY (`ask_eno`) REFERENCES `emp` (`e_no`),
  CONSTRAINT `FK__inb_io_list_inb_no__inb_eq_inb_no` FOREIGN KEY (`inb_no`) REFERENCES `inb_eq` (`inb_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `inb_ioask_list` */

DROP TABLE IF EXISTS `inb_ioask_list`;

CREATE TABLE `inb_ioask_list` (
  `io_ano` decimal(8,0) NOT NULL,
  `ask_date` varchar(10) DEFAULT NULL,
  `io_sort` varchar(5) NOT NULL,
  `outcome` varchar(5) DEFAULT 'ioa-1',
  `sign_date` varchar(10) DEFAULT NULL,
  `ask_eno` decimal(6,0) NOT NULL,
  `sign_eno` decimal(6,0) NOT NULL,
  `inb_no` varchar(6) NOT NULL,
  `ask_rsn` varchar(500) DEFAULT NULL,
  `sign_rsn` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`io_ano`),
  KEY `FK__inb_ioask_list_ask_eno__emp_e_no` (`ask_eno`),
  KEY `FK__inb_ioask_list_sign_eno__emp_e_no` (`sign_eno`),
  KEY `FK__inb_ioask_list_inb_no__inb_eq_inb_no` (`inb_no`),
  CONSTRAINT `FK__inb_ioask_list_ask_eno__emp_e_no` FOREIGN KEY (`ask_eno`) REFERENCES `emp` (`e_no`),
  CONSTRAINT `FK__inb_ioask_list_inb_no__inb_eq_inb_no` FOREIGN KEY (`inb_no`) REFERENCES `inb_eq` (`inb_no`),
  CONSTRAINT `FK__inb_ioask_list_sign_eno__emp_e_no` FOREIGN KEY (`sign_eno`) REFERENCES `emp` (`e_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `pev` */

DROP TABLE IF EXISTS `pev`;

CREATE TABLE `pev` (
  `ev_eno` decimal(6,0) NOT NULL,
  `tg_eno` decimal(6,0) NOT NULL,
  `qrt_no` varchar(8) NOT NULL,
  `ev_date` varchar(10) DEFAULT NULL,
  `ev_content` varchar(500) DEFAULT NULL,
  `ev_score` decimal(2,0) DEFAULT NULL,
  `ratio` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`qrt_no`,`ev_eno`,`tg_eno`),
  KEY `FK__pev_ev_eno__emp_e_no` (`ev_eno`),
  KEY `FK__pev_tg_eno__emp_e_no` (`tg_eno`),
  CONSTRAINT `FK__pev_ev_eno__emp_e_no` FOREIGN KEY (`ev_eno`) REFERENCES `emp` (`e_no`),
  CONSTRAINT `FK__pev_tg_eno__emp_e_no` FOREIGN KEY (`tg_eno`) REFERENCES `emp` (`e_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `pev_list` */

DROP TABLE IF EXISTS `pev_list`;

CREATE TABLE `pev_list` (
  `pev_lno` decimal(8,0) NOT NULL,
  `qrt_no` varchar(8) DEFAULT NULL,
  `ev_eno` decimal(6,0) DEFAULT NULL,
  `tg_eno` decimal(6,0) DEFAULT NULL,
  `ev_date` varchar(10) DEFAULT NULL,
  `ev_content` varchar(500) DEFAULT NULL,
  `ev_score` decimal(2,0) DEFAULT NULL,
  `ratio` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`pev_lno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `qrt_bg` */

DROP TABLE IF EXISTS `qrt_bg`;

CREATE TABLE `qrt_bg` (
  `bg_no` decimal(8,0) NOT NULL,
  `qrt_no` decimal(8,0) DEFAULT NULL,
  `cfw_bg` decimal(12,0) DEFAULT NULL,
  `add_bg` decimal(12,0) DEFAULT NULL,
  `spd_bg` decimal(12,0) DEFAULT NULL,
  `rst_bg` decimal(12,0) DEFAULT NULL,
  `d_no` decimal(4,0) NOT NULL,
  PRIMARY KEY (`bg_no`),
  KEY `FK__qrt_bg_d_no__dept_d_no` (`d_no`),
  CONSTRAINT `FK__qrt_bg_d_no__dept_d_no` FOREIGN KEY (`d_no`) REFERENCES `dept` (`d_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `retire_ask_list` */

DROP TABLE IF EXISTS `retire_ask_list`;

CREATE TABLE `retire_ask_list` (
  `rt_no` decimal(6,0) NOT NULL,
  `ask_date` varchar(10) DEFAULT NULL,
  `rt_date` varchar(10) NOT NULL,
  `outcome` varchar(5) NOT NULL,
  `ask_rsn` varchar(500) NOT NULL,
  `sign_rsn` varchar(500) DEFAULT NULL,
  `sign_date` varchar(10) DEFAULT NULL,
  `ask_eno` decimal(6,0) NOT NULL,
  `sign_eno` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`rt_no`),
  KEY `FK__retire_ask_list_ask_eno__emp_e_no` (`ask_eno`),
  KEY `FK__retire_ask_list_sign_eno__emp_e_no` (`sign_eno`),
  CONSTRAINT `FK__retire_ask_list_ask_eno__emp_e_no` FOREIGN KEY (`ask_eno`) REFERENCES `emp` (`e_no`),
  CONSTRAINT `FK__retire_ask_list_sign_eno__emp_e_no` FOREIGN KEY (`sign_eno`) REFERENCES `emp` (`e_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `sal_pay_list` */

DROP TABLE IF EXISTS `sal_pay_list`;

CREATE TABLE `sal_pay_list` (
  `pay_no` decimal(8,0) NOT NULL,
  `pay_sort` varchar(5) DEFAULT NULL,
  `pay_cash` decimal(12,0) DEFAULT NULL,
  `pay_date` varchar(10) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `e_no` decimal(6,0) NOT NULL,
  PRIMARY KEY (`pay_no`),
  KEY `FK__sal_pay_list_e_no__emp_e_no` (`e_no`),
  CONSTRAINT `FK__sal_pay_list_e_no__emp_e_no` FOREIGN KEY (`e_no`) REFERENCES `emp` (`e_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `sequences` */

DROP TABLE IF EXISTS `sequences`;

CREATE TABLE `sequences` (
  `seq_name` varchar(32) DEFAULT NULL,
  `seq_val` bigint(20) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* Trigger structure for table `eq_add_list` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trg_eq_add_permit` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'EBlockMaster'@'%' */ /*!50003 TRIGGER `trg_eq_add_permit` AFTER UPDATE ON `eq_add_list` FOR EACH ROW 	 -- WHEN (outcome = 'rta-3') : 오라클에서만 적용가능한 비표준쿼리
	 -- MySQL은 실행문(BEGIN~END사이 IF문으로 해결)
BEGIN
	 /*
		  new.column : 트리거가 걸린 테이블의 컬럼의 새 값
        old.column : 트리거가 걸린 테이블의 컬럼의 기존 값
    */
    -- 승인했을 때
	 IF new.outcome = 'eqa-3' THEN
        INSERT INTO `eq`
		  SET eq_no = nextSeqVal('seq_eq_no')
		     ,eq_sort = old.eq_sort -- 승인된 제품분류
		     ,eq_name = old.eq_name -- 승인된 제품이름
		     ,eq_date = DATE_FORMAT(now(), '%Y-%m-%d')
           ,mk_no = old.mk_no -- 승인된 거래처번호
           ;
    END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `pev` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trg_pev_add` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'EBlockMaster'@'%' */ /*!50003 TRIGGER `trg_pev_add` AFTER INSERT ON `pev` FOR EACH ROW 
-- BEGIN -- MySQL 8.0이상은 BEGIN-END를 선언하지 않습니다.
INSERT INTO `pev_list`(pev_lno, qrt_no, ev_eno, tg_eno, ev_date, ev_content, ev_score, ratio)
    VALUES (nextSeqVal('seq_pev_lno')
		  ,NEW.qrt_no
        ,NEW.ev_eno
        ,NEW.tg_eno
        ,NEW.ev_date
        ,NEW.ev_content
        ,NEW.ev_score
        ,NEW.ratio)
-- END -- MySQL 8.0이상은 BEGIN-END를 선언하지 않습니다. */$$


DELIMITER ;

/* Trigger structure for table `pev` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trg_pev_upd` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'EBlockMaster'@'%' */ /*!50003 TRIGGER `trg_pev_upd` AFTER UPDATE ON `pev` FOR EACH ROW 
-- BEGIN -- MySQL 8.0이상은 BEGIN-END를 선언하지 않습니다.
INSERT INTO `pev_list`(pev_lno, qrt_no, ev_eno, tg_eno, ev_date, ev_content, ev_score, ratio)
    VALUES (nextSeqVal('seq_pev_lno')
		  ,OLD.qrt_no
        ,OLD.ev_eno
        ,OLD.tg_eno
        ,OLD.ev_date
        ,OLD.ev_content
        ,OLD.ev_score
        ,OLD.ratio)
-- END -- MySQL 8.0이상은 BEGIN-END를 선언하지 않습니다. */$$


DELIMITER ;

/*!50106 set global event_scheduler = 1*/;

/* Event structure for event `evt_daily_cntr_date` */

/*!50106 DROP EVENT IF EXISTS `evt_daily_cntr_date`*/;

DELIMITER $$

/*!50106 CREATE DEFINER=`EBlockMaster`@`%` EVENT `evt_daily_cntr_date` ON SCHEDULE EVERY 1 DAY STARTS '2018-10-06 01:10:32' ON COMPLETION NOT PRESERVE ENABLE COMMENT '계약만료일 시점이 지난 계약을 갱신합니다.' DO BEGIN
       
       -- 현재 날짜보다 이전으로 된 계약만료일을 가진 컬럼들 중, 만료상태로 전환함
	    UPDATE `EBLOCK`.`cntr_list`
		    SET cntr_state = '만료'
	     WHERE cntr_fdate < curdate()
		    AND cntr_state = '진행';
	                
   END */$$
DELIMITER ;

/* Function  structure for function  `currSeqVal` */

/*!50003 DROP FUNCTION IF EXISTS `currSeqVal` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`EBlockMaster`@`%` FUNCTION `currSeqVal`(the_name varchar(32)) RETURNS bigint(20) unsigned
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
     DECLARE ret BIGINT UNSIGNED;
	 SELECT seq_val INTO ret
       FROM sequences
	  WHERE name = the_name LIMIT 1;
     RETURN ret;
END */$$
DELIMITER ;

/* Function  structure for function  `nextSeqVal` */

/*!50003 DROP FUNCTION IF EXISTS `nextSeqVal` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`EBlockMaster`@`%` FUNCTION `nextSeqVal`(the_name varchar(32)) RETURNS bigint(20) unsigned
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
     DECLARE ret BIGINT UNSIGNED; -- 변수선언
     UPDATE sequences SET seq_val=seq_val+1 WHERE seq_name=the_name;-- 조건과 일치하면 존재하므로 1 증가
     SELECT seq_val INTO ret FROM sequences WHERE seq_name=the_name limit 1;-- 채번후 변수에 저장
     RETURN ret;-- 변수값 반환
END */$$
DELIMITER ;

/* Procedure structure for procedure `create_sequence` */

/*!50003 DROP PROCEDURE IF EXISTS  `create_sequence` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`EBlockMaster`@`%` PROCEDURE `create_sequence`(IN the_name text)
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
    DELETE FROM sequences WHERE name=the_name;
    INSERT INTO sequences VALUES (the_name, 0);
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_cntr_addEmp` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_cntr_addEmp` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`EBlockMaster`@`%` PROCEDURE `proc_cntr_addEmp`(-- emp table
     IN _e_no		NUMERIC(6)
	 ,IN _d_no 		NUMERIC(4)
	 ,IN _e_id		VARCHAR(30)
    ,IN _e_pw		VARCHAR(30)
    ,IN _e_name	VARCHAR(30)
    ,IN _e_jdate	VARCHAR(10)
    ,IN _au_no		NUMERIC(4)
    ,IN _e_ph		VARCHAR(13)
    ,IN _e_mail	VARCHAR(50)
    ,IN _e_addr	VARCHAR(100)
    ,IN _note1		VARCHAR(500)
    ,IN _e_bdate	VARCHAR(10)
    ,IN _gender	VARCHAR(1)
    ,IN _e_rank	NUMERIC(2)
     -- cntr_list table
    ,IN _cntr_date	VARCHAR(10)
    ,IN _cntr_sort	VARCHAR(5)
    ,IN _cntr_sal		NUMERIC(9)
    ,IN _cntr_sdate	VARCHAR(10)
    ,IN _cntr_fdate	VARCHAR(10)
    ,IN _note2			VARCHAR(500)
     -- result
    ,OUT _RESULT 		INT)
out_area:
BEGIN -- 바깥쪽 구문
	DECLARE _new_eno  INT;		/* 새로 등록한 사원번호를 담을 변수를 선언한다. */
   DECLARE _old_eno 	INT;		/* 기존의 사원번호를 담을 변수를 선언한다. */
 	/* 만약 SQL에러라면 ROLLBACK 처리한다. */
 	DECLARE exit handler for SQLEXCEPTION
 	  BEGIN
         ROLLBACK;        
         SET _RESULT = 0;
	  END;
body_area:
BEGIN -- 안쪽 구문
	/* 트랜젝션 시작 */
	START TRANSACTION;
	   /* 입력된 파라미터 변수 _e_no에 대하여*/
		  -- 0일때 신입사원 등록
      IF _e_no = 0
		  THEN 
				-- 새 시퀀스 번호를 채번함
				SELECT nextSeqVal('seq_e_no') INTO _new_eno FROM dual;
            
				-- emp 테이블에 INSERT 실행
				INSERT INTO `emp`(e_no, d_no, e_id, e_pw, e_name, e_jdate, au_no,
								e_ph, e_email, e_addr, note, e_bdate, gender, e_rank)            
            VALUES(_new_eno, _d_no, _e_id, _e_pw, _e_name, _e_jdate, _au_no,
						 _e_ph, _e_mail, _e_addr, _note1, _e_bdate, _gender, _e_rank);
            
					 -- cntr_list 테이블에 INSERT 실행
				INSERT INTO `cntr_list`(e_no, cntr_date, cntr_sort, cntr_sal,
												cntr_sdate, cntr_fdate, e_rank, note)
				VALUES(_new_eno, _cntr_date, _cntr_sort, _cntr_sal,
					    _cntr_sdate, _cntr_fdate, _e_rank, _note2);
		  -- 0보다 클때는 기존사원 재계약
      ELSEIF _e_no > 0
		  THEN 
					 -- 기존 사원번호를 채번함
            SET _old_eno = _e_no;
					 -- cntr_list 테이블에 INSERT 실행
				INSERT INTO `cntr_list`(e_no, cntr_date, cntr_sort, cntr_sal,
												cntr_sdate, cntr_fdate, e_rank, note)
				VALUES (_old_eno, _cntr_date, _cntr_sort, _cntr_sal,
						  _cntr_sdate, _cntr_fdate, _e_rank, _note2);
            
					 -- emp 테이블에 UPDATE 실행
				UPDATE `emp` SET
                    d_no	 = _d_no,
                    au_no 	 = _au_no,
                    e_ph 	 = _e_ph,
                    e_email  = _e_mail,
                    e_addr  = _e_addr,
                    note 	 = _note1,
                    e_rank  = _e_rank
				 WHERE e_no = _old_eno;
	   END IF;
      
      
	 -- 0보다 작을때는 에러
      IF _e_no<0 || _e_no IS NULL
		  THEN LEAVE body_area;
      END IF;
 
	/* 커밋 */
   
	COMMIT;
	SET _RESULT = 1;
END; -- 안쪽구문
	 -- 에러처리
	 IF _e_no<0 || _e_no IS NULL
	 THEN
        ROLLBACK;
		  SET _RESULT = -1;
	 END IF;
    
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_pev_add` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_pev_add` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`EBlockMaster`@`%` PROCEDURE `proc_pev_add`(IN _ev_eno		NUMERIC(6)
    ,IN _tg_eno		NUMERIC(6)
	 ,IN _ev_content 	VARCHAR(500)
    ,IN _ev_score 	NUMERIC(2)
	 ,OUT RESULT 		INT)
BEGIN -- 바깥쪽 구문
	DECLARE _rank INT;		/* 등급을 담을 변수를 선언한다. */
   DECLARE _ratio DOUBLE;	/* 비율을 담을 변수를 선언한다. */
body_area:
BEGIN -- 안쪽 구문
	/* 만약 SQL에러라면 ROLLBACK 처리한다. */
	DECLARE exit handler for SQLEXCEPTION
	  BEGIN
		  ROLLBACK;        
        SET RESULT = 0;  
	  END;
	/* 트랜젝션 시작 */
	START TRANSACTION;
	   /* 평가한 사원의 사원번호로 직급 조회 */
      SELECT e_rank INTO _rank /* 선언해둔 등급변수에 담음 */
        FROM `emp`
       WHERE e_no = _ev_eno;
      
		/* 직급에 맞게 비율조정 */
		IF 	 _rank = 50 THEN SET _ratio = 1.00;  /* 대표 */
		ELSEIF _rank = 40 THEN SET _ratio = 0.75;  /* 부서장 */
      ELSEIF _rank = 30 THEN SET _ratio = 0.5;   /* 차장 */
      ELSEIF _rank = 20 THEN SET _ratio = 0.25;  /* 팀장 */
      ELSEIF _rank = 10 THEN SET _ratio = 0.1;   /* 사원 */
		END IF;
	   /* 직급이 없을때 비율이 지정되지 않으므로, 비율이 없을때 프로시저를 탈출*/
	   IF _ratio IS NULL THEN LEAVE body_area;
      END IF;
		/* pev 테이블에 INSERT 실행 */
		INSERT INTO `pev`(ev_eno,tg_eno,qrt_no,ev_date,ev_content,ev_score,ratio)
      VALUES (_ev_eno,_tg_eno
				 ,CONCAT(date_format(now(),'%y-')
                    ,quarter(now())
					     ,date_format(now(),'-%m')) /* 18-3-09 */
             ,DATE_FORMAT(now(), '%Y-%m-%d')   /* 2018-09-18 */
             ,_ev_content,_ev_score,_ratio);
	/* 커밋 */
	COMMIT;
	SET RESULT = 1;
END; -- 안쪽구문
	 IF _ratio IS NULL THEN SET RESULT = -1;
	 END IF;
    
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_pev_upd` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_pev_upd` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`EBlockMaster`@`%` PROCEDURE `proc_pev_upd`(IN _ev_eno		NUMERIC(6)
    ,IN _tg_eno		NUMERIC(6)
	 ,IN _ev_content 	VARCHAR(500)
    ,IN _ev_score 	NUMERIC(2)
	 ,OUT RESULT 		INT)
BEGIN -- 바깥쪽 구문
	DECLARE _rank INT;		/* 등급을 담을 변수를 선언한다. */
   DECLARE _ratio DOUBLE;	/* 비율을 담을 변수를 선언한다. */
body_area:
BEGIN -- 안쪽 구문
	/* 만약 SQL에러라면 ROLLBACK 처리한다. */
	DECLARE exit handler for SQLEXCEPTION
	  BEGIN
		  ROLLBACK;        
        SET RESULT = 0;  
	  END;
	/* 트랜젝션 시작 */
	START TRANSACTION;
	   /* 평가한 사원의 사원번호로 직급 조회 */
      SELECT e_rank INTO _rank /* 선언해둔 등급변수에 담음 */
        FROM `emp`
       WHERE e_no = _ev_eno;
      
		/* 직급에 맞게 비율조정 */
		IF 	 _rank = 50 THEN SET _ratio = 1.00;  /* 대표 */
		ELSEIF _rank = 40 THEN SET _ratio = 0.75;  /* 부서장 */
      ELSEIF _rank = 30 THEN SET _ratio = 0.5;   /* 차장 */
      ELSEIF _rank = 20 THEN SET _ratio = 0.25;  /* 팀장 */
      ELSEIF _rank = 10 THEN SET _ratio = 0.1;   /* 사원 */
		END IF;
	   /* 직급이 없을때 비율이 지정되지 않으므로, 비율이 없을때 프로시저를 탈출*/
	   IF _ratio IS NULL THEN LEAVE body_area;
      END IF;
		/* pev 테이블에 UPDATE 실행 */
		UPDATE `pev` SET ev_date = DATE_FORMAT(now(), '%Y-%m-%d')
						    ,ev_content = _ev_content
						    ,ev_score = _ev_score
                      ,ratio = _ratio /* 평가기간 중 진급이 가능한 경우엔 변경될 여지가 있음 */
	    WHERE ev_eno = _ev_eno
		   AND tg_eno = _tg_eno
         AND qrt_no = CONCAT(date_format(now(),'%y-'),quarter(now()),date_format(now(),'-%m'));
	/* 커밋 */
	COMMIT;
	SET RESULT = 1;
END; -- 안쪽구문
	 IF _ratio IS NULL THEN SET RESULT = -1;
	 END IF;
    
END */$$
DELIMITER ;

/*Table structure for table `view_DpEmpName` */

DROP TABLE IF EXISTS `view_DpEmpName`;

/*!50001 DROP VIEW IF EXISTS `view_DpEmpName` */;
/*!50001 DROP TABLE IF EXISTS `view_DpEmpName` */;

/*!50001 CREATE TABLE  `view_DpEmpName`(
 `d_no` decimal(4,0) ,
 `d_name` varchar(30) ,
 `e_no` decimal(6,0) ,
 `e_name` varchar(30) ,
 `e_rank` varchar(3) ,
 `au_no` decimal(4,0) ,
 `d_ph` varchar(13) 
)*/;

/*Table structure for table `view_attd_list` */

DROP TABLE IF EXISTS `view_attd_list`;

/*!50001 DROP VIEW IF EXISTS `view_attd_list` */;
/*!50001 DROP TABLE IF EXISTS `view_attd_list` */;

/*!50001 CREATE TABLE  `view_attd_list`(
 `at_no` decimal(8,0) ,
 `ask_eno` decimal(6,0) ,
 `d_no` decimal(4,0) ,
 `ask_ename` varchar(30) ,
 `ask_date` varchar(10) ,
 `at_sort` varchar(5) ,
 `ask_rsn` varchar(500) ,
 `at_sdate` varchar(10) ,
 `at_fdate` varchar(10) ,
 `at_days` decimal(3,1) ,
 `outcome` varchar(5) ,
 `sign_eno` decimal(6,0) ,
 `sign_ename` varchar(30) ,
 `sign_rsn` varchar(500) ,
 `sign_date` varchar(10) 
)*/;

/*Table structure for table `view_bg_ex_list` */

DROP TABLE IF EXISTS `view_bg_ex_list`;

/*!50001 DROP VIEW IF EXISTS `view_bg_ex_list` */;
/*!50001 DROP TABLE IF EXISTS `view_bg_ex_list` */;

/*!50001 CREATE TABLE  `view_bg_ex_list`(
 `be_no` decimal(8,0) ,
 `d_no` decimal(4,0) ,
 `d_name` varchar(30) ,
 `ex_eno` decimal(6,0) ,
 `ex_ename` varchar(30) ,
 `ex_sort` varchar(5) ,
 `ex_cash` decimal(12,0) ,
 `ex_date` varchar(10) ,
 `ex_rsn` varchar(500) ,
 `outcome` varchar(5) 
)*/;

/*Table structure for table `view_cmt_list` */

DROP TABLE IF EXISTS `view_cmt_list`;

/*!50001 DROP VIEW IF EXISTS `view_cmt_list` */;
/*!50001 DROP TABLE IF EXISTS `view_cmt_list` */;

/*!50001 CREATE TABLE  `view_cmt_list`(
 `d_name` varchar(30) ,
 `e_no` decimal(6,0) ,
 `e_name` varchar(30) ,
 `e_rank` varchar(3) ,
 `cmt_date` varchar(10) ,
 `first_check` varchar(8) ,
 `attend` varchar(2) ,
 `last_check` varchar(8) ,
 `lv_state` varchar(2) ,
 `io_state` varchar(3) 
)*/;

/*Table structure for table `view_eq_add_list` */

DROP TABLE IF EXISTS `view_eq_add_list`;

/*!50001 DROP VIEW IF EXISTS `view_eq_add_list` */;
/*!50001 DROP TABLE IF EXISTS `view_eq_add_list` */;

/*!50001 CREATE TABLE  `view_eq_add_list`(
 `eq_addno` decimal(8,0) ,
 `ask_eno` decimal(6,0) ,
 `sign_eno` decimal(6,0) ,
 `ask_date` varchar(10) ,
 `eq_sort` varchar(5) ,
 `eq_name` varchar(50) ,
 `outcome` varchar(5) ,
 `elapse` varchar(7) ,
 `sign_date` varchar(10) ,
 `sign_rsn` varchar(500) 
)*/;

/*Table structure for table `view_inb_eq` */

DROP TABLE IF EXISTS `view_inb_eq`;

/*!50001 DROP VIEW IF EXISTS `view_inb_eq` */;
/*!50001 DROP TABLE IF EXISTS `view_inb_eq` */;

/*!50001 CREATE TABLE  `view_inb_eq`(
 `inb_no` varchar(6) ,
 `eq_no` decimal(8,0) ,
 `eq_name` varchar(50) ,
 `eq_sort` varchar(5) ,
 `inb_date` varchar(10) ,
 `inb_state` varchar(5) ,
 `last_date` varchar(10) ,
 `lapse_day` double ,
 `last_eno` varchar(7) ,
 `last_ename` varchar(30) ,
 `last_dname` varchar(30) 
)*/;

/*Table structure for table `view_inb_ioask_eq_emp_dp` */

DROP TABLE IF EXISTS `view_inb_ioask_eq_emp_dp`;

/*!50001 DROP VIEW IF EXISTS `view_inb_ioask_eq_emp_dp` */;
/*!50001 DROP TABLE IF EXISTS `view_inb_ioask_eq_emp_dp` */;

/*!50001 CREATE TABLE  `view_inb_ioask_eq_emp_dp`(
 `io_ano` decimal(8,0) ,
 `inb_no` varchar(6) ,
 `eq_sort` varchar(5) ,
 `eq_name` varchar(50) ,
 `ask_eno` decimal(6,0) ,
 `ask_ename` varchar(30) ,
 `ask_dname` varchar(30) ,
 `ask_date` varchar(10) ,
 `io_sort` varchar(5) ,
 `outcome` varchar(5) ,
 `sign_eno` decimal(6,0) ,
 `sign_ename` varchar(30) ,
 `sign_dname` varchar(30) ,
 `sign_date` varchar(10) ,
 `ask_rsn` varchar(500) ,
 `sign_rsn` varchar(500) 
)*/;

/*Table structure for table `view_purc_eqmk_list` */

DROP TABLE IF EXISTS `view_purc_eqmk_list`;

/*!50001 DROP VIEW IF EXISTS `view_purc_eqmk_list` */;
/*!50001 DROP TABLE IF EXISTS `view_purc_eqmk_list` */;

/*!50001 CREATE TABLE  `view_purc_eqmk_list`(
 `eq_pno` decimal(8,0) ,
 `ask_eno` decimal(6,0) ,
 `ask_date` varchar(10) ,
 `outcome` varchar(5) ,
 `elapse` varchar(7) ,
 `sign_eno` decimal(6,0) ,
 `sign_date` varchar(10) ,
 `eq_sort` varchar(5) ,
 `eq_no` decimal(8,0) ,
 `eq_name` varchar(50) ,
 `cost` decimal(12,0) ,
 `num` decimal(4,0) ,
 `subtotal` decimal(12,0) ,
 `mk_cname` varchar(50) ,
 `mk_no` decimal(4,0) 
)*/;

/*View structure for view view_DpEmpName */

/*!50001 DROP TABLE IF EXISTS `view_DpEmpName` */;
/*!50001 DROP VIEW IF EXISTS `view_DpEmpName` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`EBlockMaster`@`%` SQL SECURITY DEFINER VIEW `view_DpEmpName` AS select `dp`.`d_no` AS `d_no`,`dp`.`d_name` AS `d_name`,`em`.`e_no` AS `e_no`,`em`.`e_name` AS `e_name`,(case when (`em`.`e_rank` = 50) then '대표' when (`em`.`e_rank` = 40) then '부서장' when (`em`.`e_rank` = 30) then '차장' when (`em`.`e_rank` = 20) then '팀장' when (`em`.`e_rank` = 10) then '사원' else '인턴' end) AS `e_rank`,`em`.`au_no` AS `au_no`,`dp`.`d_ph` AS `d_ph` from (`dept` `dp` join `emp` `em`) where (`dp`.`d_no` = `em`.`d_no`) */;

/*View structure for view view_attd_list */

/*!50001 DROP TABLE IF EXISTS `view_attd_list` */;
/*!50001 DROP VIEW IF EXISTS `view_attd_list` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`EBlockMaster`@`%` SQL SECURITY DEFINER VIEW `view_attd_list` AS select `attd_list`.`at_no` AS `at_no`,`attd_list`.`ask_eno` AS `ask_eno`,`attd_list`.`d_no` AS `d_no`,(select `emp`.`e_name` from `emp` where (`emp`.`e_no` = `attd_list`.`ask_eno`)) AS `ask_ename`,`attd_list`.`ask_date` AS `ask_date`,(case when (`attd_list`.`at_sort` = 'atd-a') then '야근' when (`attd_list`.`at_sort` = 'atd-b') then '외근' when (`attd_list`.`at_sort` = 'atd-c') then '출장' when (`attd_list`.`at_sort` = 'atd-d') then '휴가' else 'ERROR' end) AS `at_sort`,`attd_list`.`ask_rsn` AS `ask_rsn`,`attd_list`.`at_sdate` AS `at_sdate`,`attd_list`.`at_fdate` AS `at_fdate`,`attd_list`.`at_days` AS `at_days`,(case when (`attd_list`.`outcome` = 'atd-0') then '취소' when (`attd_list`.`outcome` = 'atd-1') then '대기' when (`attd_list`.`outcome` = 'atd-2') then '기각' when (`attd_list`.`outcome` = 'atd-3') then '승인' else 'ERROR' end) AS `outcome`,`attd_list`.`sign_eno` AS `sign_eno`,(select `emp`.`e_name` from `emp` where (`emp`.`e_no` = `attd_list`.`sign_eno`)) AS `sign_ename`,(case when (`attd_list`.`outcome` in ('atd-0','atd-1')) then ' ' when (`attd_list`.`outcome` in ('atd-2','atd-3')) then `attd_list`.`sign_rsn` else 'ERROR' end) AS `sign_rsn`,(case when (`attd_list`.`outcome` in ('atd-0','atd-1')) then ' ' when (`attd_list`.`outcome` in ('atd-2','atd-3')) then `attd_list`.`sign_date` else 'ERROR' end) AS `sign_date` from `attd_list` */;

/*View structure for view view_bg_ex_list */

/*!50001 DROP TABLE IF EXISTS `view_bg_ex_list` */;
/*!50001 DROP VIEW IF EXISTS `view_bg_ex_list` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`EBlockMaster`@`%` SQL SECURITY DEFINER VIEW `view_bg_ex_list` AS select `bg_ex_list`.`be_no` AS `be_no`,`bg_ex_list`.`d_no` AS `d_no`,(select `dept`.`d_name` from `dept` where (`dept`.`d_no` = `bg_ex_list`.`d_no`)) AS `d_name`,`bg_ex_list`.`ex_eno` AS `ex_eno`,(select `emp`.`e_name` from `emp` where (`emp`.`e_no` = `bg_ex_list`.`ex_eno`)) AS `ex_ename`,(case when (`bg_ex_list`.`ex_sort` = 'bg-a') then '부서' when (`bg_ex_list`.`ex_sort` = 'bg-b') then '비품' when (`bg_ex_list`.`ex_sort` = 'bg-c') then '급여' else 'ERROR' end) AS `ex_sort`,`bg_ex_list`.`ex_cash` AS `ex_cash`,`bg_ex_list`.`ex_date` AS `ex_date`,`bg_ex_list`.`ex_rsn` AS `ex_rsn`,(case when (`bg_ex_list`.`outcome` = 'bg-0') then '철회' when (`bg_ex_list`.`outcome` = 'bg-1') then '집행' else 'ERROR' end) AS `outcome` from `bg_ex_list` */;

/*View structure for view view_cmt_list */

/*!50001 DROP TABLE IF EXISTS `view_cmt_list` */;
/*!50001 DROP VIEW IF EXISTS `view_cmt_list` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`EBlockMaster`@`%` SQL SECURITY DEFINER VIEW `view_cmt_list` AS select `dpemp`.`d_name` AS `d_name`,`cl`.`e_no` AS `e_no`,`dpemp`.`e_name` AS `e_name`,`dpemp`.`e_rank` AS `e_rank`,`cl`.`cmt_date` AS `cmt_date`,min(`cl`.`cmt_time`) AS `first_check`,if((min(`cl`.`cmt_time`) < '10:00:00'),'출근',if((min(`cl`.`cmt_time`) > '17:30:00'),'야간','지각')) AS `attend`,if((count(`cl`.`cmt_time`) = 1),'--:--:--',max(`cl`.`cmt_time`)) AS `last_check`,if(((max(`cl`.`cmt_time`) < '17:30:00') and ((count(`cl`.`cmt_time`) % 2) = 0)),'조퇴',if((count(`cl`.`cmt_time`) = 1),if((`cl`.`cmt_date` < curdate()),' ','재실'),'퇴근')) AS `lv_state`,if(((count(`cl`.`cmt_time`) % 2) = 1),if((`cl`.`cmt_date` < curdate()),'-','IN'),'OUT') AS `io_state` from (`cmt_list` `cl` join `view_DpEmpName` `dpemp`) where (`cl`.`e_no` = `dpemp`.`e_no`) group by `cl`.`cmt_date`,`cl`.`e_no` order by `cl`.`cmt_date` desc,`dpemp`.`e_rank`,`cl`.`e_no` */;

/*View structure for view view_eq_add_list */

/*!50001 DROP TABLE IF EXISTS `view_eq_add_list` */;
/*!50001 DROP VIEW IF EXISTS `view_eq_add_list` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`EBlockMaster`@`%` SQL SECURITY DEFINER VIEW `view_eq_add_list` AS select `eq_add_list`.`eq_addno` AS `eq_addno`,`eq_add_list`.`ask_eno` AS `ask_eno`,`eq_add_list`.`sign_eno` AS `sign_eno`,`eq_add_list`.`ask_date` AS `ask_date`,`eq_add_list`.`eq_sort` AS `eq_sort`,`eq_add_list`.`eq_name` AS `eq_name`,(case when (`eq_add_list`.`outcome` = 'eqa-0') then '취소' when (`eq_add_list`.`outcome` = 'eqa-1') then '대기' when (`eq_add_list`.`outcome` = 'eqa-2') then '기각' when (`eq_add_list`.`outcome` = 'eqa-3') then '승인' else 'ERROR' end) AS `outcome`,(case when (`eq_add_list`.`outcome` = 'eqa-1') then (select (to_days(now()) - to_days(`eq_add_list`.`ask_date`))) else '-' end) AS `elapse`,`eq_add_list`.`sign_date` AS `sign_date`,`eq_add_list`.`sign_rsn` AS `sign_rsn` from `eq_add_list` order by `eq_add_list`.`ask_date` desc,(case when (`eq_add_list`.`outcome` = 'eqa-0') then '취소' when (`eq_add_list`.`outcome` = 'eqa-1') then '대기' when (`eq_add_list`.`outcome` = 'eqa-2') then '기각' when (`eq_add_list`.`outcome` = 'eqa-3') then '승인' else 'ERROR' end),`eq_add_list`.`eq_sort` */;

/*View structure for view view_inb_eq */

/*!50001 DROP TABLE IF EXISTS `view_inb_eq` */;
/*!50001 DROP VIEW IF EXISTS `view_inb_eq` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`EBlockMaster`@`%` SQL SECURITY DEFINER VIEW `view_inb_eq` AS select max(`inb`.`inb_no`) AS `inb_no`,max(`inb`.`eq_no`) AS `eq_no`,`eq`.`eq_name` AS `eq_name`,`eq`.`eq_sort` AS `eq_sort`,`inb`.`inb_date` AS `inb_date`,(case `inb`.`inb_state` when 'inb-0' then '대여중' when 'inb-1' then '신청가능' when 'inb-2' then '분실' when 'inb-3' then '파손' when 'inb-4' then '수리중' when 'inb-5' then '반입완료' when 'inb-6' then '폐기' else 'ERROR' end) AS `inb_state`,max(`iol`.`sign_date`) AS `last_date`,(max(`iol`.`sign_date`) - date_format(now(),'%Y-%m-%d')) AS `lapse_day`,(case when (`inb`.`inb_state` in ('inb-0','inb-1','inb-2','inb-3')) then if(isnull(`ioa`.`ask_eno`),`iol`.`ask_eno`,`ioa`.`ask_eno`) when (`inb`.`inb_state` in ('inb-4','inb-5','inb-6')) then `ioa`.`sign_eno` else (case `ioa`.`ask_eno` when NULL then 'None' else 'ERROR' end) end) AS `last_eno`,`e`.`e_name` AS `last_ename`,`d`.`d_name` AS `last_dname` from ((((`inb_io_list` `iol` left join (`inb_eq` `inb` left join `eq` on((`inb`.`eq_no` = `eq`.`eq_no`))) on((`iol`.`inb_no` = `inb`.`inb_no`))) left join `inb_ioask_list` `ioa` on((`ioa`.`inb_no` = `inb`.`inb_no`))) left join `emp` `e` on((`e`.`e_no` = `iol`.`ask_eno`))) left join `dept` `d` on((`d`.`d_no` = `e`.`d_no`))) group by (case `inb`.`inb_state` when 'inb-0' then '대여중' when 'inb-1' then '신청가능' when 'inb-2' then '분실' when 'inb-3' then '파손' when 'inb-4' then '수리중' when 'inb-5' then '반입완료' when 'inb-6' then '폐기' else 'ERROR' end),`eq`.`eq_name`,`eq`.`eq_sort`,`inb`.`inb_date` */;

/*View structure for view view_inb_ioask_eq_emp_dp */

/*!50001 DROP TABLE IF EXISTS `view_inb_ioask_eq_emp_dp` */;
/*!50001 DROP VIEW IF EXISTS `view_inb_ioask_eq_emp_dp` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`EBlockMaster`@`%` SQL SECURITY DEFINER VIEW `view_inb_ioask_eq_emp_dp` AS select `ioa`.`io_ano` AS `io_ano`,`ioa`.`inb_no` AS `inb_no`,`eq`.`eq_sort` AS `eq_sort`,`eq`.`eq_name` AS `eq_name`,`e1`.`e_no` AS `ask_eno`,`e1`.`e_name` AS `ask_ename`,`d1`.`d_name` AS `ask_dname`,`ioa`.`ask_date` AS `ask_date`,(case when (`ioa`.`io_sort` = 'inb-0') then '대여' when (`ioa`.`io_sort` = 'inb-1') then '반납' when (`ioa`.`io_sort` = 'inb-2') then '분실' when (`ioa`.`io_sort` = 'inb-3') then '파손' else 'ERROR' end) AS `io_sort`,(case when (`ioa`.`outcome` = 'ioa-0') then '취소' when (`ioa`.`outcome` = 'ioa-1') then '대기' when (`ioa`.`outcome` = 'ioa-2') then '기각' when (`ioa`.`outcome` = 'ioa-3') then '승인' else 'ERROR' end) AS `outcome`,`e2`.`e_no` AS `sign_eno`,`e2`.`e_name` AS `sign_ename`,`d2`.`d_name` AS `sign_dname`,(case when isnull(`ioa`.`sign_date`) then ' ' else `ioa`.`sign_date` end) AS `sign_date`,`ioa`.`ask_rsn` AS `ask_rsn`,(case `ioa`.`outcome` when 'ioa-0' then '(취소완료)' when 'ioa-1' then '<<-결재 대기중..' else `ioa`.`sign_rsn` end) AS `sign_rsn` from ((((((`inb_ioask_list` `ioa` left join `inb_eq` `inb` on((`ioa`.`inb_no` = `inb`.`inb_no`))) left join `eq` on((`inb`.`eq_no` = `eq`.`eq_no`))) left join `emp` `e1` on((`ioa`.`ask_eno` = `e1`.`e_no`))) left join `emp` `e2` on((`ioa`.`sign_eno` = `e2`.`e_no`))) left join `dept` `d1` on((`e1`.`d_no` = `d1`.`d_no`))) left join `dept` `d2` on((`e2`.`d_no` = `d2`.`d_no`))) */;

/*View structure for view view_purc_eqmk_list */

/*!50001 DROP TABLE IF EXISTS `view_purc_eqmk_list` */;
/*!50001 DROP VIEW IF EXISTS `view_purc_eqmk_list` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`EBlockMaster`@`%` SQL SECURITY DEFINER VIEW `view_purc_eqmk_list` AS select `pe`.`eq_pno` AS `eq_pno`,`pe`.`ask_eno` AS `ask_eno`,`pe`.`ask_date` AS `ask_date`,(case when (`pe`.`outcome` = 'ibp-0') then '취소' when (`pe`.`outcome` = 'ibp-1') then '대기' when (`pe`.`outcome` = 'ibp-2') then '기각' when (`pe`.`outcome` = 'ibp-3') then '승인' when (`pe`.`outcome` = 'ibp-4') then '결제완료' when (`pe`.`outcome` = 'ibp-5') then '입고완료' when (`pe`.`outcome` = 'ibp-6') then '결제철회' else 'ERROR' end) AS `outcome`,(case when (`pe`.`outcome` = 'ibp-1') then (select (to_days(now()) - to_days(`pe`.`ask_date`))) else ' ' end) AS `elapse`,`pe`.`sign_eno` AS `sign_eno`,(case when (`pe`.`outcome` in ('ibp-0','ibp-1')) then ' ' when (`pe`.`outcome` in ('ibp-2','ibp-3','ibp-4','ibp-5')) then `pe`.`sign_date` else 'ERROR' end) AS `sign_date`,`eq`.`eq_sort` AS `eq_sort`,`pe`.`eq_no` AS `eq_no`,`eq`.`eq_name` AS `eq_name`,`eq`.`cost` AS `cost`,`pe`.`num` AS `num`,`pe`.`subtotal` AS `subtotal`,`mk`.`mk_cname` AS `mk_cname`,`mk`.`mk_no` AS `mk_no` from ((`eq_purc_list` `pe` join `eq` on((`pe`.`eq_no` = `eq`.`eq_no`))) join `eq_market` `mk` on((`eq`.`mk_no` = `mk`.`mk_no`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
