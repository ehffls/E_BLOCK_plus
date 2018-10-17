CREATE OR REPLACE PROCEDURE EBLOCK_OSUB.proc_esti_catalog_price(standard_val IN number, up_percent IN number, down_percent IN number, result OUT NUMBER)
IS
    catalog esti_catalog%rowtype;
    CURSOR c_price is SELECT ec_no, ec_name, ec_price FROM esti_catalog;
BEGIN
    result := 0;
    OPEN c_price;
        LOOP
            fetch c_price INTO catalog.ec_no, catalog.ec_name, catalog.ec_price;
            EXIT WHEN c_price%NOTFOUND; 
            -- 이하, 초과
            IF(catalog.ec_price <= standard_val) THEN
                UPDATE esti_catalog
                 SET ec_price = ec_price*down_percent
                WHERE ec_no = catalog.ec_no;
                    
            ELSIF(catalog.ec_price > standard_val) THEN
                UPDATE esti_catalog
                 SET ec_price = ec_price*up_percent
                WHERE ec_no = catalog.ec_no;
            END IF;
        END LOOP;
    Close c_price;
    
    -- 반복문 예외처리부
    EXCEPTION
        WHEN others THEN
        dbms_output.put_line('<<<ERROR>>>');
        dbms_output.put_line('에러코드:'||sqlcode);
           
    COMMIT;
    result :=1; 
       
END;