/*
	 eq_add_list(비품추가신청내역)에 신청된 건이
    결재권자에 의해 승인('eqa-3')되었을때,
    eq(구매가능한_비품)에 자동으로 추가(insert)되는 트리거
*/

DELIMITER $
-- SQL최종종료 문자를 $로 지정하여 다음 DELIMITER를 만나기 전까지 일괄실행하겠다는 의미
DROP TRIGGER IF EXISTS `trg_eq_add_permit`;
CREATE TRIGGER `trg_eq_add_permit`
	 AFTER UPDATE
	 ON `eq_add_list`
	 FOR EACH ROW
	 -- WHEN (outcome = 'rta-3') : 오라클에서만 적용가능한 비표준쿼리
	 -- MySQL은 실행문(BEGIN~END사이 IF문으로 해결)
BEGIN
-- new.column : 트리거가 걸린 테이블의 컬럼의 새 값
-- old.column : 트리거가 걸린 테이블의 컬럼의 기존 값
    -- 승인했을 때
	 IF new.outcome = 'eqa-3' THEN
        INSERT INTO `eq`
		  SET eq_no = nextSeqVal('seq_eq_no')
		     ,eq_sort = old.eq_sort -- 승인된 제품분류
		     ,eq_name = old.eq_name -- 승인된 제품이름
		     ,eq_date = DATE_FORMAT(now(), '%Y-%m-%d') -- '2018-10-26'
           ,mk_no = old.mk_no -- 승인된 거래처번호
           ;
    END IF;
END;
$ -- 지정한 문자로 최종종료됨을 알림
DELIMITER ;
