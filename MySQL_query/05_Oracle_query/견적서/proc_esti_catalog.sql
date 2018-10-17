CREATE OR REPLACE PROCEDURE EBLOCK_OSUB.proc_esti_catalog(catalog_cur OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN catalog_cur FOR SELECT ec_no, ec_name, ec_price FROM esti_catalog;
END;