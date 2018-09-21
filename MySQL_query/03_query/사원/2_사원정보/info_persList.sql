SELECT
	 e.e_no e_no, e.e_id e_id, e.e_name e_name
	,e.e_jdate e_jdate, e.au_no au_no, e.e_rank e_rank, e.e_ph e_ph
    ,e.e_email e_mail, e.e_addr e_addr, e.note note
    ,e.e_bdate e_bdate, e.gender gender, d.d_name d_name
  FROM emp e, dept d
 WHERE e.d_no = d.d_no
   AND e.e_no = 1#{e_no}
   AND e.e_name = '김동연'#{e_name}
   AND d.d_name = '본부'#{d_name}
   AND e.e_jdate >= '2016-09-01'#{e_jdate}
 ORDER BY e.e_rank desc, e.e_no