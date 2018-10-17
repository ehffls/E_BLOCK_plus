CREATE OR REPLACE PROCEDURE EBLOCK_OSUB.proc_esti_list(peno IN number, ask_sign IN varchar2, sign_level IN number, esti_cur OUT SYS_REFCURSOR)
IS
BEGIN
    -- 1일경우 결재자 조회 0일경우 신청자 조회
    -- 결제에 대한 상태(est-1:취소,est-2:대기,est-3:승인,est-4:기각)
        IF(ask_sign = '1') THEN
            OPEN esti_cur FOR 
                 SELECT e.ESTI_ANO
                     , e.ESTI_EMAIL
                     , e.ASK_DATE
                     , e.NOTE
                     , e.ESTI_PRICE
                     , e.SIGN_ENO1
                     , DECODE(OUTCOME1,'est-1','취소','est-2','대기','est-3','승인','est-4','기각','error') AS OUTCOME1
                     , e.SIGN_DATE1
                     , e.SIGN_RSN1
                     , e.SIGN_ENO2
                     , DECODE(OUTCOME2,'est-1','취소','est-2','대기','est-3','승인','est-4','기각','error') AS OUTCOME2
                     , e.SIGN_DATE2
                     , e.SIGN_RSN2
                     , e.SIGN_ENO3
                     , DECODE(OUTCOME3,'est-1','취소','est-2','대기','est-3','승인','est-4','기각','error') AS OUTCOME3
                     , e.SIGN_DATE3
                     , e.SIGN_RSN3
                     , e.ASK_ENO
                     , e.EC_NO
                     , e.ESTI_OK 
                     , c.EC_NAME
                  FROM esti_list e
                  LEFT JOIN ESTI_CATALOG c
                  ON e.EC_NO = c.EC_NO WHERE (sign_eno1 = peno AND outcome1 = 'est-2') 
                  OR (sign_eno2 = peno AND outcome1 = 'est-3' AND outcome2='est-2') OR (sign_eno3 = peno AND outcome2 = 'est-3' AND outcome3='est-2');
       
        ELSIF(ask_sign = '0') THEN
            -- sign_level 0: 결제 대기 조회
            IF(sign_level = 0) THEN
                OPEN esti_cur FOR
                SELECT e.ESTI_ANO
                     , e.ESTI_EMAIL
                     , e.ASK_DATE
                     , e.NOTE
                     , e.ESTI_PRICE
                     , e.SIGN_ENO1
                     , DECODE(OUTCOME1,'est-1','취소','est-2','대기','est-3','승인','est-4','기각','error') AS OUTCOME1
                     , e.SIGN_DATE1
                     , e.SIGN_RSN1
                     , e.SIGN_ENO2
                     , DECODE(OUTCOME2,'est-1','취소','est-2','대기','est-3','승인','est-4','기각','error') AS OUTCOME2
                     , e.SIGN_DATE2
                     , e.SIGN_RSN2
                     , e.SIGN_ENO3
                     , DECODE(OUTCOME3,'est-1','취소','est-2','대기','est-3','승인','est-4','기각','error') AS OUTCOME3
                     , e.SIGN_DATE3
                     , e.SIGN_RSN3
                     , e.ASK_ENO
                     , e.EC_NO
                     , e.ESTI_OK 
                     , c.EC_NAME
                  FROM esti_list e
                  LEFT JOIN ESTI_CATALOG c
                  ON e.EC_NO = c.EC_NO WHERE ask_eno = peno AND outcome1 = 'est-2' AND outcome2 = 'est-2' AND outcome3 = 'est-2';
            
            -- sign_level 1: 첫번째 결제자 결제 후 결제 대기 조회
            ELSIF(sign_level = 1) THEN
                OPEN esti_cur FOR 
               SELECT e.ESTI_ANO
                     , e.ESTI_EMAIL
                     , e.ASK_DATE
                     , e.NOTE
                     , e.ESTI_PRICE
                     , e.SIGN_ENO1
                     , DECODE(OUTCOME1,'est-1','취소','est-2','대기','est-3','승인','est-4','기각','error') AS OUTCOME1
                     , e.SIGN_DATE1
                     , e.SIGN_RSN1
                     , e.SIGN_ENO2
                     , DECODE(OUTCOME2,'est-1','취소','est-2','대기','est-3','승인','est-4','기각','error') AS OUTCOME2
                     , e.SIGN_DATE2
                     , e.SIGN_RSN2
                     , e.SIGN_ENO3
                     , DECODE(OUTCOME3,'est-1','취소','est-2','대기','est-3','승인','est-4','기각','error') AS OUTCOME3
                     , e.SIGN_DATE3
                     , e.SIGN_RSN3
                     , e.ASK_ENO
                     , e.EC_NO
                     , e.ESTI_OK 
                     , c.EC_NAME
                  FROM esti_list e
                  LEFT JOIN ESTI_CATALOG c
                  ON e.EC_NO = c.EC_NO WHERE ask_eno = peno AND outcome1 = 'est-3' AND outcome2 = 'est-2' AND outcome3 = 'est-2';
            
            -- sign_level 2: 두번째 결제자 결제 후 결제 대기 조회
            ELSIF(sign_level = 2) THEN
                OPEN esti_cur FOR 
                SELECT e.ESTI_ANO
                     , e.ESTI_EMAIL
                     , e.ASK_DATE
                     , e.NOTE
                     , e.ESTI_PRICE
                     , e.SIGN_ENO1
                     , DECODE(OUTCOME1,'est-1','취소','est-2','대기','est-3','승인','est-4','기각','error') AS OUTCOME1
                     , e.SIGN_DATE1
                     , e.SIGN_RSN1
                     , e.SIGN_ENO2
                     , DECODE(OUTCOME2,'est-1','취소','est-2','대기','est-3','승인','est-4','기각','error') AS OUTCOME2
                     , e.SIGN_DATE2
                     , e.SIGN_RSN2
                     , e.SIGN_ENO3
                     , DECODE(OUTCOME3,'est-1','취소','est-2','대기','est-3','승인','est-4','기각','error') AS OUTCOME3
                     , e.SIGN_DATE3
                     , e.SIGN_RSN3
                     , e.ASK_ENO
                     , e.EC_NO
                     , e.ESTI_OK 
                     , c.EC_NAME
                  FROM esti_list e
                  LEFT JOIN ESTI_CATALOG c
                  ON e.EC_NO = c.EC_NO WHERE ask_eno = peno AND outcome2 = 'est-3' AND outcome3 = 'est-2' ;
            END IF;
        END IF;
END;