/*
    특정컬럼을 조건(신청결과값이 대기인 조건 등)으로 조회결과를 얻고,
    다른 컬럼의 값 여러개를 한번에 변경하도록 유도하는 경우는 일괄변경에 해당..
    마이바티스를 통해 다중업데이트를 적용할 예정
*/

UPDATE `eq_add_list`
   SET outcome = 'eqa-0'#{eq_sort} -- 취소는 eqa-0, 대기는 eqa-1
	   ,eq_sort = (SELECT eq_sort FROM `EBLOCK`.`eq_sort`
                   WHERE eq_sort = '소프트웨어'#{eq_sort}
                   LIMIT 1)
                   -- eq_sort 컬럼은 NotNull이기 때문에,
                   -- 이 값이 조회가 되지 않으면 UPDATE 실행되지 않음.
      ,eq_name = 'TobeSoft Application'
 WHERE eq_addno = 6#{eq_addno}
   AND outcome = 'eqa-1' -- 대기중인 것만 변경가능
;

SELECT * FROM `eq_add_list`;

SELECT * FROM `view_eq_add_list`;




