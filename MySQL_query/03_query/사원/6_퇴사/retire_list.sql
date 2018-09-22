SELECT
	  rt_no, rt_date, ask_eno, ask_rsn, sign_rsn, sign_eno, outcome, ask_date, sign_date
  FROM `view_retire_ask_list`
 WHERE ask_eno = 5 #{ask_eno}
   AND sign_eno = 3 #{sign_eno}
   AND outcome = '승인' #{outcome}
   AND ask_date >= '2018-09-01' #{pre_ask_date}
   AND ask_date <= '2018-10-01' #{post_ask_date}