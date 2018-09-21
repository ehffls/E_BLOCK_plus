-- 테스트 
CREATE OR REPLACE VIEW test_view
    AS SELECT cmt_no, e_no, cmt_date, cmt_time FROM cmt_list;
SELECT * FROM test_view;
-- --------------------------------------------------------------------------------------------

SELECT * FROM cmt_list;

-- 뷰 생성
CREATE OR REPLACE VIEW view_cmt_list AS
SELECT
	   dpemp.d_name AS 'd_name'     -- 부서이름
	  ,cl.e_no      AS 'e_no'		  -- 사원번호 
     ,dpemp.e_name AS 'e_name'     -- 사원이름
     ,dpemp.e_rank AS 'e_rank'	  -- 사원직급
     ,cl.cmt_date  AS 'cmt_date'   -- 근태기록일자
     
/*    입력 최소값은 그 날의 최초 출근시각 */
     ,MIN(cl.cmt_time) AS 'first_check'
     
/*    입력 최소값이 10시 이전이면 '출근', 10시이상이면 '지각 ', 5시반 이후면 '야간' */
     ,IF(MIN(cl.cmt_time) < '10:00:00'
        ,'출근'
        ,IF(MIN(cl.cmt_time) > '17:30:00','야간','지각') ) AS 'attend'
        
/*	   입력 최대값은 그 날의 최종 퇴실시각 */
     ,IF(COUNT(cl.cmt_time)=1
		  ,'--:--:--'
		  ,MAX(cl.cmt_time)) AS 'last_check'
        
/* 	입력이 1건일때는 '재실', 입력 최대값이 5시30분 이전이면 '조퇴', 이상이면 '퇴근' */
	  ,IF(MAX(cl.cmt_time) < '17:30:00'&& COUNT(cl.cmt_time)%2 = 0
        ,'조퇴'
        ,IF(COUNT(cl.cmt_time)=1
           ,IF(cl.cmt_date < curdate(),'--','재실')
           ,'퇴근') ) AS 'lv_state'
           
/*   입력시각개수가 홀수면 입실('IN'), 짝수면 퇴실('OUT')  */
     ,IF(COUNT(cl.cmt_time)%2 = 1
		  ,IF(cl.cmt_date < curdate(),'-','IN')
        ,'OUT') AS 'io_state'
        
  FROM cmt_list cl, view_DpEmpName dpemp
  
 WHERE cl.e_no = dpemp.e_no
   
 GROUP BY cmt_date, e_no -- 날짜별/사원별로 그룹정렬
 ORDER BY cmt_date DESC	 -- 내림차순 (최근변화가 최상위)
         ,e_rank ASC		 -- 오름차순 (상사가 상위)
         ,e_no ASC		 -- 오름차순 (선임이 상위)
;



-- 생성된 뷰 테스트

SELECT
	 d_name, e_no, e_name, e_rank, cmt_date,
    first_check, attend,
    last_check, lv_state,
    io_state
  FROM view_cmt_list
 WHERE e_no = 3#{e_no}
   AND d_name = '본부'#{d_name}
   AND cmt_date >= '2018-09-01'#{prev_cmt_date}
   AND cmt_date <= '2018-09-30'#{post_cmt_date}
 ORDER BY d_name;
 
 
 
SELECT * FROM view_cmt_list;


-- --------------------------------------------------------------------------------------------













-- [[ 아래는 실패한 쿼리 : 뷰는 변수나 파라미터를 가질 수 없다. ]]
SET @rownum:=0; -- 초기화 
SELECT
	  cmt_no, e_no, cmt_date, cmt_time
    ,IF( -- ORACLE의 DECODE역할을 하는 IF(조건, 참일때 반환값,거짓일때 반환값 )
        (
        SELECT (@rownum +1) % 2 FROM cmt_list
	     ) = 1 -- 조건문
        ,'출근'-- 참
        ,'퇴근'-- 거짓
	    ) AS 'statement'
  FROM cmt_list
 WHERE e_no = 1#{e_no}
; -- OK라는 에러 발생함 