SELECT
	  rt_no, ask_date, rt_date, outcome, ask_rsn, sign_rsn, sign_date, ask_eno, sign_eno
  FROM `retire_ask_list`
 WHERE 1=1;
 

-- 퇴사신청 결재하기
/*
	 [outcome]
    rta-0(취소)
	 rta-1(대기)
	 rta-2(기각)
	 rta-3(승인)
*/

UPDATE `retire_ask_list`
SET sign_rsn  = '승인합니다.' #{sign_rs}
   ,sign_date = DATE_FORMAT(now(), '%Y-%m-%d') #{sign_date}
   ,outcome   = 'rta-3' #{sign_rs} -- 승인일때 3 / 기각일때 2
   ;