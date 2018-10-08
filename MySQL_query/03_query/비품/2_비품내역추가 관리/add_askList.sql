SELECT
	  eq_addno, ask_eno, sign_eno, ask_date, eq_sort
    ,eq_name, outcome, sign_date, sign_rsn
  FROM `view_eq_add_list`
 WHERE ask_eno = 5#{ask_eno}
   AND sign_eno = 10#{sign_eno}
   AND outcome = '대기'#{outcome}
   AND ask_date >= '2018-09-01' #{prev_ask_date}
   AND ask_date <= '2018-11-01' #{post_ask_date}