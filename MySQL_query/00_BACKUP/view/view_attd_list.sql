-- 근태분류, 신청결과를 한글 출력하고 결재일자와 사유가 아직 안적힌 상태일땐 빈칸으로 출력 
CREATE OR REPLACE VIEW view_attd_list AS
    SELECT 
        `attd_list`.`at_no` AS `at_no`,
        `attd_list`.`ask_eno` AS `ask_eno`,
        `attd_list`.`d_no` AS `d_no`,
        (SELECT 
                `emp`.`e_name`
            FROM
                `emp`
            WHERE
                (`emp`.`e_no` = `attd_list`.`ask_eno`)) AS `ask_ename`,
        `attd_list`.`ask_date` AS `ask_date`,
        (CASE
            WHEN (`attd_list`.`at_sort` = 'atd-a') THEN '야근'
            WHEN (`attd_list`.`at_sort` = 'atd-b') THEN '외근'
            WHEN (`attd_list`.`at_sort` = 'atd-c') THEN '출장'
            WHEN (`attd_list`.`at_sort` = 'atd-d') THEN '휴가'
			ELSE 'ERROR'
        END) AS `at_sort`,
        `attd_list`.`ask_rsn` AS `ask_rsn`,
        `attd_list`.`at_sdate` AS `at_sdate`,
        `attd_list`.`at_fdate` AS `at_fdate`,
        `attd_list`.`at_days` AS `at_days`,
        (CASE
            WHEN (`attd_list`.`outcome` = 'atd-0') THEN '취소'
            WHEN (`attd_list`.`outcome` = 'atd-1') THEN '대기'
            WHEN (`attd_list`.`outcome` = 'atd-2') THEN '기각'
            WHEN (`attd_list`.`outcome` = 'atd-3') THEN '승인'
			ELSE 'ERROR'
        END) AS `outcome`,
        `attd_list`.`sign_eno` AS `sign_eno`,
        (SELECT 
                `emp`.`e_name`
            FROM
                `emp`
            WHERE
                (`emp`.`e_no` = `attd_list`.`sign_eno`)) AS `sign_ename`,
        (CASE
            WHEN (`attd_list`.`outcome` IN ('atd-0' , 'atd-1')) THEN ' '
            WHEN (`attd_list`.`outcome` IN ('atd-2' , 'atd-3')) THEN `attd_list`.`sign_rsn`
            ELSE 'ERROR'
        END) AS `sign_rsn`,
        (CASE
            WHEN (`attd_list`.`outcome` IN ('atd-0' , 'atd-1')) THEN ' '
            WHEN (`attd_list`.`outcome` IN ('atd-2' , 'atd-3')) THEN `attd_list`.`sign_date`
            ELSE 'ERROR'
        END) AS `sign_date`
    FROM
        `attd_list`