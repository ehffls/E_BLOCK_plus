 /*
	 inb_ioask_list(비품입출신청내역)에
    결재권자의 결재에 의해 승인('ioa-3')된 내용(대여|반납|파손|분실)이 반영되면(update)
    inb_io_list(비품입출내역)에 자동으로 추가(insert)되는 기능을 수행하고, 이와 동시에
    inb_eq(입고비품)에 자동으로 현재상태가 반영(update)되는 기능을 수행한다.
*/


DELIMITER $$
-- SQL최종종료 문자를 $로 지정하여 다음 DELIMITER를 만나기 전까지 일괄실행하겠다는 의미
DROP TRIGGER IF EXISTS `trg_inb_ioask_list`;
CREATE TRIGGER `trg_inb_ioask_list`
	 AFTER	# trigger_time: { BEFORE | AFTER }
    UPDATE	# trigger_event: { INSERT | UPDATE | DELETE }
	 ON `inb_ioask_list` # TABLE REFERENCE
	 FOR EACH ROW
	 -- WHEN (outcome = 'ibp-3') : 오라클에서만 적용가능한 비표준쿼리
	 -- MySQL은 실행문(BEGIN~END사이 IF문으로 해결)
BEGIN
	 -- new.column : 트리거가 걸린 테이블의 컬럼의 새 값
	 -- old.column : 트리거가 걸린 테이블의 컬럼의 기존 값
	 
    -- 승인(ioa-3)
	 IF new.outcome = 'ioa-3' THEN
    
        -- 비품입출내역(inb_io_list) 테이블 기록추가(INSERT)
        INSERT INTO `inb_io_list`
		  SET io_no     = nextSeqVal('seq_io_no')
		     ,inb_state = old.io_sort -- 승인로우의 입출분류값 [inb- 대여(0)|반납(1)|파손(2)|분실(3)]
           ,sign_date = DATE_FORMAT(now(), '%Y-%m-%d') -- '2018-10-26'
		     ,inb_no    = old.inb_no  -- 승인로우의 입고비품번호
           ,ask_eno	 = old.ask_eno -- 승인로우의 신청사원번호
		  ;
        
        -- 비품입출내역(inb_eq) 테이블 기록최신값 반영(UPDATE)
        UPDATE `inb_eq`
        SET inb_state = old.io_sort -- 승인로우의 입출분류값 [inb- 대여(0)|반납(1)|파손(2)|분실(3)]
        WHERE inb_no = old.inb_no
		  ;
        
    END IF; -- End of IF

END $$ -- 지정한 문자로 최종종료됨을 알림
DELIMITER ;


