-- 계약테이블에 계약상태 테이블을 추가
ALTER TABLE `EBLOCK`.`cntr_list`
  ADD cntr_state VARCHAR(4) DEFAULT '진행';

-- 이벤트 생성
DELIMITER body

CREATE EVENT evt_daily_cntr_date
	    ON SCHEDULE EVERY 1 DAY
	    COMMENT '계약만료일 시점이 지난 계약을 갱신합니다.'
	    DO
 BEGIN
       
       -- 현재 날짜보다 이전으로 된 계약만료일을 가진 컬럼들 중, 만료상태로 전환함
	    UPDATE `EBLOCK`.`cntr_list`
		    SET cntr_state = '만료'
	     WHERE cntr_fdate < curdate()
		    AND cntr_state = '진행';
	                
   END body
    
DELIMITER ;



-- 이벤트 확인
SHOW EVENTS;