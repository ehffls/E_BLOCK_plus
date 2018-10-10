
CREATE TABLE attd_list
(
	ask_eno              NUMERIC(6) NOT NULL,
	sign_eno             NUMERIC(6) NULL,
	at_no                NUMERIC(8) NOT NULL,
	ask_date             VARCHAR(10) NULL,
	at_sort              VARCHAR(5) NULL,
	ask_rsn              VARCHAR(500) NULL,
	at_sdate             VARCHAR(10) NULL,
	at_fdate             VARCHAR(10) NULL,
	at_days              NUMERIC(3,1) NULL,
	outcome              VARCHAR(5) NULL,
	sign_rsn             VARCHAR(500) NULL,
	sign_date            VARCHAR(10) NULL,
	d_no                 NUMERIC(4) NOT NULL
);



ALTER TABLE attd_list
ADD PRIMARY KEY (at_no);



CREATE TABLE auth
(
	au_no                NUMERIC(4) NOT NULL,
	au_scope             VARCHAR(300) NULL
);



ALTER TABLE auth
ADD PRIMARY KEY (au_no);



CREATE TABLE bg_ex_list
(
	be_no                NUMERIC(8) NOT NULL,
	d_no                 NUMERIC(4) NOT NULL,
	ex_eno               NUMERIC(6) NOT NULL,
	ex_sort              VARCHAR(5) NULL,
	ex_cash              NUMERIC(12) NULL,
	ex_date              VARCHAR(10) NULL,
	ex_rsn               VARCHAR(500) NULL,
	outcome              VARCHAR(5) NULL
);



ALTER TABLE bg_ex_list
ADD PRIMARY KEY (be_no);



CREATE TABLE cmt_list
(
	cmt_no               NUMERIC(8) NOT NULL,
	e_no                 NUMERIC(6) NOT NULL,
	cmt_date             VARCHAR(10) NULL,
	cmt_time             VARCHAR(8) NULL
);



ALTER TABLE cmt_list
ADD PRIMARY KEY (cmt_no);



CREATE TABLE cntr_list
(
	e_no                 NUMERIC(6) NOT NULL,
	cntr_date            VARCHAR(10) NOT NULL,
	cntr_sort            VARCHAR(5) NULL,
	cntr_sal             NUMERIC(9) NULL,
	cntr_sdate           VARCHAR(10) NULL,
	cntr_fdate           VARCHAR(10) NULL,
	e_rank               VARCHAR(30) NULL,
	note                 VARCHAR(500) NULL,
	cntr_state           VARCHAR(5) NULL DEFAULT '����'
);



ALTER TABLE cntr_list
ADD PRIMARY KEY (e_no,cntr_date);



CREATE TABLE comp
(
	c_no                 NUMERIC(4) NOT NULL,
	c_name               VARCHAR(50) NOT NULL,
	c_addr               VARCHAR(100) NULL,
	c_ph                 VARCHAR(13) NULL,
	c_lat                NUMERIC(9,6) NULL,
	c_lgt                NUMERIC(9,6) NULL
);



ALTER TABLE comp
ADD PRIMARY KEY (c_no);



CREATE TABLE dept
(
	d_no                 NUMERIC(4) NOT NULL,
	d_name               VARCHAR(30) NULL,
	d_ph                 VARCHAR(13) NULL,
	d_addr               VARCHAR(100) NULL,
	c_no                 NUMERIC(4) NOT NULL
);



ALTER TABLE dept
ADD PRIMARY KEY (d_no);



CREATE TABLE emp
(
	e_no                 NUMERIC(6) NOT NULL,
	d_no                 NUMERIC(4) NOT NULL,
	e_id                 VARCHAR(30) NULL,
	e_pw                 VARCHAR(30) NULL,
	e_name               VARCHAR(30) NULL,
	e_jdate              VARCHAR(10) NULL,
	au_no                NUMERIC(4) NULL DEFAULT 0,
	e_ph                 VARCHAR(13) NULL,
	e_email              VARCHAR(50) NULL,
	e_addr               VARCHAR(100) NULL,
	note                 VARCHAR(500) NULL,
	e_bdate              VARCHAR(10) NULL,
	gender               VARCHAR(1) NULL,
	e_rank               NUMERIC(2) NULL DEFAULT 0
);



