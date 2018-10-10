
-- 뷰 속에 서브쿼리 사용 불가능 5.7이상부터 사용가능
CREATE OR REPLACE VIEW view_qrt_bg AS
SELECT qrt_no, d_no, cfw_bg, add_bg, spd_bg, cfw_bg+add_bg-spd_bg AS 'rst_bg' FROM(
	SELECT qrt_no, d_no,
			SUM(IF(ex_sort='bg-d', IF(outcome='bg-1', ex_cash, -ex_cash), 0)) AS 'cfw_bg' ,
			SUM(IF(ex_sort='bg-a', IF(outcome='bg-1', ex_cash, -ex_cash), 0)) AS 'add_bg' ,
			SUM(IF(ex_sort='bg-b', IF(outcome='bg-1', ex_cash, -ex_cash), 0)) AS 'spd_bg'
	  FROM (
		SELECT CONCAT(date_format(ex_date,'%y-')
							,quarter(now())
								 ,date_format(ex_date,'-%m')) AS 'qrt_no' /* 18-3-09 */ 
		, d_no, ex_sort, ex_cash, outcome
		  FROM `bg_ex_list`
		) `x`
	GROUP BY `qrt_no`, `d_no`
	ORDER BY `d_no`, `qrt_no`
)`a`
;

-- =====================================실제 사용 뷰
CREATE OR REPLACE VIEW view_qrt_bg_1 AS
SELECT qrt_no, d_no,
			SUM(IF(ex_sort='bg-d', IF(outcome='bg-1', ex_cash, -ex_cash), 0)) AS 'cfw_bg' , -- 이월예산
			SUM(IF(ex_sort='bg-a', IF(outcome='bg-1', ex_cash, -ex_cash), 0))
				- SUM(IF(ex_sort='bg-a', IF(outcome='bg-0', ex_cash, -ex_cash), 0)) AS 'add_bg' , -- 부서 추가예산 집행-철회
			SUM(IF(ex_sort='bg-b', IF(outcome='bg-1', ex_cash, -ex_cash), 0))
				- SUM(IF(ex_sort='bg-b', IF(outcome='bg-0', ex_cash, -ex_cash), 0))AS 'spd_bg' , -- 부서 비품구매 집행-철회
            SUM(IF(ex_sort='bg-d', IF(outcome='bg-1', ex_cash, -ex_cash), 0))
				+SUM(IF(ex_sort='bg-a', IF(outcome='bg-1', ex_cash, -ex_cash), 0))
					- SUM(IF(ex_sort='bg-a', IF(outcome='bg-0', ex_cash, -ex_cash), 0))
                -SUM(IF(ex_sort='bg-b', IF(outcome='bg-1', ex_cash, -ex_cash), 0))
					- SUM(IF(ex_sort='bg-b', IF(outcome='bg-0', ex_cash, -ex_cash), 0)) AS 'rst_bg' -- 잔여예산
	  FROM view_qrt_bg_sub
	GROUP BY `qrt_no`, `d_no`
;

CREATE OR REPLACE VIEW view_qrt_bg_sub AS
SELECT CONCAT(date_format(ex_date,'%y-')
							,quarter(now())
								 ,date_format(ex_date,'-%m')) AS 'qrt_no' /* 18-3-09 */ 
		, d_no, ex_sort, ex_cash, outcome
		  FROM `bg_ex_list`
;
-- =====================================




-- 뷰 - 뷰 - 뷰 그냥 뷰-뷰 쓰기로 함
CREATE OR REPLACE VIEW view_qrt_bg AS
SELECT qrt_no, d_no, cfw_bg, add_bg, spd_bg, cfw_bg+add_bg-spd_bg AS 'rst_bg' 
  FROM view_qrt_bg_1
;

CREATE OR REPLACE VIEW view_qrt_bg_1 AS
SELECT qrt_no, d_no,
			SUM(IF(ex_sort='bg-d', IF(outcome='bg-1', ex_cash, -ex_cash), 0)) AS 'cfw_bg' ,
			SUM(IF(ex_sort='bg-a', IF(outcome='bg-1', ex_cash, -ex_cash), 0)) AS 'add_bg' ,
			SUM(IF(ex_sort='bg-b', IF(outcome='bg-1', ex_cash, -ex_cash), 0)) AS 'spd_bg' ,
	  FROM view_qrt_bg_sub
	GROUP BY `qrt_no`, `d_no`
;

CREATE OR REPLACE VIEW view_qrt_bg_sub AS
SELECT CONCAT(date_format(ex_date,'%y-')
							,quarter(now())
								 ,date_format(ex_date,'-%m')) AS 'qrt_no' /* 18-3-09 */ 
		, d_no, ex_sort, ex_cash, outcome
		  FROM `bg_ex_list`
;
