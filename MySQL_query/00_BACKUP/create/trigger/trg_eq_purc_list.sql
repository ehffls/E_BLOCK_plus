 /*
	 eq_purc_list(비품구매신청내역)에 승인된 건이
    결재권자에 의해 결제('ibp-4')되었을때,
    bg_ex_list(예산집행내역)에 자동으로 추가(insert)되는 기능을 수행하고
    
    결재권자에 의해 입고('ibp-5')되었을때,
    inb_eq(입고비품)에 자동으로 보관('inb-1')상태로 추가(insert)되는 기능을 수행하고,
    동시에 inb_io_list(비품입출내역)에 보관('inb-1')상태로 추가(INSERT)가 되어야하는 트리거
*/

DELIMITER $$
-- SQL최종종료 문자를 $로 지정하여 다음 DELIMITER를 만나기 전까지 일괄실행하겠다는 의미
DROP TRIGGER IF EXISTS `trg_eq_purc_list`;
CREATE TRIGGER `trg_eq_purc_list`
	 AFTER	# trigger_time: { BEFORE | AFTER }
    UPDATE	# trigger_event: { INSERT | UPDATE | DELETE }
	 ON `eq_purc_list` # TABLE REFERENCE
	 FOR EACH ROW
	 -- WHEN (outcome = 'ibp-3') : 오라클에서만 적용가능한 비표준쿼리
	 -- MySQL은 실행문(BEGIN~END사이 IF문으로 해결)
BEGIN
	 -- new.column : 트리거가 걸린 테이블의 컬럼의 새 값
	 -- old.column : 트리거가 걸린 테이블의 컬럼의 기존 값
	 
    -- 선언 및 초기화
    DECLARE var_inb_no integer; -- 시퀀스변수선언
    DECLARE var_date varchar(10); -- 날짜변수선언
    SET @var_inb_no := nextSeqVal('seq_inb_no'); -- 입고비품테이블의 다음시퀀스번호 초기화	 
    SET @var_date := DATE_FORMAT(now(), '%Y-%m-%d'); -- '2018-10-26'
    
    -- 값을 선언하여 사용하고자한 목적
    -- 입고(ibp-5)시 실행될 2개의 쿼리가 각각 실행되는 사이 시간동안
    -- 다른 요청으로 처리가 병행되는 경우 생길수 있는 에러 혹은 데이터의 관계오류를 방지하고자함
    
    -- 결제(ibp-4)
	 IF new.outcome = 'ibp-4' THEN
        -- 예산집행내역 테이블에 집행등록 실행
        INSERT INTO `bg_ex_list` -- 예산집행내역 테이블
		  SET be_no   = nextSeqVal('seq_be_no')		 
		     ,ex_rsn  =(SELECT CONCAT('[결제]',eq_name ,'(',eq_sort,')') -- [결제] 제품이름(제품분류)
								FROM `eq` WHERE eq_no = old.eq_no)
           ,ex_cash = old.subtotal -- 집행금액은 승인된 소계를 가져옴
		     ,ex_date = @var_date	  -- 변수호출(날짜)
           ,d_no 	  =(SELECT d_no FROM `emp` WHERE e_no = old.ask_eno) -- 신청사원의 부서번호
           ,ex_eno  = old.sign_eno -- 결제사원번호
           ,ex_sort = 'bg-b' -- 집행분류 (비품)
           ,outcome = 'bg-1' -- 집행결과 (집행)
		  ;
	 
    -- 입고(ibp-5)
	 ELSEIF new.outcome = 'ibp-5' THEN
		  
        -- 입고비품 테이블에 입고등록 실행
        INSERT INTO `inb_eq` 			-- 입고비품 테이블
		  SET inb_no   = @var_inb_no  -- 변수호출(시퀀스)
		     ,inb_date = @var_date		-- 변수호출(날짜)
           ,eq_no		= old.eq_no
		  ;
           
		  -- 입고비품입출내역 테이블에 최초입고등록 실행
		  INSERT  INTO `inb_io_list`	-- 입고비품입출내역 테이블
		  SET io_no = nextSeqVal('seq_io_no')
          , sign_date = @var_date	-- 변수호출(날짜)
          , inb_no = @var_inb_no 	-- 변수호출(시퀀스)
          , ask_eno = old.sign_eno
		  ;
	  
    END IF; -- End of IF

END $$ -- 지정한 문자로 최종종료됨을 알림
DELIMITER ;

