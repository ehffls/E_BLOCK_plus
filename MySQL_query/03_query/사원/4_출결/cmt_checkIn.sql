-- 시퀀스 조회
SELECT * FROM `sequences`;

INSERT INTO `cmt_list`(cmt_no, e_no, cmt_date, cmt_time)
VALUES(nextSeqVal('seq_cmt_no'), 5#{e_no}
	   ,DATE_FORMAT(now(), '%Y-%m-%d') /* 2011-06-14 */
      ,curtime() /* 19:32:23 */
      )
ON DUPLICATE KEY UPDATE
	    e_no = 3#{e_no}
	   ,cmt_date = DATE_FORMAT(now(), '%Y-%m-%d') /* 2011-06-14 */
      ,cmt_time = curtime() /* 19:32:23 */
;


SELECT * FROM `cmt_list`;