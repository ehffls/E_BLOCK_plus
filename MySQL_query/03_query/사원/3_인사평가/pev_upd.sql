-- pev_upd
-- 인사평가기간에 인사평가 수정하기

SELECT * FROM `pev`;
SELECT * FROM `pev_list`;

UPDATE `pev`
   SET ev_date = DATE_FORMAT(now(), '%Y-%m-%d')
      ,ev_content = 'ㅎㅇㅎㅇ80'#{ev_content}
	   ,ev_score = 99#{ev_content}
 WHERE ev_eno = 2#{ev_eno}
   AND tg_eno = 4#{tg_eno}
   AND qrt_no = CONCAT(date_format(now(),'%y-'),quarter(now()),date_format(now(),'-%m'))
;


18-1-01
18-2-05
18-3-09
18-4-12