ALTER TABLE emp
ADD PRIMARY KEY (e_no);



CREATE TABLE eq
(
	eq_no                NUMERIC(8) NOT NULL,
	eq_sort              VARCHAR(5) NULL,
	eq_name              VARCHAR(50) NULL,
	cost                 NUMERIC(12) NULL,
	eq_date              VARCHAR(10) NULL,
	mk_no                NUMERIC(4) NOT NULL
);



ALTER TABLE eq
ADD PRIMARY KEY (eq_no);



CREATE TABLE eq_add_list
(
	eq_addno             NUMERIC(8) NOT NULL,
	ask_eno              NUMERIC(6) NOT NULL,
	sign_eno             NUMERIC(6) NULL,
	ask_date             VARCHAR(10) NULL,
	eq_sort              VARCHAR(5) NULL,
	eq_name              VARCHAR(50) NULL,
	outcome              VARCHAR(5) NULL DEFAULT 'eqa-1',
	mk_no                NUMERIC(4) NOT NULL,
	sign_date            VARCHAR(10) NULL,
	sign_rsn             VARCHAR(500) NULL
);



ALTER TABLE eq_add_list
ADD PRIMARY KEY (eq_addno);



CREATE TABLE eq_market
(
	mk_no                NUMERIC(4) NOT NULL,
	mk_cname             VARCHAR(50) NOT NULL,
	mk_ename             VARCHAR(30) NOT NULL,
	mk_ph                VARCHAR(13) NOT NULL,
	mk_fax               VARCHAR(14) NULL,
	mk_email             VARCHAR(50) NULL,
	mk_adate             VARCHAR(10) NULL
);



ALTER TABLE eq_market
ADD PRIMARY KEY (mk_no);



CREATE TABLE eq_purc_list
(
	eq_pno               NUMERIC(8) NOT NULL,
	ask_date             VARCHAR(10) NULL,
	outcome              VARCHAR(5) NULL DEFAULT 'ibp-1',
	sign_date            VARCHAR(10) NULL,
	num                  NUMERIC(4) NULL,
	subtotal             NUMERIC(12) NULL,
	ask_eno              NUMERIC(6) NOT NULL,
	sign_eno             NUMERIC(6) NULL,
	eq_no                NUMERIC(8) NOT NULL
);



ALTER TABLE eq_purc_list
ADD PRIMARY KEY (eq_pno);



CREATE TABLE eq_sort
(
	eq_sort              VARCHAR(30) NOT NULL
);



ALTER TABLE eq_sort
ADD PRIMARY KEY (eq_sort);



CREATE TABLE inb_eq
(
	inb_no               VARCHAR(6) NOT NULL,
	inb_date             VARCHAR(10) NULL,
	inb_state            VARCHAR(5) NULL DEFAULT 'inb-1',
	eq_no                NUMERIC(8) NOT NULL
);



ALTER TABLE inb_eq
ADD PRIMARY KEY (inb_no);



CREATE TABLE inb_io_list
(
	io_no                NUMERIC(8) NOT NULL,
	inb_state            VARCHAR(5) NULL DEFAULT 'inb-1',
	sign_date            VARCHAR(10) NULL,
	inb_no               VARCHAR(6) NOT NULL,
	ask_eno              NUMERIC(6) NOT NULL
);



ALTER TABLE inb_io_list
ADD PRIMARY KEY (io_no);



CREATE TABLE inb_ioask_list
(
	io_ano               NUMERIC(8) NOT NULL,
	ask_date             VARCHAR(10) NULL,
	io_sort              VARCHAR(5) NOT NULL,
	outcome              VARCHAR(5) NULL DEFAULT 'ioa-1',
	sign_date            VARCHAR(10) NULL,
	ask_eno              NUMERIC(6) NOT NULL,
	sign_eno             NUMERIC(6) NOT NULL,
	inb_no               VARCHAR(6) NOT NULL,
	ask_rsn              VARCHAR(500) NULL,
	sign_rsn             VARCHAR(500) NULL
);



