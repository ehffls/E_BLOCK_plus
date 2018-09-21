SELECT
	 d_name, e_no, e_name, e_rank, cmt_date,
    first_check, attend,
    last_check, lv_state,
    io_state
  FROM view_cmt_list
 WHERE e_no = 3#{e_no}
   AND d_name = '본부'#{d_name}
   AND cmt_date >= '2018-09-01'#{prev_cmt_date}
   AND cmt_date <= '2018-09-30'#{post_cmt_date}
 ORDER BY d_name;
 
 
 
SELECT * FROM view_cmt_list;