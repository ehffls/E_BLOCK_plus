/*
	 거래처를 등록하는 쿼리
*/

INSERT INTO `eq_market`
SET mk_no	 = nextSeqVal('seq_mk_no')
  , mk_cname = '하드웨어납품업체' #{mk_cname} -- 유니크컬럼(중복시 입력불가)
  , mk_ename = '하드남(Hard-man)' #{mk_ename}
  , mk_ph	 = '010-8899-9898' #{mk_ph}
  , mk_fax	 = '02-3399-5850' #{mk_fax}
  , mk_email = 'hardware@market.com' #{mk_email}
  , mk_adate = DATE_FORMAT(now(), '%Y-%m-%d') /* 2011-06-14 */
;


SELECT * FROM `eq_market`;


INSERT INTO `eq_market`
SET mk_no	 = nextSeqVal('seq_mk_no')
  , mk_cname = '소프트웨어납품업체' #{mk_cname} -- 유니크컬럼(중복시 입력불가)
  , mk_ename = '소프맨트(Soft-man)' #{mk_ename}
  , mk_ph	 = '010-4545-1234' #{mk_ph}
  , mk_fax	 = '02-4545-4545' #{mk_fax}
  , mk_email = 'software@market.com' #{mk_email}
  , mk_adate = DATE_FORMAT(now(), '%Y-%m-%d') /* 2011-06-14 */
;
