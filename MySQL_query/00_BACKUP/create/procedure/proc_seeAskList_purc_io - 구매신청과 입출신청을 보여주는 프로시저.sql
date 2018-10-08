/*
	 내가 신청한 비품의 구매신청과 입고비품의 반출신청을 볼 수 있는 뷰? 가능할까?
	 
    2가지 업무에 대해 차이가 나는 부분은 무엇일까?
    - 반출신청한 물품은 입고번호가 있지만,
      새롭게 구매신청한 물품은 입고번호가 아닌, 신청번호를 가지고 있다.
    - 반출신청한 물품은 행위(대여/반납/분실/파손)의 상태값이 별도로 필요하다.
    
    같은 화면에서 보여주고 싶지만, 서로 다른 업무에 대한 다른 컬럼을 지원해야하므로
    하나의 요청(화면에서의 조회)만으로 2가지 업무를 모두 수행하려면, 뷰가 아닌 프로시저를 선택한다.
        
*/



-- 프로시저 호출





-- 프로시저 생성

/*  DELIMITER는 프로시저 앞,뒤의 위치하여
	 지정한 문자($$)를 만나기 전까지 한번에 실행될 수 있게 하는 역할을 한다. */
DELIMITER $$
DROP PROCEDURE IF EXISTS `proc_seeAskList_purc_io` ;
CREATE PROCEDURE `proc_seeAskList_purc_io`
(-- <!-- 비품구매신청테이블 조건 -->
  IN	eqp_eq_pno			 NUMERIC(8)		#{eqp_eq_pno}			<!-- 구매신청 비품번호 -->
, IN	eqp_eq_sort			 VARCHAR(5)		#{eqp_eq_sort}			<!-- 구매신청 비품분류 -->
, IN	eqp_eq_name			 VARCHAR(50)	#{eqp_eq_name}			<!-- 구매신청 비품이름 -->

, IN	eqp_ask_eno 		 NUMERIC(6)		#{eqp_ask_eno}			<!-- 구매신청 사원번호 -->
, IN	eqp_prev_ask_date  VARCHAR(10)	#{eqp_prev_ask_date}	<!-- 구매신청 시작기간 -->
, IN	eqp_post_ask_date	 VARCHAR(10)	#{eqp_post_ask_date}	<!-- 구매신청 종료기간 -->

, IN	eqp_sign_eno		 NUMERIC(6)		#{eqp_sign_eno}		<!-- 구매결재 사원번호 -->
, IN	eqp_prev_sign_date VARCHAR(10)	#{eqp_prev_sign_date}<!-- 구매결재 시작기간 -->
, IN	eqp_post_sign_date VARCHAR(10)	#{eqp_post_sign_date}<!-- 구매결재 종료기간 -->

, IN	eqp_min_subtotal	 NUMERIC(12)	#{eqp_min_subtotal}	<!-- 소계 최소금액 -->
, IN	eqp_max_subtotal	 NUMERIC(12)	#{eqp_max_subtotal}	<!-- 소계 최대금액 -->
, IN	eqp_outcome			 VARCHAR(5)		#{eqp_outcome} 
		  -- <!-- 구매신청결과 [ibp-0(취소), 1(대기), 2(기각), 3(승인), 4(결제), 5(입고)] -->
/*
 -- <!-- 입고비품입출신청 테이블 조건 -->
, IN	eio_inb_no			 NUMERIC(6)		#{eio_inb_no}			<!-- 입출신청 비품번호 -->
, IN	eio_eq_sort			 VARCHAR(5)		#{eio_eq_sort}			<!-- 입출신청 비품분류 -->
, IN	eio_eq_name			 VARCHAR(50)	#{eio_eq_name}			<!-- 입출신청 비품이름 -->

, IN	eio_ask_eno			 NUMERIC(6)		#{eio_ask_eno}			<!-- 입출신청 사원번호 -->
, IN	eio_prev_ask_date	 VARCHAR(10)	#{eio_prev_ask_date}	<!-- 입출신청 시작기간 -->
, IN	eio_post_ask_date	 VARCHAR(10)	#{eio_post_ask_date}	<!-- 입출신청 종료기간 -->

, IN	eio_sign_eno		 NUMERIC(6)		#{eio_sign_eno}		<!-- 입출결재 사원번호 -->
, IN	eio_prev_sign_date VARCHAR(10)	#{eio_prev_sign_date}<!-- 입출결재 시작기간 -->
, IN	eio_post_sign_date VARCHAR(10)	#{eio_post_sign_date}<!-- 입출결재 종료기간 -->

, IN	eio_io_sort			 VARCHAR(5)		#{eio_io_sort}
				-- <!-- 입출분류 [inb-0(대여), 1(반납), 2(분실), 3(파손)] -->
, IN	eio_outcome			 VARCHAR(5)		#{eio_outcome}
				-- <!-- 입출신청결과 [ioa-0(취소), 1(대기), 2(기각), 3(승인)] -->
*/
, OUT	eqp_rowcount INT	#{eqp_rowcount}	<!-- 비품구매신청 테이블에서 조회된 로우의 개수 -->
/*
, OUT	eio_rowcount INT	#{eio_rowcount}	<!-- 입고비품입출신청 테이블에서 조회된 로우의 개수 -->
*/
)
/* [[ 프로시저 설명 ]] --펼쳐보기--
	 @DESCRIPTION
		  나가 신청하거나, 나에게 승인요청이 들어온
        비품구매신청과 비품입출신청 목록을 동시에 보여주는 프로시저
	 @PARAM
		  <!-- 비품구매신청테이블 조건 -->
         #{eqp_eq_pno}			<!-- 구매신청 비품번호 -->
		  ,#{eqp_eq_sort}			<!-- 구매신청 비품분류 -->
        ,#{eqp_eq_name}			<!-- 구매신청 비품이름 -->
        
		  ,#{eqp_ask_eno}			<!-- 구매신청 사원번호 -->
		  ,#{eqp_prev_ask_date}	<!-- 구매신청 시작기간 -->
        ,#{eqp_post_ask_date}	<!-- 구매신청 종료기간 -->
        
        ,#{eqp_sign_eno}		<!-- 구매결재 사원번호 -->
		  ,#{eqp_prev_sign_date}<!-- 구매결재 시작기간 -->
        ,#{eqp_post_sign_date}<!-- 구매결재 종료기간 -->
		  
        ,#{eqp_min_subtotal}	<!-- 소계 최소금액 -->
        ,#{eqp_max_subtotal}	<!-- 소계 최대금액 -->
		  ,#{eqp_outcome} 		<!-- 구매신청결과 [ibp-0(취소), 1(대기), 2(기각), 3(승인), 4(결제), 5(입고)] -->
        
        <!-- 입고비품입출신청 테이블 조건 -->
        ,#{eio_inb_no}			<!-- 입출신청 비품번호 -->
        ,#{eio_eq_sort}			<!-- 입출신청 비품분류 -->
        ,#{eio_eq_name}			<!-- 입출신청 비품이름 -->
        
		  ,#{eio_ask_eno}			<!-- 입출신청 사원번호 -->
		  ,#{eio_prev_ask_date}	<!-- 입출신청 시작기간 -->
        ,#{eio_post_ask_date}	<!-- 입출신청 종료기간 -->
        
        ,#{eio_sign_eno}		<!-- 입출결재 사원번호 -->
		  ,#{eio_prev_sign_date}<!-- 입출결재 시작기간 -->
        ,#{eio_post_sign_date}<!-- 입출결재 종료기간 -->

		  ,#{eio_io_sort} 		<!-- 입출분류 [inb-0(대여), 1(반납), 2(분실), 3(파손)] -->
		  ,#{eio_outcome} 		<!-- 입출신청결과 [ioa-0(취소), 1(대기), 2(기각), 3(승인)] -->
        
	 @RETURN
		   #{eqp_rowcount}	   <!-- 비품구매신청 테이블에서 조회된 로우의 개수 -->
		  ,#{eio_rowcount}	   <!-- 입고비품입출신청 테이블에서 조회된 로우의 개수 -->
*/
    
