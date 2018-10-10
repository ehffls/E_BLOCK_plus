DELIMITER $$
-- SQL최종종료 문자를 $로 지정하여 다음 DELIMITER를 만나기 전까지 일괄실행하겠다는 의미
DROP TRIGGER IF EXISTS `trg_pev_upd`;
CREATE TRIGGER `trg_pev_upd`
    AFTER	# trigger_time: { BEFORE | AFTER }
    UPDATE	# trigger_event: { INSERT | UPDATE | DELETE }
    ON `pev`# TABLE REFERENCE
    FOR EACH ROW 
	 -- MySQL은 실행문(BEGIN~END사이 IF문으로 해결)
BEGIN
	INSERT INTO `pev_list`(pev_lno, qrt_no, ev_eno, tg_eno, ev_date, ev_content, ev_score, ratio)
	    VALUES (nextSeqVal('seq_pev_lno')
			  ,OLD.qrt_no
	        ,OLD.ev_eno
	        ,OLD.tg_eno
	        ,OLD.ev_date
	        ,OLD.ev_content
	        ,OLD.ev_score
	        ,OLD.ratio)
END $$ -- 지정한 문자로 최종종료됨을 알림
DELIMITER ;

