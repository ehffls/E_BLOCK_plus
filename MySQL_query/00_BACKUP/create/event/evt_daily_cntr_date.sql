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
