-- at_days는 시작일자와 종료일자를 이용하여 계산 후 입력
INSERT INTO attd_list(at_no, ask_eno, d_no, sign_eno, ask_date, at_sort, ask_rsn, at_sdate, at_fdate, at_days, outcome)
SELECT 
	nextSeqVal('seq_at_no')
	,205#{e_no}
    ,1211#{d_no}
    ,`emp`.e_no
	,DATE_FORMAT(now(), '%Y-%m-%d')  /* 2011-06-14 */
    ,'atd-d'#{at_sort} /*atd-a(야근)|atd-b(외근)|atd-c(출장)|atd-d(휴가)*/
	,'쉬고싶습니다'#{at_rsn}
    ,'2018-10-01'#{at_sdate}
    ,'2018-10-12'#{at_fdate}
    ,12#{at_days}
    ,'atd-1'#{outcome} /*대기*/
  FROM `emp`
 WHERE au_no = 25
   AND d_no = 1211#{d_no}
 ORDER BY e_rank desc
 LIMIT 1 -- 9001번 부서 최고관리자에게 신청
;