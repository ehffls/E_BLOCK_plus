/*
	화면에서 넘겨받아오는 정보	: e_id, e_pw
    화면으로 넘겨보내는 정보 	: e_no | e_name, e_au, d_name
 */
 
-- login_check :: 아이디체크/비밀번호체크/회원명 반환 (일괄처리)

 /*
   최종결과 컬럼명 : resultOut
   a) 'THE ID DOSE NOT EXIST'   -- 아이디 자체가 없는 경우 [-1]
   b) 'PASSWORD DOSE NOT MATCH' -- 아이디만 맞음(비밀번호가 틀린 경우) [1]
   c) 'e_no'            		-- 아이디,비밀번호가 모두 일치하는경우 [2]
  */

SELECT
		CASE( IFNULL((SELECT CASE (SELECT IFNULL((SELECT 1 FROM DUAL
												   WHERE EXISTS (SELECT e_id FROM emp
														   WHERE e_id = 'lantern')),-1)
											 FROM DUAL) -- 아이디있음:1 / 틀림:null >> -1
						  WHEN -1 THEN -1 	-- -1(아이디틀림)은 -1로 치환
						  WHEN  1 THEN (SELECT 2 FROM emp
										 WHERE e_id = 'lantern' AND e_pw = 'fp1026')
						   END	-- 1(아이디있음)은 SQL로 치환 >> 비밀번호 맞음:2 / 틀림:null
				 FROM dual),1))
				 -- null(아이디만 맞음)은 1로 치환
		WHEN -1 THEN 'THE ID DOSE NOT EXIST'  	-- -1(아이디없음)은 아이디가 없다는 문구로 반환
		WHEN  1 THEN 'PASSWORD DOSE NOT MATCH' 	--  1(아이디만 맞음)는 비밀번호가 일치하지 않는다고 반환
		WHEN  2 THEN (SELECT e_no FROM emp		--  2(아이디,비밀번호 둘다맞음)를 회원아이디, 회원번호으로 치환
					  WHERE e_id = 'lantern' AND e_pw = 'fp1026')
		END as 'resultOut'
  FROM DUAL;


SELECT   e.e_no 	e_no
		,e.e_name 	e_name
		,e.au_no 	au_no
		,d.d_name 	d_name
  FROM emp e, dept d
 WHERE e.e_no = 1#{result}-- resultOut에 반환받은 값으로 읽어오기
   AND e.d_no = d.d_no;