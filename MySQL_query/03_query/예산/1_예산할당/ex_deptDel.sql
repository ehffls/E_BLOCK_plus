INSERT INTO `bg_ex_list` (be_no, d_no, ex_eno, ex_sort, ex_cash, ex_date, ex_rsn, outcome) 
    VALUES(nextSeqVal('seq_be_no') 
    ,1231#{d_no} or (SELECT d_no FROM `dept` WHERE d_name = '마케팅팀') 
    ,24#{e_no} 
    ,'bg-a'#{ex_sort} 
    ,1000000#{ex_cash} 
    ,DATE_FORMAT(now(), '%Y-%m-%d') 
	,'철회했습니다.'#{ex_rsn} 
    ,'bg-0'#{outcome} 
);
