-- 뷰 생성
CREATE OR REPLACE VIEW view_DpEmpName AS
SELECT 
     dp.d_no   AS 'd_no' 	-- 부서번호
	 ,dp.d_name AS 'd_name'	-- 부서이름
	 ,em.e_no   AS 'e_no' 	-- 사원번호
    ,em.e_name AS 'e_name'	-- 사원이름
    ,CASE 
		  WHEN em.e_rank = 50 THEN '대표'
        WHEN em.e_rank = 40 THEN '부서장'
        WHEN em.e_rank = 30 THEN '차장'
        WHEN em.e_rank = 20 THEN '팀장'
        WHEN em.e_rank = 10 THEN '사원'
        ELSE '인턴'
	   END      AS 'e_rank' -- 사원직급
    ,em.au_no	AS 'au_no'	-- 사원권한
    ,dp.d_ph	AS 'd_ph'	-- 부서연락처
  FROM dept dp, emp em
 WHERE dp.d_no = em.d_no;
 
