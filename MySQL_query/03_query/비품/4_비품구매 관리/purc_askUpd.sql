/*
	 (자신이 신청한)
    비품구매요청을 수정/삭제하는 쿼리
    
    -수정대상 : 수량(num), 제품분류(eq_sort) 및 제품이름(eq_name)
    -삭제대상 : 결재상태( outcome : ibp-0(취소) / ibp-1(대기:기본값|현재상태) )
    
    신청물품이 다수인 경우를 대비하여,
    일괄처리가 가능하도록 업데이트 구문으로 작성 ( 마이바티스를 이용한 다중동적쿼리로 적용 )
*/

UPDATE `eq_purc_list`
   SET num = 4#{new_num} -- 수량변경
	  , eq_no = 7 #{new_num} -- 변경할 비품번호
     , eq_sort = (SELECT eq_sort FROM `eq` WHERE eq_no = 7)#{new_num} -- 변경할 비품번호
     , subtotal = (SELECT cost FROM `eq` WHERE eq_no = 7)#{new_num} -- 변경할 비품번호
						  *num#{new_num} -- 수량변경
	  , outcome = 'ibp-0'#{new_num} -- ibp-0(취소)/ibp-1(대기)
 WHERE eq_pno = 1#{eq_no} -- 변경할 구매요청비품번호
   AND ask_eno = 8#{ask_eno} -- 변경하는 본인 사원번호
;

SELECT * FROM `eq`;
SELECT * FROM `eq_purc_list`;
SELECT * FROM `view_purc_eqmk_list`;