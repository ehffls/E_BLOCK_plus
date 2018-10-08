/*
	 등록된 거래처를 수정하는 쿼리
*/

UPDATE `eq_market`
SET mk_cname = '하드웨어납품업체' #{mk_cname}
  , mk_ename = '하드남(Hard-man)' #{mk_ename}
  , mk_ph	 = '010-8899-9898' #{mk_ph}
  , mk_fax	 = '02-3399-5850' #{mk_fax}
  , mk_email = 'hardware@market.com' #{mk_email}
  , mk_adate = DATE_FORMAT(now(), '%Y-%m-%d') /* 2011-06-14 */
WHERE mk_no = 1#{mk_no}
;