ALTER TABLE inb_ioask_list
ADD PRIMARY KEY (io_ano);



CREATE TABLE pev
(
	ev_eno               NUMERIC(6) NOT NULL,
	tg_eno               NUMERIC(6) NOT NULL,
	qrt_no               VARCHAR(8) NOT NULL,
	ev_date              VARCHAR(10) NULL,
	ev_content           VARCHAR(500) NULL,
	ev_score             NUMERIC(2) NULL,
	ratio                NUMERIC(3,2) NULL
);



ALTER TABLE pev
ADD PRIMARY KEY (qrt_no,ev_eno,tg_eno);



CREATE TABLE pev_list
(
	pev_lno              NUMERIC(8) NOT NULL,
	qrt_no               VARCHAR(8) NULL,
	ev_eno               NUMERIC(6) NULL,
	tg_eno               NUMERIC(6) NULL,
	ev_date              VARCHAR(10) NULL,
	ev_content           VARCHAR(500) NULL,
	ev_score             NUMERIC(2) NULL,
	ratio                NUMERIC(3,2) NULL
);



ALTER TABLE pev_list
ADD PRIMARY KEY (pev_lno);



CREATE TABLE qrt_bg
(
	bg_no                NUMERIC(8) NOT NULL,
	qrt_no               NUMERIC(8) NULL,
	cfw_bg               NUMERIC(12) NULL,
	add_bg               NUMERIC(12) NULL,
	spd_bg               NUMERIC(12) NULL,
	rst_bg               NUMERIC(12) NULL,
	d_no                 NUMERIC(4) NOT NULL
);



ALTER TABLE qrt_bg
ADD PRIMARY KEY (bg_no);



CREATE TABLE retire_ask_list
(
	rt_no                NUMERIC(6) NOT NULL,
	ask_date             VARCHAR(10) NULL,
	rt_date              VARCHAR(10) NOT NULL,
	outcome              VARCHAR(5) NOT NULL,
	ask_rsn              VARCHAR(500) NOT NULL,
	sign_rsn             VARCHAR(500) NULL,
	sign_date            VARCHAR(10) NULL,
	ask_eno              NUMERIC(6) NOT NULL,
	sign_eno             NUMERIC(6) NULL
);



ALTER TABLE retire_ask_list
ADD PRIMARY KEY (rt_no);



CREATE TABLE sal_pay_list
(
	pay_no               NUMERIC(8) NOT NULL,
	pay_sort             VARCHAR(5) NULL,
	pay_cash             NUMERIC(12) NULL,
	pay_date             VARCHAR(10) NULL,
	note                 VARCHAR(500) NULL,
	e_no                 NUMERIC(6) NOT NULL
);



ALTER TABLE sal_pay_list
ADD PRIMARY KEY (pay_no);



ALTER TABLE attd_list
ADD FOREIGN KEY FK__attd_list_ask_eno__emp_e_no (ask_eno) REFERENCES emp (e_no);



ALTER TABLE attd_list
ADD FOREIGN KEY FK__attd_list_sign_eno__emp_e_no (sign_eno) REFERENCES emp (e_no);



ALTER TABLE attd_list
ADD FOREIGN KEY FK__attd_list_d_no__dept_d_no (d_no) REFERENCES dept (d_no);



ALTER TABLE bg_ex_list
ADD FOREIGN KEY FK__bg_ex_list_d_no__dept_d_no (d_no) REFERENCES dept (d_no);



ALTER TABLE bg_ex_list
ADD FOREIGN KEY FK__bg_ex_list_ex_eno__emp_e_no (ex_eno) REFERENCES emp (e_no);



ALTER TABLE cmt_list
ADD FOREIGN KEY FK__cmt_list_e_no__emp_e_no (e_no) REFERENCES emp (e_no);



