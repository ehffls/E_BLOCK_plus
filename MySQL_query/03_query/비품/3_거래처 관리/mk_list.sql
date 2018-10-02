/*
	 비품 거래처를 조회하는 쿼리
*/

SELECT
	 mk_no, mk_cname, mk_ename, mk_ph, mk_fax, mk_email
  FROM `eq_market`
 WHERE UPPER(mk_cname) LIKE CONCAT('%',UPPER('t'),'%')
   AND UPPER(mk_ename) LIKE CONCAT('%','test','%')
	 -- UPPER(Column|String) : 파라미터의 컬럼값 혹은 문자열의 영문을 대문자로 반환
    -- CONCAT(arg1,arg2,..) : 파라미터의 문자들을 합쳐서 하나의 문자열로 반환
;