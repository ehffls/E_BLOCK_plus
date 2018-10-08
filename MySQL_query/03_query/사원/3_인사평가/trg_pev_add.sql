DROP TRIGGER trg_pev_add;
commit;

CREATE TRIGGER trg_pev_add
    AFTER	# trigger_time: { BEFORE | AFTER }
    INSERT	# trigger_event: { INSERT | UPDATE | DELETE }
    ON `pev`# TABLE REFERENCE
    FOR EACH ROW 
-- BEGIN -- MySQL 8.0이상은 BEGIN-END를 선언하지 않습니다.
INSERT INTO `pev_list`(pev_lno, qrt_no, ev_eno, tg_eno, ev_date, ev_content, ev_score, ratio)
VALUES (nextSeqVal('seq_pev_lno')
		  ,NEW.qrt_no
        ,NEW.ev_eno
        ,NEW.tg_eno
        ,NEW.ev_date
        ,NEW.ev_content
        ,NEW.ev_score
        ,NEW.ratio)
-- END -- MySQL 8.0이상은 BEGIN-END를 선언하지 않습니다.
;

