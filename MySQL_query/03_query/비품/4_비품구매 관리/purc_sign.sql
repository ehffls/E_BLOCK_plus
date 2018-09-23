/*
	 비품구매신청 결재하기 (결재권자)
*/

UPDATE `eq_purc_list`
   SET outcome = 'ibp-3'#{new_num} -- <!-- ibp-2(기각)/ibp-3(승인) -->
	  , sign_date = DATE_FORMAT(now(), '%Y-%m-%d') -- <!-- 2011-06-14 -->
 WHERE eq_pno = 1#{eq_no} --  <!-- 결재할 구매요청비품번호 -->
   AND sign_eno = 198#{sign_eno} --  <!-- 결재하는 본인 사원번호 -->
;

SELECT * FROM `view_purc_eqmk_list`;