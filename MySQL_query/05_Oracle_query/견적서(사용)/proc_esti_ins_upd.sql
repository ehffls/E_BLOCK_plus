{ CALL proc_esti_ins_upd( #{pesti_ano} -- 신청번호
 								 ,#{pec_no} -- 카달로그 번호
 								 ,#{pesti_email} -- 고객이메일
 								 ,#{p_note} -- 비고
 								 ,#{psign_eno1} -- 결제사원번호1 (차장) 
 								 ,#{psign_eno2} -- 결제사원번호2 (부서장) 
 								 ,#{psign_eno3} -- 결제사원번호3 (대표) 
 								 ,#{e_rank} -- 조회에서 가져온 자신의 직급번호
 								 ,#{pask_eno} -- 신청자 사원 번호 
                                 ,#{result,mode=OUT,jdbcType=NUMERIC,javaType=int}
                                )}