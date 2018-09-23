/*
	 신청사항에 대하여 마이바티스를 경유하지않고 준비하는 동적쿼리 작성 도전하기
    특정컬럼을 조건으로 다른 컬럼의 값을 변경하도록 유도하는 경우는
    일괄변경에 의미가 있음. 그러므로 일괄다중결제하기에 적당한 내용임
*/

UPDATE `eq_add_list`
   SET outcome = 'eqa-0'#{eq_sort} -- 취소는 0, 대기는 1
	   ,eq_sort = (SELECT eq_sort FROM `EBLOCK`.`eq_sort`
                   WHERE eq_sort = '소프트웨어'#{eq_sort}
                   LIMIT 1)
                   -- eq_sort 컬럼은 NotNull이기 때문에,
                   -- 이 값이 조회가 되지 않으면 UPDATE 실행되지 않음.
      ,eq_name = 'TobeSoft Application'
 WHERE eq_addno = 6#{eq_addno}
;

SELECT * FROM `eq_add_list`;

SELECT * FROM `view_eq_add_list`;




