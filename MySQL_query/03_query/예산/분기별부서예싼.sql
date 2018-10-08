-- 분기별 부서 예산 확인
SELECT qrt_no, d_no, cfw_bg, add_bg, spd_bg, rst_bg
  FROM view_qrt_bg_1
 WHERE d_no = 1231 #{d_no} -- 부서번호
   AND qrt_no >= '18-4-09' #{min_qrt_no} -- 최소 분기
   AND qrt_no <= '18-4-10' #{max_qrt_no} -- 최대 분기
;