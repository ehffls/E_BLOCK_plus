/*
	 동적쿼리 사용예제
	 ** POW(num1,num2) = num1을 num2만큼 제곱한 숫자를 반환하는 함수
	 ** SQRT(num3) = num3의 제곱근을 반환하는 함수
    
    준비된 동적쿼리문에 순서대로 값을 담음
*/

PREPARE stmt1 FROM 'SELECT SQRT(POW(?,2) + POW(?,2)) AS hypotenuse'; -- 동적쿼리문 객체생성 (자원할당)
SET @a = 3;
SET @b = 4;
EXECUTE stmt1 USING @a, @b; -- 쿼리문 실행 (순서대로 물음표에 대입됨)
DEALLOCATE PREPARE stmt1; -- 동적쿼리문 객체소거 (자원반환)





/*
 쿼리문의 생성을 포함하는 예제
*/

set @v_questid = 1; -- ?자리에 넣을 변수 선언 
set @v_colsql= " where e_no = ? ";
set @v_cntsql = concat("select e_name cnt  from  emp ", @v_colsql) ;
PREPARE stmt1 FROM @v_cntsql ;  -- 동적쿼리문 객체생성 (자원할당)
EXECUTE stmt1 USING @v_questid; -- 동적쿼리 실행
DEALLOCATE PREPARE stmt1;		  -- 동적쿼리문 객체소거 (자원반환)