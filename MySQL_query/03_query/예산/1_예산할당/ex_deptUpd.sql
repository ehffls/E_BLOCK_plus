-- 집행내역 수정..?
UPDATE `bg_ex_list`
SET d_no = 1231#{d_no} or (SELECT d_no FROM `dept` WHERE d_name = '마케팅팀') 
    , ex_eno = 24#{e_no}
    , ex_cash = 1000000#{ex_cash}
    , ex_date = DATE_FORMAT(now(), '%Y-%m-%d') 
    , ex_rsn = '집행내역 수정'#{ex_rsn}
WHERE be_no = 1#{be_no}
  AND ex_sort = 'bg-a'
  AND outcome = 'bg-0'
;
