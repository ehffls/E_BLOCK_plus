{ CALL proc_esti_list_result( #{peno} -- 사원 번호
		   						    , #{ask_sign} -- 구분(1:결제자 조회, 0:신청자 조회)
		   						    , #{esti_cur,mode=OUT,jdbcType=CURSOR,javaType=ResultSet, resultMap=list_result_map} )}