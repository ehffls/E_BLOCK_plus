DROP TRIGGER `trg_eq_add_permit`;

DELIMITER $
-- SQL최종종료 문자를 $로 지정하여 다음 DELIMITER를 만나기 전까지 일괄실행하겠다는 의미
CREATE TRIGGER `trg_eq_add_permit`
	 AFTER UPDATE
	 ON `eq_add_list`
	 FOR EACH ROW
	 -- WHEN (outcome = 'rta-3') : 오라클에서만 적용가능한 비표준쿼리
	 -- MySQL은 실행문(BEGIN~END사이 IF문으로 해결)
BEGIN
	 /*
		  new.column : 트리거가 걸린 테이블의 컬럼의 새 값
        old.column : 트리거가 걸린 테이블의 컬럼의 기존 값
    */
    -- 승인했을 때
	 IF new.outcome = 'eqa-3' THEN
        INSERT INTO `eq`
		  SET eq_no = nextSeqVal('seq_eq_no')
		     ,eq_sort = old.eq_sort -- 승인된 제품분류
		     ,eq_name = old.eq_name -- 승인된 제품이름
		     ,eq_date = DATE_FORMAT(now(), '%Y-%m-%d')
           ,mk_no = old.mk_no -- 승인된 거래처번호
           ;
    END IF;
END;
$ -- 지정한 문자로 최종종료됨을 알림
DELIMITER ;



SELECT * FROM `eq`;

SELECT * FROM `eq_market`;

show triggers;


-- 1차시도 쿼리

DELIMITER $
-- SQL최종종료 문자를 $로 지정하여 다음 DELIMITER를 만나기 전까지 일괄실행하겠다는 의미
CREATE TRIGGER `trg_eq_add_permit`
	 AFTER UPDATE
	 ON `eq_add_list`
	 FOR EACH ROW
	 -- WHEN (outcome = 'rta-3') : 오라클에서만 적용가능한 비표준쿼리
	 -- MySQL은 실행문(BEGIN~END사이 IF문으로 해결)
BEGIN
	 -- 변수선언
    DECLARE v_sort VARCHAR(5);
    DECLARE v_name VARCHAR(50);
    -- 승인했을 때
	 IF (NEW.outcome = 'eqa-3') THEN
		  SET v_sort = OLD.eq_sort; -- 승인된 로우의 이전 비품분류값 담기
		  SET v_name = old.eq_name; -- 승인된 로우의 이전 비품분류이름 담기
        INSERT INTO `eq`
		  SET eq_no = nextSeqVal('seq_eq_no')
		     ,eq_sort = v_sort
		     ,eq_name = v_name
		     ,eq_date = DATE_FORMAT(now(), '%Y-%m-%d');
    END IF;
END;
$ -- 지정한 문자로 최종종료됨을 알림
DELIMITER ;