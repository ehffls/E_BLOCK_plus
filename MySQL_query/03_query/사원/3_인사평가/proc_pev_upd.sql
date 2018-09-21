	 SELECT * FROM `emp`;
	 SELECT * FROM `pev`;
	 SELECT * FROM `pev_list`;
--
	 DROP PROCEDURE proc_pev_add;
	 commit;
    
    
-- [ 프로시저 사용하기 ] -------------------------------------------------------------
CALL proc_pev_upd(3#{ev_eno}
					  ,1#{tg_eno}
					  ,'테스트로 입력했음'#{ev_content}
                 ,45#{ev_score}
                 ,@RESULT);
SELECT @RESULT;

-- [ 프로시저 선언하기 ] -------------------------------------------------------------

/* DELIMITER 는 프로시저 앞,뒤의 위치하여 안에 있는 부분은  한번에 실행될 수 있게 하는 역할을 한다. */
DELIMITER $$
CREATE PROCEDURE proc_pev_upd
	 (IN _ev_eno		NUMERIC(6)
    ,IN _tg_eno		NUMERIC(6)
	 ,IN _ev_content 	VARCHAR(500)
    ,IN _ev_score 	NUMERIC(2)
	 ,OUT RESULT 		INT)
/*
	 @DESCRIPTION
		 인사평가에 새로운 평가를 반영할 때, 회원의 직급에 따라 미리 지정된 비율의 점수가 기록되는 프로시저
	 @PARAM
		 _ev_eno		 : PK/평가사원
		 _tg_eno		 : PK/대상사원
		 _ev_content : 평가내용
		 _ev_score	 : 평가점수
	 @RETURN
		 RESULT : 실패(0), 성공(1), 에러(-1:직위가 없는 사원이 인사평가를 실행한 경우)
*/
BEGIN -- 바깥쪽 구문
	DECLARE _rank INT;		/* 등급을 담을 변수를 선언한다. */
   DECLARE _ratio DOUBLE;	/* 비율을 담을 변수를 선언한다. */

body_area:
BEGIN -- 안쪽 구문
	/* 만약 SQL에러라면 ROLLBACK 처리한다. */
	DECLARE exit handler for SQLEXCEPTION
	  BEGIN
		  ROLLBACK;        
        SET RESULT = 0;  
	  END;

	/* 트랜젝션 시작 */
	START TRANSACTION;
	   /* 평가한 사원의 사원번호로 직급 조회 */
      SELECT e_rank INTO _rank /* 선언해둔 등급변수에 담음 */
        FROM `emp`
       WHERE e_no = _ev_eno;
      
		/* 직급에 맞게 비율조정 */
		IF 	 _rank = 50 THEN SET _ratio = 1.00;  /* 대표 */
		ELSEIF _rank = 40 THEN SET _ratio = 0.75;  /* 부서장 */
      ELSEIF _rank = 30 THEN SET _ratio = 0.5;   /* 차장 */
      ELSEIF _rank = 20 THEN SET _ratio = 0.25;  /* 팀장 */
      ELSEIF _rank = 10 THEN SET _ratio = 0.1;   /* 사원 */
		END IF;

	   /* 직급이 없을때 비율이 지정되지 않으므로, 비율이 없을때 프로시저를 탈출*/
	   IF _ratio IS NULL THEN LEAVE body_area;
      END IF;

		/* pev 테이블에 UPDATE 실행 */
		UPDATE `pev` SET ev_date = DATE_FORMAT(now(), '%Y-%m-%d')
						    ,ev_content = _ev_content
						    ,ev_score = _ev_content
                      ,ratio = _ratio /* 평가기간 중 진급이 가능한 경우엔 변경될 여지가 있음 */
	    WHERE ev_eno = _ev_eno
		   AND tg_eno = _tg_eno
         AND qrt_no = CONCAT(date_format(now(),'%y-'),quarter(now()),date_format(now(),'-%m'));
	/* 커밋 */
	COMMIT;
	SET RESULT = 1;
END; -- 안쪽구문

	 IF _ratio IS NULL THEN SET RESULT = -1;
	 END IF;
    
END$$ -- 바깥쪽 구문
DELIMITER ;
