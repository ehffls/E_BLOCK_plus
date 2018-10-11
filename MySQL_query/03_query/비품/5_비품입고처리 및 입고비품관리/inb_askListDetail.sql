/*
	inb_askListDetail
	비품입출내역 상세조회
	
	조건 : 특정 입고비품번호
	결과 : 해당 입고비품번호를 가진 비품의 과거 이력 전체
*/

SELECT
     inb_no	-- 입고번호
    ,eq_no	-- 비품번호
    ,eq_name	-- 비품이름
    ,eq_sort	-- 비품분류
    ,inb_state	-- 비품상태
    ,last_eno	-- 마지막사용자
    ,last_ename -- 사용자이름
    ,last_dname	-- 사용자부서
FROM
   `view_inb_eq_detail`
WHERE
 inb_no = 4#{inb_no} -- 대상비품
;

SELECT * FROM `view_inb_eq_detail`;

SELECT * FROM inb_io_list;