/* 프로시저 실행문 시작 */
BEGIN 
	 -- 변수 선언부 : 선언시 반드시 초기화
    -- [[유의!!]] MySQL은 디펄트값으로 선언하지 않으면 객체가 타입만 있는 상태로 설정되어 NULL이 기본값이다.

    -- 비품구매신청내역을 조회하는 쿼리를 위한 변수
	 DECLARE syntax_eqp_where	VARCHAR(300) DEFAULT NULL; -- 완성된 조건문을 담을 변수
    DECLARE syntax_eqp_query	VARCHAR(500) DEFAULT NULL;	-- 완성된 쿼리

    -- 비품입출내역을 조회하는 쿼리를 위한 변수
	 DECLARE syntax_eio_where	VARCHAR(300) DEFAULT NULL; -- 완성된 조건문을 담을 변수
    DECLARE syntax_eio_query	VARCHAR(500) DEFAULT NULL;	-- 완성된 쿼리

    
/*	 ///////////////////////////////////////////////////////////
	 //// [ 쿼리작성 시작 ] 비품구매신청내역을 조회하는 쿼리		////////////
	 /////////////////////////////////////////////////////////// */
    


        
        -- <!-- 입고비품입출신청 테이블 조건 -->
        ,#{eio_inb_no}			<!-- 입출신청 비품번호 -->
        ,#{eio_eq_sort}			<!-- 입출신청 비품분류 -->
        ,#{eio_eq_name}			<!-- 입출신청 비품이름 -->
        
		  ,#{eio_ask_eno}			<!-- 입출신청 사원번호 -->
		  ,#{eio_prev_ask_date}	<!-- 입출신청 시작기간 -->
        ,#{eio_post_ask_date}	<!-- 입출신청 종료기간 -->
        
        ,#{eio_sign_eno}		<!-- 입출승인 사원번호 -->
		  ,#{eio_prev_sign_date}<!-- 입출승인 시작기간 -->
        ,#{eio_post_sign_date}<!-- 입출승인 종료기간 -->

		  ,#{eio_io_sort} 		<!-- 입출분류 [inb-0(대여), 1(반납), 2(분실), 3(파손)] -->
		  ,#{eio_outcome} 		<!-- 입출신청결과 [ioa-0(취소), 1(대기), 2(기각), 3(승인)] -->    
    
    
    /* 비품구매신청테이블 동적 조건문 */
    SET @syntax_eqp_where	/* 아래 정적조건 */
		  = CONCAT(  
				 " eq_pno = ? "  -- <!-- 구매신청 비품번호 -->	 /* 아래 동적조건*/ 
				,IF(EXISTS(eqp_eq_sort)			," AND eq_sort = ?"		,' ') -- <!-- 구매신청 비품분류 -->
				,IF(EXISTS(eqp_ask_eno)			," AND ask_eno = ?"		,' ') -- <!-- 구매신청 사원번호 -->
				,IF(EXISTS(eqp_prev_ask_date) ," AND ask_date >= ?"	,' ') -- <!-- 구매신청 시작기간 -->
				,IF(EXISTS(eqp_post_ask_date) ," AND ask_date <= ?"	,' ')	-- <!-- 구매신청 종료기간 --> 
				,IF(EXISTS(eqp_prev_sign_date)," AND sign_date >= ?"	,' ')	-- <!-- 구매결재 시작기간 -->
				,IF(EXISTS(eqp_post_sign_date)," AND sign_date <= ?"	,' ') -- <!-- 구매결재 종료기간 -->
				,IF(EXISTS(eqp_min_subtotal)	," AND subtotal <= ?"	,' ') -- <!-- 소계 최소금액 -->
				,IF(EXISTS(eqp_max_subtotal)	," AND subtotal <= ?"	,' ') -- <!-- 소계 최대금액 -->
				,IF(EXISTS(eqp_outcome)	 	 	," AND outcome <= ?"		,' ') -- <!-- 소계 최대금액 -->
		  );				  -- <!-- 구매신청결과 [ibp-0(취소), 1(대기), 2(기각), 3(승인), 4(결제), 5(입고)] -->
    
    -- 쿼리문 완성하기
    SET @syntax_eqp_query = CONCAT(
		   "SELECT" -- 아래 조회할 컬럼 삽입
		  ,"		 io_ano, inb_no, eq_sort, eq_name, ask_ename, d_name, ask_date,
					 io_sort, outcome, sign_ename, sign_date, ask_rsn, sign_rsn"
		  ,"  FROM"
        ,"		`view_purc_eqmk_list`" -- 비품구매신청에 따른 소계와 거래처를 보여주는 뷰
        ," WHERE "
        ,		@syntax_eqp_where -- 완성된 동적조건문을 삽입
        ," ORDER BY" -- 정적 정렬조건
        ,"		io_ano DESC
				 ,(CASE io_sort
					 WHEN '대여' THEN 0
					 WHEN '반납' THEN 1
					 WHEN '분실' THEN 2
					 WHEN '파손' THEN 3
                ELSE 4 END) ASC
				 ,(CASE outcome
					 WHEN '취소' THEN 2
					 WHEN '대기' THEN 1
					 WHEN '기각' THEN 3
					 WHEN '승인' THEN 0
                ELSE 4 END) ASC"
		  );
                 
	 PREPARE stmt_eqp FROM @syntax_eqp_query;  -- 동적쿼리문 객체생성 (자원할당)

    BEGIN
		  DECLARE cur_stmt_eqp CURSOR FOR -- 커서 선언
		  SELECT 
        EXECUTE stmt_eqp
			 USING (eqp_eq_pno			-- <!-- 구매신청 번호 -->
					 ,eqp_eq_sort 			-- <!-- 구매신청 비품분류 -->
					 ,eqp_ask_eno 			-- <!-- 구매신청 사원번호 -->
					 ,eqp_prev_ask_date 	-- <!-- 구매신청 시작기간 -->
					 ,eqp_post_ask_date	-- <!-- 구매신청 종료기간 --> 
					 ,eqp_prev_sign_date	-- <!-- 구매결재 시작기간 -->
					 ,eqp_post_sign_date -- <!-- 구매결재 종료기간 -->
					 ,eqp_min_subtotal  	-- <!-- 소계 최소금액 -->
					 ,eqp_max_subtotal 	-- <!-- 소계 최대금액 -->
					 ,eqp_outcome 			-- <!-- 소계 최대금액 -->
					 );-- 동적쿼리 실행
        
		  OPEN cur_stmt_eqp; -- 커서 열기

				-- 반복문 시작
            LOOP
					 -- 커서에 담긴 데이터를 변수에 담는다(Fetch:낙찰되다|가져옴|데려옴)
					 FETCH cur_stmt_eqp 
                INTO io_ano, inb_no, eq_sort, eq_name, ask_ename, d_name, ask_date,
						   io_sort, outcome, sign_ename, sign_date, ask_rsn, sign_rsn;
                     
					 -- 하나의 로우가 정상적으로 담겨지면 조회된 로우를 1건 올린다.
					 SET eqp_rowcount = eqp_rowcount + 1 ;
					 
					 EXIT WHEN @cur_stmt_eqp%NOTFOUND;
					 
				END LOOP;
				-- 반복문 끝


		  CLOSE cur_name; -- 커서 닫기
	 END;
    
	 DEALLOCATE PREPARE stmt_eqp; -- 동적쿼리문 객체소거 (자원반환)	
    
END $$
/* 프로시저 실행문 종료 */
DELIMITER ;
/* 지정문자($$) 앞에서 프로시저가 종료하는경우, 세미콜론을 적지않는다. (유의) */

