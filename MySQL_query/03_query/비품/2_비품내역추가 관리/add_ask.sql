/*
	 eq_add_list
    비품추가신청내역에 새로운 비품 추가신청하기
    
    sql_mode가 MySQL5.5에서는 따로 설정된 것이 없기 때문에
    초과된 사이즈의 문자열이나 NN컬럼에 NULL 값 입력등, 문제상황이 야기된다.
    STRICT 설정이 필요하고, 조치를 취했다. ( 조치내용은 DB담당자에게 확인바람 )
*/


-- INSERT INTO ~ VALUES~ 구문은 내부의 각 값은 SELECT 쿼리문을 허용하지 않는다.
-- 그러므로 INSERT INTO ~ SELECT ~ 구문을 활용한다.
INSERT INTO `EBLOCK`.`eq_add_list`
(eq_addno, ask_eno, sign_eno, ask_date, eq_sort, eq_name)
SELECT 
	  `EBLOCK`.nextSeqVal('seq_eq_addno')
	 ,11#{ask_eno}
	 ,`emp`.e_no -- 9001번 부서 최고관리자에게 신청
    ,DATE_FORMAT(now(), '%Y-%m-%d') /* 2011-06-14 */
	 ,(SELECT eq_sort FROM `EBLOCK`.`eq_sort`
       WHERE eq_sort = '하드웨어'#{eq_sort}
       LIMIT 1)-- eq_sort 컬럼은 NotNull이기 때문에, 이 값이 조회가 되지 않으면 INSERT가 실행되지 않음.
	 ,CASE
		  WHEN (SELECT eq_name FROM `EBLOCK`.`eq_add_list`
				   WHERE eq_name = '라즈베리파이3'#{eq_name}
                 AND NOT outcome = 'eqa-0'
				 ) IS NULL THEN '라즈베리파이3'#{eq_name}
		  ELSE NULL -- 해당 이름의 비품이 대기,기각,승인단계에 있는 로우가 하나라도 있을때는 접수되면 안됨
     END
  FROM `EBLOCK`.`emp` NATURAL JOIN `EBLOCK`.`dept`
 WHERE `emp`.au_no = 35
   AND `dept`.d_no = 9001
 ORDER BY `emp`.e_rank
 LIMIT 1 -- 9001번 부서 최고관리자에게 신청
;


SELECT * FROM `eq_add_list`;

SELECT * FROM `view_eq_add_list`;