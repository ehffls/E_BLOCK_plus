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

INSERT INTO `eq_market`
SET mk_no	 = nextSeqVal('seq_mk_no')
  , mk_cname = '가구납품업체' #{mk_cname} -- 유니크컬럼(중복시 입력불가)
  , mk_ename = '우디Woody(Soft-man)' #{mk_ename}
  , mk_ph	 = '010-9999-8282' #{mk_ph}
  , mk_fax	 = '02-9999-8282' #{mk_fax}
  , mk_email = 'woody@market.com' #{mk_email}
  , mk_adate = DATE_FORMAT(now(), '%Y-%m-%d') /* 2011-06-14 */
;

INSERT INTO `eq_market`
SET mk_no	 = nextSeqVal('seq_mk_no')
  , mk_cname = '필기구납품업체' #{mk_cname} -- 유니크컬럼(중복시 입력불가)
  , mk_ename = '드래프터(Drafter)' #{mk_ename}
  , mk_ph	 = '010-3344-2945' #{mk_ph}
  , mk_fax	 = '02-3344-2946' #{mk_fax}
  , mk_email = 'draft_shap@market.com' #{mk_email}
  , mk_adate = DATE_FORMAT(now(), '%Y-%m-%d') /* 2011-06-14 */
;

INSERT INTO `eq_market`
SET mk_no	 = nextSeqVal('seq_mk_no')
  , mk_cname = '도서납품업체' #{mk_cname} -- 유니크컬럼(중복시 입력불가)
  , mk_ename = '북맨(Book-man)' #{mk_ename}
  , mk_ph	 = '010-2727-2242' #{mk_ph}
  , mk_fax	 = '02-2727-2243' #{mk_fax}
  , mk_email = 'book-mans@market.com' #{mk_email}
  , mk_adate = DATE_FORMAT(now(), '%Y-%m-%d') /* 2011-06-14 */
;
