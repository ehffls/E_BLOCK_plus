SELECT
	 rt_no, ask_date, rt_date, outcome, ask_rsn, sign_rsn, sign_date, ask_eno, sign_eno
  FROM `retire_ask_list`;


INSERT INTO `retire_ask_list`
(rt_no, ask_date, rt_date, outcome, ask_rsn, ask_eno, sign_eno)
VALUES(nextSeqVal('seq_rt_no')
           ,DATE_FORMAT(now(), '%Y-%m-%d') #{ask_date} /* 2011-06-14 */
      ,'2018-10-26' #{rt_date}
      ,'rta-1' #{outcome}
      ,'퇴사신청합니다'#{ask_rsn}so
      ,9#{ask_eno}
      ,4#{sign_eno}
      )
