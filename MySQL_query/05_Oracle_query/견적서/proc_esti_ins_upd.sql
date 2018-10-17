CREATE OR REPLACE PROCEDURE EBLOCK_OSUB.proc_esti_ins_upd(pesti_ano   IN NUMBER,   pec_no     IN NUMBER
                                                         ,pesti_email IN VARCHAR2, p_note     IN VARCHAR2
                                                         ,psign_eno1  IN NUMBER,   psign_eno2 IN NUMBER
                                                         ,psign_eno3  IN NUMBER,   pe_rank    IN VARCHAR2
                                                         ,pask_eno    IN NUMBER,   result     OUT NUMBER)
IS     
     var_rank VARCHAR2(4) := '팀장'; -- 직급을 저장하기 위한 변수
     var_price number(8) := 0; -- 변경할 카탈로그번호에 해당하는 가격값을 받기 위한 변수
                        
BEGIN
result:=-1;
    IF(var_rank = pe_rank) -- 파라미터로 받은 값과 프로시저안에서 설정한 직급값이 같을때
        THEN
                  
        -- 입력받은 신청 번호가 0보다 작거나 입력받은 신청 번호 값이 없으면 신청,수정 실패    
        IF(pesti_ano < 0 or (pesti_ano IS NULL))
         THEN
          result := 0;
          RETURN; --실패했을 경우 프로시저 탈출
        END IF;  
        
        -- 입력받은 신청번호가 0이면, 없는번호로 신규신청함
        IF(pesti_ano=0) 
            THEN
              SELECT ec_price INTO var_price
                  FROM ESTI_CATALOG
                 WHERE ec_no = pec_no;
                 
            INSERT INTO ESTI_LIST (
                                   ESTI_ANO --신청번호
                                  ,ESTI_EMAIL --고객 이메일
                                  ,ASK_DATE --신청일자
                                  ,NOTE --비고
                                  ,ESTI_PRICE --가격
                                  ,ASK_ENO --신청자사원번호 (팀장)
                                  ,EC_NO --카탈로그번호
                                  ,SIGN_ENO1 --결제사원번호1 (차장) 
                                  ,SIGN_ENO2 --결제사원번호2 (부서장)
                                  ,SIGN_ENO3 --결제사원번호3 (대표)
                                  ,OUTCOME1
                                  ,OUTCOME2
                                  ,OUTCOME3
                                 )
                          VALUES (
                                  SEQ_ESTI_ANO.nextval
                                 ,PESTI_EMAIL
                                 ,TO_CHAR(sysdate,'YYYY-MM-DD')
                                 ,P_NOTE
                                 ,var_price
                                 ,PASK_ENO
                                 ,PEC_NO
                                 ,PSIGN_ENO1
                                 ,PSIGN_ENO2
                                 ,PSIGN_ENO3
                                 ,'est-2'
                                 ,'est-2'
                                 ,'est-2'
                                 );
          
        -- 입력받은 신청번호가 0보다 크면 있으므로 기존신청 수정업무 수행
        ELSIF (pesti_ano > 0)
            THEN
                -- 변경하고자하는 카탈로그번호가 있을때, 해당 번호의 가격값을 받고자함
                SELECT ec_price INTO var_price
                  FROM ESTI_CATALOG
                 WHERE ec_no = pec_no;
                
                -- 수정실행
                UPDATE ESTI_LIST SET
                       ESTI_EMAIL = pesti_email -- '1111@gmail.com'
                      ,NOTE       = p_note   -- '수정'
                      ,EC_NO      = pec_no   -- 1
                      ,ESTI_PRICE = var_price -- 카탈로그번호에 해당된 가격값이 저장된 변수의 값을 넣음
                WHERE ESTI_ANO    = pesti_ano -- 2
                 AND ASK_ENO      = pask_eno; -- 46
        
        END IF;
           
            COMMIT;
            result:=1;
     
     END IF;
END;