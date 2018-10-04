/*
	 커서를 다루는 프로시저의 선언기본꼴.
	 출처: http://bizadmin.tistory.com/entry/MySQL-Fetch-Cursor-문-사용방법
*/


-- 프로시저 호출





-- 프로시저 생성

/*  DELIMITER는 프로시저 앞,뒤의 위치하여
	 지정한 문자($$)를 만나기 전까지 한번에 실행될 수 있게 하는 역할을 한다. */
DELIMITER $$
DROP PROCEDURE IF EXISTS `프로시저이름` ;
CREATE PROCEDURE `프로시저이름`(IN|OUT 파라미터이름 타입(크기))
	 /*
	 @DESCRIPTION
		  프로시저의 작동목적과 목표결과를 기록한다.
	 @PARAM
		  p_var_1 : 파라미터의 내용
		  p_var_1 : 파라미터의 내용
		  p_var_1 : 파라미터의 내용
	 @RETURN
		  RESULT : 성공(1), 실패(0) [, 예외(-1) : 예외상황 ]
	 */
    
/* 프로시저 실행문 시작 */
BEGIN 
	 -- 변수 선언부 : 선언시 반드시 초기화
    -- [[유의!!]] MySQL은 디펄트값으로 선언하지 않으면 객체가 타입만 있는 상태로 설정되어 NULL이 기본값이다.
	 DECLARE var_int 		INT DEFAULT 0; -- NUMERIC 타입 컬럼을 위한 INT 변수
	 DECLARE var_string 	VARCHAR(20);	-- VARCHAR 타입 컬럼을 위한 VARCHAR 변수
    
	 DECLARE isDone BOOLEAN DEFAULT FALSE; -- 커서 조작을 위한 BOOLEAN 변수    
    DECLARE var_rowcount INT DEFAULT 0; -- 페치된 로우의 개수를 담기 위한 변수
    DECLARE var_result	 INT DEFAULT 0; -- 트랜잭션을 위해 사용될 수 있는 INT변수

	 -- 커서 선언부 : 커서가 접근할 데이터 조회쿼리
	 DECLARE cur_name CURSOR FOR
    SELECT columnNo, columnString FROM `table_name` WHERE conditions;
             
	 -- 핸들러변수 선언부 : 로우의 진행에 따라 다음 실행할 대상을 찾을 수 없으면, isDone변수를 참(true)으로 전환한다.
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET isDone = TRUE;
	 /*  반복핸들러 주의사항!!!
				이 핸들러변수는 선언이후 실행되는 '모든 반복행위'를 감지한다.
				페치한 커서가 바라보고 담아가는 대상SELECT문(A)의 다음로우의 존재여부와는 별개로,
				실행문 안에서 수행되는 SELECT문(B)의 조회 이후
				(조회가 완료되고나면, B의 다음 조회대상은 없게 되므로)
				핸들러변수는 NOT FOUND를 감지하고 isDone을 참으로 설정한다.
            
            그러므로, 커서 이외의 SELECT문(B)을 실행해야하는 경우,
            isDone을 false로 초기화 시켜야한다.
					 SET @isDone = false;
				
		  핸들러변수 없이!
        각 커서를 반복할때, 다음코드를 이용해서 탈출을 시도해보자.
				EXIT WHEN cur_name%NOTFOUND;
    */
/*  
    변수은 모두 가장 먼저 모여서 선언되어야한다. (반드시 준수)
	 선언 외 다른 작업을 수행한 이후에는 선언할 수 없다.
    
    만약, 중간에 새로운 변수를 선언해야하는 경우,
    실행문 안에서 다시 BEGIN-END구문을 사용해서 선언을 하여 사용가능하다.
*/
	 
    
OPEN cur_name; -- 커서 열기

	 -- 반복문 시작 ( 별칭 : LOOP )
	 read_loop : LOOP
    
		  -- 커서에 담긴 데이터를 변수에 담는다(Fetch:낙찰되다|가져옴|데려옴)
		  FETCH cur_name INTO var_int, var_string;
		  -- 하나의 로우가 정상적으로 담겨지면 조회된 로우를 1건 올린다.
		  SET @var_rowcount = @var_rowcount + 1 ;
        
		  IF isDone THEN		 -- 커서가 마지막 로우에 도착하면
				LEAVE read_loop;-- 다음 반복대상이 없으므로 핸들러가 참이 된다.
		  END IF; 				 -- 이 때, 별칭으로 지정한 반복문을 탈출한다. 
        
	 END LOOP;
    -- 반복문 끝

	 SELECT @var_rowcount ; -- 조회된 로우의 개수를 조회

CLOSE cur_name; -- 커서 닫기

END $$
/* 프로시저 실행문 종료 */
DELIMITER ;
/* 지정문자($$) 앞에서 프로시저가 종료하는경우, 세미콜론을 적지않는다. (유의) */





/*
	 --반복문의 또 다른 형태...
    
    DECLARE isComplete BOOLEAN DEFAULT FALSE;
    
    ...
    
	 REPEAT
	 
		  IF NOT @isComplete THEN
				
            ...
            
				IF 반복종료조건값 THEN
					 SET @isComplete = TRUE;
				END IF;
            
		  END IF;
    
    UNTIL @isComplete END REPEAT;
*/
