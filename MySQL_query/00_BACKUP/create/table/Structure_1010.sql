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
  `cntr_state` varchar(5) DEFAULT '진행',
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
  `d_no` decimal(4,0) NOT NULL DEFAULT '0',
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
  UNIQUE KEY `e_id` (`e_id`),
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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
