/*
	 비품관련 결재권자가 등록된 비품분류 수정하기
*/

DELETE FROM `EBLOCK`.`eq_sort`
 WHERE eq_sort = '가구';#{eq_sort}
 
 
SELECT eq_sort FROM `EBLOCK`.`eq_sort`;
