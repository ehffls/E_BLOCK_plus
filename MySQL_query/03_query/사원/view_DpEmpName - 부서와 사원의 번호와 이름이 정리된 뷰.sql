-- 뷰 생성
CREATE OR REPLACE VIEW view_DpEmpName AS
SELECT 
     dp.d_no   AS 'd_no' 	-- 부서번호
	 ,dp.d_name AS 'd_name'	-- 부서이름
	 ,em.e_no   AS 'e_no' 	-- 사원번호
    ,em.e_name AS 'e_name'	-- 사원이름
    ,em.e_rank AS 'e_rank' -- 사원직급
  FROM dept dp, emp em
 WHERE dp.d_no = em.d_no;