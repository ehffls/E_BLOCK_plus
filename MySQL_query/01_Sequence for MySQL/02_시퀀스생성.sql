/*
	@Title	: Create Sequences [ Author-Jeongryeol Lee ]
	@Info	: 시퀀스가 필요한 컬럼 등록하기
*/

--  [기본꼴] 프로시저 호출하여 시퀀스 생성하기
		CALL `EBLOCK`.`create_sequence`('seq_columnName');    
-- 	[기본꼴] 잘못 생성된 시퀀스 삭제하기
		DELETE FROM `sequences`
		 WHERE name ='seq_columnName';
-- 	[기본꼴] 결과 확인하기 
		SELECT * FROM `sequences`;

-- --------------------------------------------------------------------------------------------------

-- 	생성한 시퀀스 리스트
	CALL `EBLOCK`.`create_sequence`('seq_c_no');	-- comp	:회사
-- 	CALL `EBLOCK`.`create_sequence`('seq_d_no');	-- dept	:부서[개별부서번호지정]
	CALL `EBLOCK`.`create_sequence`('seq_e_no');	-- emp	:사원
    
	CALL `EBLOCK`.`create_sequence`('seq_cmt_no');	-- cmt_list	:출퇴근내역
	CALL `EBLOCK`.`create_sequence`('seq_at_no');	-- attd_list:근태신청내역
	CALL `EBLOCK`.`create_sequence`('seq_pev_lno');	-- pev_list	:인사평가변경내역
	CALL `EBLOCK`.`create_sequence`('seq_rt_no');	-- retire_ask_list:퇴사신청내역
    
    CALL `EBLOCK`.`create_sequence`('seq_mk_no');	-- eq_market	:비품 거래처
    CALL `EBLOCK`.`create_sequence`('seq_eq_addno');-- eq_add_list	:비품추가신청내역
    CALL `EBLOCK`.`create_sequence`('seq_eq_no');	-- eq			:신청가능비품
    CALL `EBLOCK`.`create_sequence`('seq_eq_pno');-- eq_purc_list	:비품구매신청내역
    CALL `EBLOCK`.`create_sequence`('seq_inb_no');	-- inb_eq		:입고비품
    CALL `EBLOCK`.`create_sequence`('seq_io_ano');	-- inb_ioask_list:비품입출신청내역
	
    CALL `EBLOCK`.`create_sequence`('seq_bg_no');	-- qrt_bg		:분기부서예산
	CALL `EBLOCK`.`create_sequence`('seq_be_no');	-- bg_ex_list	:예산집행내역
	CALL `EBLOCK`.`create_sequence`('seq_pay_no');	-- sal_pay_list	:급여지급내역4
    
-- --------------------------------------------------------------------------------------------------
-- 	제거한 시퀀스 리스트
	DELETE FROM `sequences` WHERE name ='seq_d_no';