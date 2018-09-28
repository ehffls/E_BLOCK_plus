UPDATE `attd_list`
SET at_sort = 'atd-d'#{at_sort} /*atd-a(야근)|atd-b(외근)|atd-c(출장)|atd-d(휴가)*/
    , ask_rsn = '쉬고싶습니다'#{at_rsn}
    , at_sdate = '2018-10-01'#{at_sdate}
    , at_fdate = '2018-10-03'#{at_fdate}
    , at_days = 3#{at_days}
    , outcome = 'atd-0' #{outcome} /*취소*/
WHERE at_no = 1#{au_no}
        AND ask_eno = 205#{e_no}