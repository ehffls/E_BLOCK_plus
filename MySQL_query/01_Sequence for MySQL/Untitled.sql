SELECT * FROM `eq_market`;

SELECT default_character_set_name FROM information_schema.SCHEMATA S;

SELECT CCSA.character_set_name FROM information_schema.`TABLES` T,
       information_schema.`COLLATION_CHARACTER_SET_APPLICABILITY` CCSA
WHERE CCSA.collation_name = T.table_collation;



SELECT collation_name FROM information_schema.`COLUMNS` C
WHERE table_schema = "eblock";

SELECT * FROM information_schema.`COLUMNS` C
WHERE table_schema = "eblock"
  AND collation_name IN ('utf8_unicode_ci','utf8_general_ci')
  and table_name Like ('view_%')
ORDER BY collation_name;


select * FROM emp where au_no IS NULL;


show create table USER_INFO;

ALTER TABLE information_schema.`COLUMNS`(collation_name)
SET 'utf8_unicode_ci'
WHERE 'utf8_general_ci';

SHOW VARIABLES LIKE '%char%';

SHOW COLLATION LIKE 'utf8_general_ci';

ALTER SCHEMA `eblock`  DEFAULT COLLATE utf8_unicode_ci ;


	 ALTER TABLE `auth` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `attd_list` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `bg_ex_list` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `cmt_list` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `cntr_list` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `comp` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `dept` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `emp` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `eq` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `eq_add_list` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `eq_market` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `eq_purc_list` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `eq_sort` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `inb_eq` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `inb_ioask_list` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `inb_io_list` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `inb_io_list` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `multiple` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `pev` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `pev_list` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `qrt_bg` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `retire_ask_list` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `sal_pay_list` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	 ALTER TABLE `sequences` CHARACTER SET utf8 COLLATE utf8_unicode_ci;











SELECT LOCATE(_utf8"n" COLLATE utf8_general_ci,
                     _utf8"München" COLLATE utf8_general_ci) AS locate;
SELECT LOCATE(_utf8"ü" COLLATE utf8_general_ci,
                     _utf8"München" COLLATE utf8_general_ci) AS locate;
SELECT LOCATE(_utf8"u" COLLATE utf8_general_ci,
                     _utf8"München" COLLATE utf8_general_ci) AS locate;
                     
CREATE TEMPORARY TABLE test
       (text VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci);
INSERT INTO test VALUES("München");
SELECT text FROM test WHERE text LIKE "%u%";
SELECT LOCATE("u", text) AS locate FROM test WHERE text LIKE "%u%"; 


 SHOW WARNINGS;


SHOW SESSION VARIABLES LIKE 'character\_set\_%';
SHOW SESSION VARIABLES LIKE 'collation\_%';





# For each database:
ALTER DATABASE database_name CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
# For each table:
ALTER TABLE table_name CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
# For each column:
ALTER TABLE table_name CHANGE column_name column_name VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
# (Don’t blindly copy-paste this! The exact statement depends on the column type, maximum length, and other properties. The above line is just an example for a `VARCHAR` column.)


SET collation_connection = 'utf8_unicode_ci';

SELECT cash, in_cash FROM tb_cash where svc_inst_no = @tid and cash_attr_no = @cashAttrNo COLLATE utf8_unicode_ci ;






SET collation_connection = 'utf8_unicode_ci' ;




ALTER TABLE `eq_add_list` CHANGE ask_date ask_date VARCHAR(10)
CHARACTER SET utf8_unicode_ci COLLATE utf8_unicode_ci;