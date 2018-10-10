DELIMITER $$
-- SQL최종종료 문자를 $로 지정하여 다음 DELIMITER를 만나기 전까지 일괄실행하겠다는 의미
DROP TRIGGER IF EXISTS `trg_pev_add`;
CREATE TRIGGER `trg_pev_add`
    AFTER	# trigger_time: { BEFORE | AFTER }
    INSERT	# trigger_event: { INSERT | UPDATE | DELETE }
    ON `pev`# TABLE REFERENCE
    FOR EACH ROW 
	 -- MySQL은 실행문(BEGIN~END사이 IF문으로 해결)
BEGIN
	INSERT INTO `pev_list`(pev_lno, qrt_no, ev_eno, tg_eno, ev_date, ev_content, ev_score, ratio)
	VALUES (nextSeqVal('seq_pev_lno')
			  ,NEW.qrt_no
	        ,NEW.ev_eno
	        ,NEW.tg_eno
	        ,NEW.ev_date
	        ,NEW.ev_content
	        ,NEW.ev_score
	        ,NEW.ratio)
END $$ -- 지정한 문자로 최종종료됨을 알림
DELIMITER ;

