/*
	 입고비품에 문제가 생기게될 경우,
    비품을 외부로 수리를 보내어야하고		(수리반출|inb-4)
    수리가 끝났을 때 다시 반입되어야하며 	(반입완료|inb-5)
    사용할 수 없는 경우, 폐기처리해야한다.(폐기처리|inb-6)
    
    이 업무는 결재권자의 처리로 진행되는 별도의 과정이기 때문에,
    비품입출신청내역(inb_ioask_list)을 거치는 업무가 아니다.
    
    입고비품(inb_eq)에 상태가 변경되고나서
    비품입출내역(inb_io_list)에 이력이 바로 추가되고
    이때 신청사원번호에 결재권자의 번호가 남으면 되며,
    수정과 입력 두 과정이 모두 성공했을때 반영하도록 트랜잭션처리를 하고자한다.
    
    아래는 위 업무(입고비품상태관리)를 구현한 프로시저이다.
*/

-- 프로시저 생성

DELIMITER $$
-- SQL최종종료 문자를 $로 지정하여 다음 DELIMITER를 만나기 전까지 일괄실행하겠다는 의미
-- MySQL5.5는 CREATE OR REPLACE를 지원하지 않음. (8.0부터 지원)
DROP PROCEDURE IF EXISTS `proc_inb_change`;
CREATE PROCEDURE `proc_inb_change`
	 (IN	p_inb_no	 	NUMERIC(5) -- 변경하는 대상 입고비품번호
    ,IN  p_inb_state	VARCHAR(5) -- 변경하는 비품상태 [inb-4(수리반출)|inb-5(반입완료)|inb-6(폐기)]
    ,IN	p_adm_eno 	NUMERIC(6) -- 변경하는 결재사원번호
	 ,OUT RESULT 	 	INT		  -- 결과값
    )
/*
	 @DESCRIPTION
		 inb_eq(입고비품) 테이블에 비품의 변동사항 반영처리(update)하고 
       [ 수리반출(inb-4),반입완료(inb-5),폐기처리(inb-6) ]
       
		 동일한 정보와 결제한 사원정보로 inb_io_list(비품반출내역)에 입력까지
		 처리후 마지막 1번만 커밋하는 트랜잭션처리을 수행
	 @PARAM
		 p_inb_no  : 상태를 변경할 입고비품번호
		 p_adm_eno : 상태를 변경하는 결재사원번호
	 @RETURN
		 RESULT : 성공( 1) : 트랜잭션 성공
				  , 실패( 0) : 예외처리(SQLException)
              , 에러(-1) : 4,5,6번 외 다른 상태값이 들어온 경우
              , 에러(-2) : 권한이 없는 사원이 입력된 경우
*/
/* 바깥쪽 구문 시작 */
BEGIN
		  -- 변수선언(날짜)
	 DECLARE var_date VARCHAR(10);
		  -- 변수선언(변경권한이 있는지 체크)
    DECLARE var_checkAuth BOOLEAN DEFAULT FALSE;
		  -- 변수선언(에러체크)
	 DECLARE var_isErrorDetected BOOLEAN DEFAULT FALSE;

	 -- 두 테이블에 동일하게 넣을 날짜값 초기화
	 SET @var_date = DATE_FORMAT(now(), '%Y-%m-%d'); -- '2018-10-26'

/* 안쪽 구문 시작 */
body_area:
BEGIN
	-- 만약 SQL예외라면 ROLLBACK 처리한다.
	 DECLARE exit handler for SQLEXCEPTION
		  BEGIN
				ROLLBACK;        
				SET RESULT = 0; -- 예외결과값 초기화
		  END;

	 -- 만약 비품상태관리 및 폐기권한이 없는 경우 프로시저를 탈출한다.
	 SET @var_checkAuth 
		   = EXISTS(SELECT e_name FROM `emp`	-- 권한이 있는지 조회하여 결과를 저장
					    WHERE au_no = 39 		  	-- 비품상태관리및폐기권한 번호
						   AND e_no = p_adm_eno); 	-- 입력된 결재사원번호
	 IF NOT @var_checkAuth
		  THEN LEAVE body_area; -- 안쪽 구문을 탈출
	 END IF;

	 -- 트랜젝션 시작
	 START TRANSACTION;
    
	 -- inb-4(수리반출)|inb-5(반입완료)|inb-6(폐기) 에 대해서만 발동하는 프로시저
	 IF p_inb_state IN ('inb-4','inb-5','inb-6') THEN
   
		  -- 입고비품 테이블에 대상 비품의 상태를 수정한다.
		  UPDATE `inb_eq` 
		  SET inb_date  = @var_date	-- 변수호출(날짜)
		     ,inb_state = p_inb_state	-- 파라미터호출(비품상태) [inb-4(수리반출)|inb-5(반입완료)|inb-6(폐기)]
		  WHERE
				inb_no    = p_inb_no		-- 파라미터호출(변경하는 대상 입고비품번호)
		  ;

		  -- 입고비품입출관리 테이블에 비품의 상태이력을 추가한다. (요청사원번호에 결재권자의 번호가 들어감)
        INSERT INTO `inb_io_list`
        ( io_no, inb_state, sign_date, inb_no, ask_eno )
        VALUES
        ( nextSeqVal('seq_io_no') -- 새 등록을 위한 시퀀스호출 후 입력
		  , inb_state = p_inb_state -- 파라미터호출(비품상태) [inb-4(수리반출)|inb-5(반입완료)|inb-6(폐기)]
		  , sign_date = @var_date 	 -- 변수호출(날짜)
        , inb_no    = p_inb_no	 -- 파라미터호출(변경하는 대상 입고비품번호)
        , ask_eno   = p_adm_eno 	 -- 파라미터호출(변경하는 결재사원번호)
		  );
	 
    -- 3가지 값 제외한 다른 값을 파라미터로 입력한 경우 모두 에러로 반환
    ELSE
		  SET @var_isErrorDetected = TRUE; -- 변수호출(에러체크) 후 참값 초기화
		  LEAVE body_area; -- 안쪽구문 탈출
	 END IF;
    
	 -- 문제없이 수정 및 삽입되면 커밋
	 COMMIT;
	 SET RESULT = 1; -- 성공결과값 초기화
/* 안쪽 구문 종료 */
END; 

	 IF @var_isErrorDetected THEN
		  SET RESULT = -1; -- 에러결과값 초기화
        
	 ELSEIF NOT @var_checkAuth THEN
		  SET RESULT = -2; -- 에러결과값 초기화
        
	 END IF;
 
/* 바깥쪽 구문 종료 */
END $$ -- 지정한 문자로 최종종료됨을 알림
DELIMITER ;
