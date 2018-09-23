/*
	 비품추가신청이 승인이되면 트리거를 통해 비품(구매가능)내역 테이블(eq)에
    해당 비품이 추가가 된다. 이때, 가격정보는 입력되지 않으므로, 관리자가 조회하여 입력해야하므로
    가격정보(cost)값이 없는(null)인 로우를 조회하여 반환하는 쿼리
*/

SELECT
	 eq_no, eq_sort, eq_name, cost, eq_date, mk_no
  FROM `eq`
 WHERE cost IS NULL;