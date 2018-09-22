
-- 내가 신청한 퇴사신청 조회하기
SELECT
	  rt_no, rt_date, ask_eno, ask_rsn, sign_rsn, sign_eno, outcome, ask_date, sign_date
  FROM `view_retire_ask_list`
 WHERE ask_eno = 5 #{ask_eno}
   AND outcome = '승인' #{outcome}
   AND ask_date >= '2018-09-01' #{pre_ask_date}
   AND ask_date <= '2018-10-01' #{post_ask_date}



-- 기준 뷰 생성
CREATE OR REPLACE VIEW `view_retire_ask_list` AS
SELECT
	   rt_no
     ,rt_date
     ,ask_eno
	  ,ask_rsn
     ,sign_eno
     ,sign_rsn
     ,CASE outcome 
		  WHEN 'rta-0' THEN '취소'
		  WHEN 'rta-1' THEN '대기'
		  WHEN 'rta-2'	THEN '기각'
		  WHEN 'rta-3'	THEN '승인'
        ELSE 'ERROR'
	   END AS 'outcome'
	  ,ask_date
     ,sign_date
  FROM `retire_ask_list`
 ORDER BY CASE
			 WHEN outcome = '취소' THEN 0
			 WHEN outcome = '대기' THEN 1
			 WHEN outcome = '기각' THEN 2
			 WHEN outcome = '승인' THEN 3
			 ELSE 4
		    END ASC;

/*
	 [outcome]
    rta-0(취소)
	 rta-1(대기)
	 rta-2(기각)
	 rta-3(승인)
*/