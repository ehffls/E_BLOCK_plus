SELECT * FROM `eq_market`;

SELECT default_character_set_name FROM information_schema.SCHEMATA S;

SELECT CCSA.character_set_name FROM information_schema.`TABLES` T,
       information_schema.`COLLATION_CHARACTER_SET_APPLICABILITY` CCSA
WHERE CCSA.collation_name = T.table_collation;



SELECT * FROM information_schema.`COLUMNS` C
WHERE table_schema = "eblock";

SELECT * FROM information_schema.`COLUMNS` C
WHERE table_schema = "eblock"
  AND collation_name IN ('utf8_unicode_ci','utf8_general_ci')
ORDER BY collation_name;





ALTER TABLE information_schema.`COLUMNS`(collation_name)
SET 'utf8_unicode_ci'
WHERE 'utf8_general_ci';



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

