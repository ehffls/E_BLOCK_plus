-- 본인한테 신청온 내역을 처리하기
UPDATE `attd_list`
   SET sign_rsn  = '승인합니다.' #{sign_rs}
   ,sign_date = DATE_FORMAT(now(), '%Y-%m-%d') #{sign_date}
   ,outcome   = 'atd-3' #{sign_rs} -- 승인일때 3 / 기각일때 2
 WHERE at_no = 4#{at_no}
   AND sign_eno = 26#{e_no}