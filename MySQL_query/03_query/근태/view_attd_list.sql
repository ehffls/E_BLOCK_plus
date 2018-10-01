-- 근태분류, 신청결과를 한글 출력하고 결재일자와 사유가 아직 안적힌 상태일땐 빈칸으로 출력 
CREATE OR REPLACE VIEW view_attd_list AS
SELECT 
	at_no AS 'at_no' 			-- 신청번호
	,ask_eno   AS 'ask_eno' 	-- 신청사원번호
    ,ask_date AS 'ask_date'		-- 신청일자
    ,CASE
		WHEN at_sort = 'atd-a' THEN '야근'
        WHEN at_sort = 'atd-b' THEN '외근'
        WHEN at_sort = 'atd-c' THEN '출장'
        WHEN at_sort = 'atd-d' THEN '휴가'
	END AS 'at_sort'			-- 결제사
    ,ask_rsn AS 'ask_rsn'		-- 신청사유
    ,at_sdate AS 'at_sdate'		-- 시작일자
	,at_fdate AS 'at_fdate'		-- 종료일자
    ,at_days AS 'at_days'		-- 전체일수
    ,CASE
		WHEN outcome = 'atd-0' THEN '취소'
        WHEN outcome = 'atd-1' THEN '대기'
        WHEN outcome = 'atd-2' THEN '기각'
        WHEN outcome = 'atd-3' THEN '승인' 
	END AS 'outcome'			-- 신청결과
    ,sign_eno AS 'sign_eno'		-- 결제사원번호
    ,CASE
		WHEN outcome IN ('atd-0', 'atd-1') THEN ' '
        WHEN outcome IN ('atd-2', 'atd-3') THEN sign_rsn
	END  AS 'sign_rsn'		-- 결제사유
    ,CASE
		WHEN outcome IN ('atd-0', 'atd-1') THEN ' '
        WHEN outcome IN ('atd-2', 'atd-3') THEN sign_date
    END AS 'sign_date'	-- 결제일자
  FROM attd_list
;