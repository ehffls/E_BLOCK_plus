CREATE OR REPLACE VIEW `view_inb_eq_detail` AS 
SELECT
  `inb`.`inb_no` AS `inb_no`,
  `inb`.`eq_no` AS `eq_no`,
  `eq`.`eq_name`   AS `eq_name`,
  `eq`.`eq_sort`   AS `eq_sort`,
  (CASE `inb`.`inb_state` WHEN 'inb-0' THEN '대여중' WHEN 'inb-1' THEN '신청가능' WHEN 'inb-2' THEN '분실' WHEN 'inb-3' THEN '파손' WHEN 'inb-4' THEN '수리중' WHEN 'inb-5' THEN '반입완료' WHEN 'inb-6' THEN '폐기' ELSE 'ERROR' END) AS `inb_state`,
  `iol`.`sign_date` AS `last_date`,
  `iol`.`ask_eno` AS `last_eno`,
  `e`.`e_name`     AS `last_ename`,
  `d`.`d_name`     AS `last_dname`
FROM `inb_io_list` `iol`
     LEFT JOIN (`inb_eq` `inb`
		LEFT JOIN `eq`
                ON `inb`.`eq_no` = `eq`.`eq_no`)
     ON `iol`.`inb_no` = `inb`.`inb_no`
     LEFT JOIN `emp` `e`
     ON `e`.`e_no` = `iol`.`ask_eno`
     LEFT JOIN `dept` `d`
     ON `d`.`d_no` = `e`.`d_no`
ORDER BY last_date DESC, inb_no ASC
;