ALTER TABLE cntr_list
ADD FOREIGN KEY FK__cntr_list_e_no__emp_e_no (e_no) REFERENCES emp (e_no);



ALTER TABLE dept
ADD FOREIGN KEY FK__dept_c_no__comp_c_no (c_no) REFERENCES comp (c_no);



ALTER TABLE emp
ADD FOREIGN KEY FK__emp_d_no__dept_d_no (d_no) REFERENCES dept (d_no);



ALTER TABLE eq
ADD FOREIGN KEY FK__eq_mk_no__eq_market_mk_no (mk_no) REFERENCES eq_market (mk_no);



ALTER TABLE eq_add_list
ADD FOREIGN KEY FK__eq_add_list_ask_eno__emp_e_no (ask_eno) REFERENCES emp (e_no);



ALTER TABLE eq_add_list
ADD FOREIGN KEY FK__eq_add_list_sign_eno__emp_e_no (sign_eno) REFERENCES emp (e_no);



ALTER TABLE eq_add_list
ADD FOREIGN KEY FK__eq_add_list_mk_no__eq_market_mk_no (mk_no) REFERENCES eq_market (mk_no);



ALTER TABLE eq_purc_list
ADD FOREIGN KEY FK__eq_purc_list_ask_eno__emp_e_no (ask_eno) REFERENCES emp (e_no);



ALTER TABLE eq_purc_list
ADD FOREIGN KEY FK__eq_purc_list_sign_eno__emp_e_no (sign_eno) REFERENCES emp (e_no);



ALTER TABLE eq_purc_list
ADD FOREIGN KEY FK__eq_purc_list_eq_no__eq_eq_no (eq_no) REFERENCES eq (eq_no);



ALTER TABLE inb_eq
ADD FOREIGN KEY FK__inb_eq_eq_no__eq_eq_no (eq_no) REFERENCES eq (eq_no);



ALTER TABLE inb_io_list
ADD FOREIGN KEY FK__inb_io_list_inb_no__inb_eq_inb_no (inb_no) REFERENCES inb_eq (inb_no);



ALTER TABLE inb_io_list
ADD FOREIGN KEY FK__inb_io_list_ask_eno__emp_e_no (ask_eno) REFERENCES emp (e_no);



ALTER TABLE inb_ioask_list
ADD FOREIGN KEY FK__inb_ioask_list_ask_eno__emp_e_no (ask_eno) REFERENCES emp (e_no);



ALTER TABLE inb_ioask_list
ADD FOREIGN KEY FK__inb_ioask_list_sign_eno__emp_e_no (sign_eno) REFERENCES emp (e_no);



ALTER TABLE inb_ioask_list
ADD FOREIGN KEY FK__inb_ioask_list_inb_no__inb_eq_inb_no (inb_no) REFERENCES inb_eq (inb_no);



ALTER TABLE pev
ADD FOREIGN KEY FK__pev_ev_eno__emp_e_no (ev_eno) REFERENCES emp (e_no);



ALTER TABLE pev
ADD FOREIGN KEY FK__pev_tg_eno__emp_e_no (tg_eno) REFERENCES emp (e_no);



ALTER TABLE qrt_bg
ADD FOREIGN KEY FK__qrt_bg_d_no__dept_d_no (d_no) REFERENCES dept (d_no);



ALTER TABLE retire_ask_list
ADD FOREIGN KEY FK__retire_ask_list_ask_eno__emp_e_no (ask_eno) REFERENCES emp (e_no);



ALTER TABLE retire_ask_list
ADD FOREIGN KEY FK__retire_ask_list_sign_eno__emp_e_no (sign_eno) REFERENCES emp (e_no);



ALTER TABLE sal_pay_list
ADD FOREIGN KEY FK__sal_pay_list_e_no__emp_e_no (e_no) REFERENCES emp (e_no);


CREATE TABLE sequences (name VARCHAR(32), currval BIGINT UNSIGNED);

