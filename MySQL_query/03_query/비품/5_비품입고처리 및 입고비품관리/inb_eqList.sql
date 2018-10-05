/*
	 입고비품 중에서 현재 대여가능한 물품을 조회하는 쿼리
    해당 비품의 최종사용자와 최종사용부서, 최종사용일자를 조회할 수 있다.
    현재일자로부터 경과일을 표시할 수 있다.
*/

SELECT
	   inb_no
    , eq_no
    , eq_name
    , eq_sort
	 , inb_state
    , inb_date
	 , last_date
    , CASE lapse_day
		  WHEN 0 THEN '-'
        WHEN 1 THEN CONCAT(lapse_day,' day')
        ELSE CONCAT(lapse_day,' days')
	   END AS 'lapse_day'
    , last_eno
    , last_ename
    , last_dname
FROM
	 `view_inb_eq`
WHERE
	 inb_state = '대여중' #{inb_state}
AND UPPER(eq_name) LIKE UPPER('%x%') -- '%#{inb_state}%'
AND last_date <= '2018-10-31' #{last_date}
AND last_date >= '2018-10-04' #{last_date}
ORDER BY last_date DESC
		  ,eq_sort ASC
        ,eq_name ASC
        ,inb_date DESC
;