-- 부서 ,분류, 결과, 가격, 기간에 따른 조건 검색 가능
SELECT be_no, d_no, d_name, ex_eno, ex_ename, ex_sort, ex_cash, ex_date, ex_rsn, outcome
  FROM view_bg_ex_list
 WHERE d_no = 1231 #{d_no}
   AND ex_sort = '비품'#{ex_sort}
   AND outcome = '집행'#{outcome}
   AND ex_cash >= 100000#{min_cash}
   AND ex_cash <= 1000000#{max_cash}
   AND ex_date >= '2018-09-27'#{min_date}
   AND ex_date <= '2018-11-27'#{max_dateeq_purc_listtrg_eq_purc_list}
ORDER BY ex_date desc,be_no desc
;