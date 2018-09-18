SELECT
	 tg_eno, qrt_no, ev_date, ev_content, ev_score, ratio
  FROM `pev`
 WHERE ev_eno = 2#{ev_eno}
   AND qrt_no >= '18-3'#{prev_qrtno}
   AND qrt_no <= '18-4'#{post_qrtno}