-- 내출결조회(달력)용 별도 쿼리

SELECT
	 d_name, e_no, e_name, e_rank,
    CONCAT(cmt_date,'T',first_check) AS 'checkin',
    IF(last_check='--:--:--'
      ,NULL
      ,CONCAT(cmt_date,'T',last_check)) AS 'checkout',
	 attend,lv_state, io_state
  FROM view_cmt_list
 WHERE e_no = 3#{e_no}
;