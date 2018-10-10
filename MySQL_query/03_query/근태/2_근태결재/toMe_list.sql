-- 신청결과, 근태분류, 신청일자 등으로 조회 가능
SELECT at_no, d_no, ask_eno, ask_ename, ask_date, at_sort, ask_rsn, at_sdate, at_fdate, at_days, outcome, sign_eno, sign_ename, sign_rsn, sign_date 
  FROM `view_attd_list`
 WHERE sign_eno = 26 #{e_no}
    AND ask_eno = 205#{e_no}
    AND d_no = 1211#{d_no} 
    AND d_no = (SELECT d_no FROM `dept` WHERE d_name = '영업1팀') 
    AND outcome = '대기'#{outcome}
    AND at_sort = '휴가'#{at_sort}
    AND ask_date >= '2018-09-27'#{min_date}
    AND ask_date <= '2018-11-27'#{max_date}
ORDER BY ask_date desc, at_no desc
;


-- 신청결과, 근태분류, 신청일자 등으로 조회 가능
SELECT at_no, ask_eno, ask_ename, ask_date, at_sort, ask_rsn, at_sdate, at_fdate, at_days, outcome, sign_rsn, sign_date
  FROM `view_attd_list`
 WHERE sign_eno = 26 #{e_no}
   AND outcome = '대기'#{outcome}
   AND at_sort = '휴가'#{at_sort}
   AND ask_date >= '2018-09-27'#{min_date}
   AND ask_date <= '2018-11-27'#{max_date}
ORDER BY ask_date desc, at_no desc
;