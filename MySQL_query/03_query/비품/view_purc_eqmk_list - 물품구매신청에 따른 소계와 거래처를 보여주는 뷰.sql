/*
	 비품(구매가능)내역으로부터 구매신청접수가 된 물품의 내역을
    비품테이블과 거래테이블에 조인시켜서 하나의 뷰로 만든 쿼리
*/

CREATE OR REPLACE VIEW `view_purc_eqmk_list` AS
SELECT
	   pe.eq_pno 	 AS 'eq_pno'
	 , pe.ask_eno	 AS 'ask_eno'
	 , pe.ask_date	 AS 'ask_date'
    , (CASE WHEN pe.outcome='ibp-0' THEN '취소'
		      WHEN pe.outcome='ibp-1' THEN '대기'
            WHEN pe.outcome='ibp-2' THEN '기각'
		      WHEN pe.outcome='ibp-3' THEN '승인'
            ELSE 'ERROR'
		  END) AS 'outcome'
	 , (CASE WHEN pe.outcome='ibp-1' THEN
					 (SELECT TO_DAYS(NOW()) - TO_DAYS(pe.ask_date))
				ELSE ' ' -- 대기외 취소,기각,승인된 건은 스페이스1개를 반환
		  END) AS 'elapse' -- 대기요청의 경과시간을 알려줌
    , pe.sign_eno	 AS 'sign_eno'
    , (CASE WHEN pe.outcome IN ('ibp-0','ibp-1') THEN ' '
				WHEN pe.outcome IN ('ibp-2','ibp-3') THEN pe.sign_date
				ELSE 'ERROR'
		  END) AS 'sign_date'
    , pe.eq_sort	 AS 'eq_sort'
    , pe.eq_no		 AS 'eq_no'
    , eq.eq_name	 AS 'eq_name'
    , eq.cost		 AS 'cost'
    , pe.num		 AS 'num'
    , pe.subtotal	 AS 'subtotal'
    , mk.mk_cname  AS 'mk_cname'
	 , mk.mk_no		 AS 'mk_no'
  FROM `eq_purc_list` pe INNER JOIN `eq` eq
								 ON pe.eq_no = eq.eq_no
								 INNER JOIN `eq_market` mk 
								 ON eq.mk_no = mk.mk_no
;


-- 테스트
SELECT * FROM `view_purc_eqmk_list`;