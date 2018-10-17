CREATE OR REPLACE PROCEDURE EBLOCK_OSUB.proc_esti_sign(esti_pano IN number, sign_peno IN number, poutcome IN varchar2, sign_prsn IN varchar2, msg OUT varchar2)
IS
    sign_state esti_list%rowtype;
    result_state varchar2(8) := 'def';
BEGIN
    SELECT esti_ano, esti_email, ask_eno, ask_date, note, esti_price
    , sign_eno1, outcome1, sign_date1, sign_rsn1
    , sign_eno2, outcome2, sign_date2, sign_rsn2
    , sign_eno3, outcome3, sign_date3, sign_rsn3
    ,ec_no, esti_ok
    INTO sign_state.esti_ano, sign_state.esti_email, sign_state.ask_eno, sign_state.ask_date, sign_state.note, sign_state.esti_price
    , sign_state.sign_eno1, sign_state.outcome1, sign_state.sign_date1, sign_state.sign_rsn1
    , sign_state.sign_eno2, sign_state.outcome2, sign_state.sign_date2, sign_state.sign_rsn2
    , sign_state.sign_eno3, sign_state.outcome3, sign_state.sign_date3, sign_state.sign_rsn3
    ,sign_state.ec_no, sign_state.esti_ok
    FROM esti_list
    WHERE esti_ano = esti_pano;
    
    IF(sign_state.sign_eno1 = sign_peno) THEN
    
        UPDATE esti_list
        SET outcome1 = poutcome, sign_rsn1 = sign_prsn, sign_date1 = TO_CHAR(sysdate,'YYYY-MM-DD')
        WHERE esti_ano = esti_pano;
        msg := '1번째 결재가 성공하였습니다.';
        
    ELSIF(sign_state.sign_eno2 = sign_peno) THEN
    
        IF(sign_state.outcome1 = 'est-3') THEN
        
            UPDATE esti_list
            SET outcome2 = poutcome, sign_rsn2 = sign_prsn, sign_date2 = TO_CHAR(sysdate,'YYYY-MM-DD')
            WHERE esti_ano = esti_pano;
            msg := '2번째 결재가 성공하였습니다.';
            
        ELSE
        
            msg := '2번째로 선택되었으나 실패';
            
        END IF;
        
    ELSIF(sign_state.sign_eno3 = sign_peno) THEN
    
        IF(sign_state.outcome1 = 'est-3' AND sign_state.outcome2 = 'est-3') THEN
        
            UPDATE esti_list
            SET outcome3 = poutcome, sign_rsn3 = sign_prsn, sign_date3 = TO_CHAR(sysdate,'YYYY-MM-DD'), esti_ok = '1'
            WHERE esti_ano = esti_pano;
            
            SELECT outcome1, outcome2, outcome3 INTO sign_state.outcome1, sign_state.outcome2, sign_state.outcome3
            FROM esti_list
            WHERE esti_ano = esti_pano;
            
            IF(sign_state.outcome1 = 'est-3' AND sign_state.outcome2 = 'est-3' AND sign_state.outcome3 = 'est-3') THEN
            
                IF(sign_state.esti_ok = 0) THEN
                
                INSERT INTO esti_list_result(esti_ano,esti_rano, esti_email, ask_eno, ask_date, note, esti_price
                , sign_eno1, sign_date1, sign_rsn1
                , sign_eno2, sign_date2, sign_rsn2
                , sign_eno3, sign_date3, sign_rsn3, ec_no)
                values(SEQ_ESTI_ANO.nextval, sign_state.esti_ano, sign_state.esti_email, sign_state.ask_eno, sign_state.ask_date, sign_state.note, sign_state.esti_price
                , sign_state.sign_eno1, sign_state.sign_date1, sign_state.sign_rsn1
                , sign_state.sign_eno2, sign_state.sign_date2, sign_state.sign_rsn2
                , sign_state.sign_eno3, sign_state.sign_date3, sign_state.sign_rsn3, sign_state.ec_no);
                msg := '결재성공 후 성공리스트에 들어감';
                
                END IF;
            
            END IF;
            
        ELSE
        
            msg := '3번째로 선택되었으나 실패';
            
        END IF;
        
    ELSE
        msg := '내가 결재자로 설정되어있지 않습니다.';
    END IF;

    dbms_output.put_line(msg);
END;