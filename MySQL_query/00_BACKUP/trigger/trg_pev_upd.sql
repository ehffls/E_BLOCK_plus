DROP TRIGGER trg_pev_upd;
commit;

CREATE TRIGGER trg_pev_upd
    AFTER	# trigger_time: { BEFORE | AFTER }
    UPDATE	# trigger_event: { INSERT | UPDATE | DELETE }
    ON `pev`# TABLE REFERENCE
    FOR EACH ROW 
-- BEGIN -- MySQL 8.0이상은 BEGIN-END를 선언하지 않습니다.
INSERT INTO `pev_list`(pev_lno, qrt_no, ev_eno, tg_eno, ev_date, ev_content, ev_score, ratio)
    VALUES (nextSeqVal('seq_pev_lno')
		  ,OLD.qrt_no
        ,OLD.ev_eno
        ,OLD.tg_eno
        ,OLD.ev_date
        ,OLD.ev_content
        ,OLD.ev_score
        ,OLD.ratio)
-- END -- MySQL 8.0이상은 BEGIN-END를 선언하지 않습니다.
;
