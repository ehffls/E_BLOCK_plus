/*
	 비품관련 결재권자가 등록된 비품분류 수정하기
*/

UPDATE `EBLOCK`.`eq_sort`
   SET eq_sort = '가구'#{new_eq_sort}
 WHERE eq_sort = '기자재';#{old_eq_sort}
 
 
SELECT eq_sort FROM `EBLOCK`.`eq_sort`;