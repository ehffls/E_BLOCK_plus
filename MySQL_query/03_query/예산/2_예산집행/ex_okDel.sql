/*
 비품 18 번
트리거 이용하여 bg_ex_list에 INSERT
*/

UPDATE `eq_purc_list`
   SET outcome = 'ibp-7' -- <!-- ibp-2(기각)|3(승인)|4(결제)|5(입고) -->
          , sign_date = DATE_FORMAT(now(), '%Y-%m-%d') -- <!-- 2011-06-14 -->
 WHERE eq_pno = 1#{eq_no} --  <!-- 철회할 구매요청비품번호 -->
   AND sign_eno = 198#{sign_eno} --  <!-- 결재하는 본인 사원번호 -->
   AND outcome = 'ibp-4'
;