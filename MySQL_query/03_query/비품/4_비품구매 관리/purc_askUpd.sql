/*
	 자신이 신청한 비품구매요청을 수정/삭제하는 쿼리
    -수정대상 : 수량(num), 제품분류(eq_sort) 및 제품이름(eq_name)
    -삭제대상 : 결재상태( outcome : ibp-0(취소) / ibp-1(대기:기본값|현재상태) )
    
    신청물품이 다수인 경우를 대비하여,
    일괄처리가 가능하도록 업데이트 구문으로 작성
*/

UPDATE `eq_purc_list`
	SET num = CASE eq_pno
					 WHEN 1 THEN 3#{new_num}
				    ELSE num -- 
				 END
		,eq_sort = CASE eq_pno
						  WHEN 2 THEN 
						  ELSE eq_sort
					  ELSE
                 END
 WHERE eq_pno IN (1,2,3,4,5,6,7)
;

SELECT * FROM `auth`;

