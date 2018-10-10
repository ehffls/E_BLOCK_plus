/*
	 입고된 비품의 입고번호와 이름을 보여주는 뷰.
    eq(신청가능한 비품)과 inb_eq(입고비품)를 조인해서
    입고된 비품을 입출하는 업무를 위해 , 입고된 비품을 조회할 수 있는 뷰를 만들자.
*/

CREATE OR REPLACE VIEW `view_inb_eq` AS
SELECT
	   MAX(inb.inb_no) AS 'inb_no'		-- 입고번호
    , MAX(inb.eq_no)	AS 'eq_no'		-- 비품번호
    , eq.eq_name		AS 'eq_name'	-- 비품이름
    , eq.eq_sort		AS 'eq_sort'	-- 비품분류
    , inb.inb_date	AS 'inb_date'	-- 입고일자
    , CASE inb.inb_state
		  WHEN 'inb-0' THEN '대여중'
		  WHEN 'inb-1' THEN '신청가능'
		  WHEN 'inb-2' THEN '분실'
		  WHEN 'inb-3' THEN '파손'
		  WHEN 'inb-4' THEN '수리중'
		  WHEN 'inb-5' THEN '반입완료'
		  WHEN 'inb-6' THEN '폐기'
        ELSE 'ERROR'
	   END AS 'inb_state'	-- 비품상태
    , MAX(iol.sign_date)  AS 'last_date' -- 변동일자
    , MAX(iol.sign_date) - DATE_FORMAT(now(), '%Y-%m-%d') AS 'lapse_day' -- 경과일자
    ,	CASE 
		  WHEN inb.inb_state IN ('inb-0','inb-1','inb-2','inb-3')
				THEN IF(ioa.ask_eno IS NULL -- 대여/신청가능(반납완료)/분실/파손 일때는 신청사원번호 
					    ,iol.ask_eno -- 대여이력이 없으면 결재사원번호
						 ,ioa.ask_eno)
        WHEN inb.inb_state IN ('inb-4','inb-5','inb-6')
				THEN ioa.sign_eno	-- 수리중/반입완료/폐기일때는 결재자번호
        ELSE (CASE ioa.ask_eno 
					 WHEN NULL THEN 'None'
					 ELSE 'ERROR' END)
	   END 		AS 'last_eno' 	-- 최종변동 사원번호
	 , e.e_name AS 'last_ename'-- 최종변동 사원이름
    , d.d_name AS 'last_dname'-- 최종변동 부서번호

FROM
	 `inb_eq` inb
		  /* 입고비품으로부터 비품의 상태정보를 찾기 위한 조인 */
        LEFT JOIN `eq` eq
		  ON inb.eq_no = eq.eq_no
        RIGHT JOIN `inb_io_list` iol
        ON iol.inb_no = inb.inb_no
        LEFT JOIN `inb_ioask_list` ioa
        ON ioa.inb_no = inb.inb_no
        /* 입고비품내역으로부터 사원집합과 부서집합까지 찾기위한 조인 */
        LEFT JOIN `emp` e
        ON e.e_no = iol.ask_eno
        LEFT JOIN `dept` d
        ON d.d_no = e.d_no
GROUP BY
	  inb_state
    ,eq_name
    ,eq_sort
    ,inb_date
;
