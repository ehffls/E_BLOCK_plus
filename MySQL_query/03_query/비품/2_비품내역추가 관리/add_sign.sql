/*
	 비품신청결재권자가 자기자신에게 들어온 신청을 결재하는 업무
    조건에 필요한 내용은,
		  1. 자기자신의 사원번호와 결재사원번호로 등록된 번호가 동일해야함
        2. 접수받은 내용을 목록에서 조회할때 무결된 개별의 내용을 제공하려면 신청번호로 구분해야한다.
        3. 특정 컬럼내용 중에서도 '대기'상태인 컬럼을 '승인' 또는 '기각'으로 일괄변경해야함.
        (화면에서는 선택컬럼 일괄승인/일괄기각하기 로 구현되면 좋을 것 같음)
*/

-- UPDATE ~ SET ~ WHERE ~ 구문은 특정컬럼의 조건으로 다른 컬럼들에 일관된 값을 입력할 수 있다.

-- 다중점조건구문 A IN (a,b,c,d)를 통해 다중결재를 구현하는 쿼리

UPDATE `eq_add_list`
   SET outcome = CASE eq_addno
						  WHEN 7 THEN 'eqa-3' -- 기각일 때
					--   WHEN 7 THEN 'eqa-3' -- 승인일 때
						  ELSE outcome
					   END
	   ,sign_date = DATE_FORMAT(now(), '%Y-%m-%d') /* 2011-06-14 */
      ,sign_rsn = '트리거승인테스트' #{sign_rsn}
 WHERE sign_eno = 10#{e_no} -- 자기자신의 사원번호가 결재사원번호로 등록된 사원번호와 같아야함
   AND eq_addno IN (7,19,20) -- 특정 신청번호로 무결성 확보
;

SELECT * FROM `eq`;

SELECT * FROM `eq_add_list`;

SELECT * FROM `view_eq_add_list`;

SHOW TABLES like '%%';