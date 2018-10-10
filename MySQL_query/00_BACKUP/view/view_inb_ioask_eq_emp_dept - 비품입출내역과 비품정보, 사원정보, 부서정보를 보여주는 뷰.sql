DROP VIEW IF EXISTS `view_inb_ioask_eq_emp_dp`;
CREATE OR REPLACE VIEW `view_inb_ioask_eq_emp_dp` AS
SELECT
      ioa.io_ano AS 'io_ano' -- 비품입출신청번호
    , ioa.inb_no      AS 'inb_no'      -- 비품번호
    , eq.eq_sort      AS 'eq_sort'   -- 비품분류
    , eq.eq_name      AS 'eq_name'   -- 비품이름
   ,e1.e_no         AS 'ask_eno'  -- 신청사원번호
    , e1.e_name      AS 'ask_ename' -- 신청사원이름
    , d1.d_name      AS 'ask_dname'   -- 신청부서이름
    , ioa.ask_date   AS 'ask_date'   -- 비품입출신청일자
    , CASE 
        WHEN ioa.io_sort = 'inb-0' THEN '대여'
        WHEN ioa.io_sort = 'inb-1' THEN '반납'
        WHEN ioa.io_sort = 'inb-2' THEN '분실'
        WHEN ioa.io_sort = 'inb-3' THEN '파손'
        ELSE 'ERROR' 
      END            AS 'io_sort'   -- 비품입출분류
    , CASE 
        WHEN ioa.outcome = 'ioa-0' THEN '취소'
        WHEN ioa.outcome = 'ioa-1' THEN '대기'
        WHEN ioa.outcome = 'ioa-2' THEN '기각'
        WHEN ioa.outcome = 'ioa-3' THEN '승인'
        ELSE 'ERROR' 
      END            AS 'outcome'   -- 비품입출신청결과
      ,e2.e_no      AS 'sign_eno'  -- 결재사원번호
    , e2.e_name      AS 'sign_ename'-- 결재사원번호
    , d2.d_name      AS 'sign_dname'-- 결재부서이름
    , CASE
        WHEN ioa.sign_date IS NULL THEN ' '
        ELSE ioa.sign_date
      END             AS 'sign_date'   -- 결재일자
    , ioa.ask_rsn      AS 'ask_rsn'   -- 신청사유
    , CASE ioa.outcome
        WHEN 'ioa-0' THEN '(취소완료)'
        WHEN 'ioa-1' THEN '<<-결재 대기중..'
        ELSE ioa.sign_rsn
      END            AS 'sign_rsn'   -- 결재사유
    
FROM
    `inb_ioask_list` ioa   

    -- 입고비품요청내역에서 입고비품의 이름까지 얻기위해 걸친 LEFT JOIN ( 좌측보장 )
        LEFT JOIN `inb_eq`inb 
        ON ioa.inb_no = inb.inb_no/* 자녀-부모 관계 */
        LEFT JOIN `eq` eq   
        ON inb.eq_no  = eq.eq_no    /* 부모-조부모 관계 */
        
    -- 입고비품요청내역에서 요청사원이름과 결재사원이름을 얻는 RIGHT JOIN ( 우측보장 )
        LEFT JOIN `emp` e1   
        ON ioa.ask_eno  = e1.e_no   /* 쌍둥이A-부모 관계 */
        LEFT JOIN `emp` e2   
        ON ioa.sign_eno = e2.e_no   /* 쌍둥이B-부모 관계 */
        
    -- 사원테이블에서 부서이름을 얻는 LEFT JOIN
        LEFT JOIN `dept` d1
        ON e1.d_no = d1.d_no /* 쌍둥이A-부모 관계 */
        LEFT JOIN `dept` d2   
        ON e2.d_no = d2.d_no /* 쌍둥이B-부모 관계 */
;

SELECT * FROM `view_inb_ioask_eq_emp_dp`;
