CREATE OR REPLACE VIEW view_bg_ex_list AS
    SELECT 
        `bg_ex_list`.`be_no` AS `be_no`,
        `bg_ex_list`.`d_no` AS `d_no`,
        (SELECT 
                `dept`.`d_name`
            FROM
                `dept`
            WHERE
                (`dept`.`d_no` = `bg_ex_list`.`d_no`)) AS `d_name`,
        `bg_ex_list`.`ex_eno` AS `ex_eno`,
        (SELECT 
                `emp`.`e_name`
            FROM
                `emp`
            WHERE
                (`emp`.`e_no` = `bg_ex_list`.`ex_eno`)) AS `ex_ename`,
		(CASE
            WHEN (`bg_ex_list`.`ex_sort` = 'bg-a') THEN '부서'
            WHEN (`bg_ex_list`.`ex_sort` = 'bg-b') THEN '비품'
            WHEN (`bg_ex_list`.`ex_sort` = 'bg-c') THEN '급여'
            ELSE 'ERROR'
        END) AS `ex_sort`,
        `bg_ex_list`.`ex_cash` AS `ex_cash`,
        `bg_ex_list`.`ex_date` AS `ex_date`,
        `bg_ex_list`.`ex_rsn` AS `ex_rsn`,
        (CASE
            WHEN (`bg_ex_list`.`outcome` = 'bg-0') THEN '철회'
            WHEN (`bg_ex_list`.`outcome` = 'bg-1') THEN '집행'
            ELSE 'ERROR'
        END) AS `outcome`
    FROM
        `bg_ex_list`;