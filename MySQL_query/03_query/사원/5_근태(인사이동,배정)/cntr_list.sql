SELECT
      e.e_no        AS 'e_no'   -- 사원번호
    , e.e_name      AS 'e_name' -- 사원이름
    , e.d_no        AS 'd_no'   -- 부서번호
    , d.d_name      AS 'd_name' -- 부서이름
    , e.e_jdate     AS 'e_jdate'-- 입사일자
    , e.au_no       AS 'au_no'  -- 권한번호
    , e.note        AS 'e_note' -- 사원비고
    , c.cntr_date   AS 'cntr_date' -- 계약일자
    , c.cntr_sort   AS 'cntr_sort' -- 계약분류
    , c.cntr_sal    AS 'cntr_sal'  -- 계약연봉
    , c.cntr_state  AS 'cntr_state'-- 계약상태
    , c.cntr_sdate  AS 'cntr_sdate'-- 계약시작일자
    , c.cntr_fdate  AS 'cntr_fdate'-- 계약종료일자
    , c.e_rank	    AS 'e_rank'    -- 계약직급
    , c.note 	    AS 'cntr_note' -- 계약비고
FROM
    `emp` e
	LEFT JOIN `cntr_list` c
	ON e.e_no = c.e_no
	LEFT JOIN `dept` d
	ON e.d_no = d.d_no
WHERE c.cntr_state = '진행'
  AND e.e_no = 5
ORDER BY cntr_date DESC
LIMIT 1
;
