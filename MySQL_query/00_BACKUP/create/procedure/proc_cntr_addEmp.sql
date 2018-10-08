-- [ 프로시저 선언하기 ] -------------------------------------------------------------

/* DELIMITER 는 프로시저 앞,뒤의 위치하여 안에 있는 부분은  한번에 실행될 수 있게 하는 역할을 한다. */
DELIMITER $$
DROP PROCEDURE IF EXISTS `proc_cntr_addEmp`;
CREATE PROCEDURE `proc_cntr_addEmp`
	 (-- emp table
     IN _e_no		NUMERIC(6)
	 ,IN _d_no 		NUMERIC(4)
	 ,IN _e_id		VARCHAR(30)
    ,IN _e_pw		VARCHAR(30)
    ,IN _e_name	VARCHAR(30)
    ,IN _e_jdate	VARCHAR(10)
    ,IN _au_no		NUMERIC(4)
    ,IN _e_ph		VARCHAR(13)
    ,IN _e_mail	VARCHAR(50)
    ,IN _e_addr	VARCHAR(100)
    ,IN _note1		VARCHAR(500)
    ,IN _e_bdate	VARCHAR(10)
    ,IN _gender	VARCHAR(1)
    ,IN _e_rank	NUMERIC(2)
     -- cntr_list table
    ,IN _cntr_date	VARCHAR(10)
    ,IN _cntr_sort	VARCHAR(5)
    ,IN _cntr_sal		NUMERIC(9)
    ,IN _cntr_sdate	VARCHAR(10)
    ,IN _cntr_fdate	VARCHAR(10)
    ,IN _note2			VARCHAR(500)
     -- result
    ,OUT _RESULT 		INT)
/*
	 @DESCRIPTION
		 신입사원의 등록 및 계약 ( 입력사원번호가 0일때 적용 )
				또는
       기존사원의 재계약 프로시저 ( 입력사원번호가 0이 아닐때 적용 )
	 @PARAM
	  ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		 _ev_eno		: PK/입력사원번호	|	_cntr_date	: 계약일자
		 _d_no		: 부서번호			|	_cntr_sort	: 계약분류 ('공채'/'특채'/'갱신'/'감봉')
		 _e_id 		: 아이디			|	_cntr_sal	: 계약연봉
		 _e_pw		: 비밀번호			|	_cntr_sdate	: 계약시작일
       _e_name		: 사원이름			|	_cntr_fdate	: 계약만료일
       _e_jdate	: 입사일			|	
       _au_no		: 권한번호			|	_note2		: 계약특이사항
       _e_ph		: 사원연락처		|ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
       _e_mail		: 사원이메일		|
       _e_addr		: 사원주소			|
       _note1		: 사원특이사항		|
       _e_bdate	: 사원생일			|
       _gender		: 사원성별			|
       _e_rank		: 사원현재직위		|
	 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	 @RETURN
		 _RESULT : 실패(0), 성공(1), 에러(-1:입력사원의 번호가 잘못된 경우)
*/
out_area:
BEGIN -- 바깥쪽 구문
	DECLARE _new_eno  INT;		/* 새로 등록한 사원번호를 담을 변수를 선언한다. */
   DECLARE _old_eno 	INT;		/* 기존의 사원번호를 담을 변수를 선언한다. */

 	/* 만약 SQL에러라면 ROLLBACK 처리한다. */
 	DECLARE exit handler for SQLEXCEPTION
 	  BEGIN
         ROLLBACK;        
         SET _RESULT = 0;
	  END;

body_area:
BEGIN -- 안쪽 구문

	/* 트랜젝션 시작 */
	START TRANSACTION;
	   /* 입력된 파라미터 변수 _e_no에 대하여*/
		  -- 0일때 신입사원 등록
      IF _e_no = 0
		  THEN 
				-- 새 시퀀스 번호를 채번함
				SELECT nextSeqVal('seq_e_no') INTO _new_eno FROM dual;
            
				-- emp 테이블에 INSERT 실행
				INSERT INTO `emp`(e_no, d_no, e_id, e_pw, e_name, e_jdate, au_no,
								e_ph, e_email, e_addr, note, e_bdate, gender, e_rank)            
            VALUES(_new_eno, _d_no, _e_id, _e_pw, _e_name, _e_jdate, _au_no,
						 _e_ph, _e_mail, _e_addr, _note1, _e_bdate, _gender, _e_rank);
            
					 -- cntr_list 테이블에 INSERT 실행
				INSERT INTO `cntr_list`(e_no, cntr_date, cntr_sort, cntr_sal,
												cntr_sdate, cntr_fdate, e_rank, note)
				VALUES(_new_eno, _cntr_date, _cntr_sort, _cntr_sal,
					    _cntr_sdate, _cntr_fdate, _e_rank, _note2);

		  -- 0보다 클때는 기존사원 재계약
      ELSEIF _e_no > 0
		  THEN 
					 -- 기존 사원번호를 채번함
            SET _old_eno = _e_no;

					 -- cntr_list 테이블에 INSERT 실행
				INSERT INTO `cntr_list`(e_no, cntr_date, cntr_sort, cntr_sal,
												cntr_sdate, cntr_fdate, e_rank, note)
				VALUES (_old_eno, _cntr_date, _cntr_sort, _cntr_sal,
						  _cntr_sdate, _cntr_fdate, _e_rank, _note2);
            
					 -- emp 테이블에 UPDATE 실행
				UPDATE `emp` SET
                    d_no	 = _d_no,
                    au_no 	 = _au_no,
                    e_ph 	 = _e_ph,
                    e_email  = _e_mail,
                    e_addr  = _e_addr,
                    note 	 = _note1,
                    e_rank  = _e_rank
				 WHERE e_no = _old_eno;
	   END IF;
      
      
	 -- 0보다 작을때는 에러
      IF _e_no<0 || _e_no IS NULL
		  THEN LEAVE body_area;
      END IF;
 
	/* 커밋 */
   
	COMMIT;
	SET _RESULT = 1;
END; -- 안쪽구문

	 -- 에러처리
	 IF _e_no<0 || _e_no IS NULL
	 THEN
        ROLLBACK;
		  SET _RESULT = -1;
	 END IF;
    
END$$ -- 바깥쪽 구문
DELIMITER ;
