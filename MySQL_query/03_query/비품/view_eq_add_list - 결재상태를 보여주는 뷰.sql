CREATE OR REPLACE VIEW `view_eq_add_list` AS
SELECT
	  eq_addno
	 ,ask_eno
    ,sign_eno
    ,ask_date
	 ,eq_sort
	 ,eq_name
    ,CASE WHEN outcome = 'eqa-0' THEN '취소'
		    WHEN outcome = 'eqa-1' THEN '대기'
          WHEN outcome = 'eqa-2' THEN '기각'
          WHEN outcome = 'eqa-3' THEN '승인'
          ELSE 'ERROR'
	   END AS 'outcome'
	 ,CASE WHEN outcome = 'eqa-1' THEN (SELECT DATEDIFF(now(),ask_date))
		    ELSE '-'
	   END AS 'elapse'
	 ,sign_date
    ,sign_rsn
  FROM `eq_add_list`
 ORDER BY ask_date desc
         ,outcome asc
         ,eq_sort asc
;