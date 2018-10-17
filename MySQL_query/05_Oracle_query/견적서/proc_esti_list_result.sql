CREATE OR REPLACE PROCEDURE EBLOCK_OSUB.proc_esti_list_result(peno IN number, ask_sign IN varchar2, esti_cur OUT SYS_REFCURSOR)
IS
BEGIN
    --1일경우 결재자 조회 0일경우 신청자 조회
    IF(ask_sign = '1') THEN
        OPEN esti_cur FOR 
            SELECT 
                     r.ESTI_ANO
                   , r.ESTI_EMAIL
                   , r.ASK_DATE
                   , r.NOTE
                   , r.ESTI_PRICE
                   , r.SIGN_ENO1
                   , r.SIGN_DATE1
                   , r.SIGN_RSN1
                   , r.SIGN_ENO2
                   , r.SIGN_DATE2
                   , r.SIGN_RSN2
                   , r.SIGN_ENO3
                   , r.SIGN_DATE3
                   , r.SIGN_RSN3
                   , r.ASK_ENO
                   , r.EC_NO
                   , r.ESTI_RANO
                   , c.EC_NAME 
               FROM esti_list_result r
                LEFT JOIN ESTI_CATALOG c
                ON r.EC_NO = c.EC_NO
                WHERE sign_eno1 = peno OR sign_eno2 = peno OR sign_eno3 = peno;
    ELSIF(ask_sign = '0') THEN
         OPEN esti_cur FOR 
             SELECT 
                     r.ESTI_ANO
                   , r.ESTI_EMAIL
                   , r.ASK_DATE
                   , r.NOTE
                   , r.ESTI_PRICE
                   , r.SIGN_ENO1
                   , r.SIGN_DATE1
                   , r.SIGN_RSN1
                   , r.SIGN_ENO2
                   , r.SIGN_DATE2
                   , r.SIGN_RSN2
                   , r.SIGN_ENO3
                   , r.SIGN_DATE3
                   , r.SIGN_RSN3
                   , r.ASK_ENO
                   , r.EC_NO
                   , r.ESTI_RANO
                   , c.EC_NAME 
               FROM esti_list_result r
                LEFT JOIN ESTI_CATALOG c
                ON r.EC_NO = c.EC_NO
               WHERE ask_eno = peno;
    END IF;
END;