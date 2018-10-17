{ CALL proc_esti_sign(   #{esti_pano} -- 신청번호
                               , #{sign_peno} -- 결제 사원 번호
                               , #{poutcome} -- 결제에 대한 상태(est-1:취소,est-2:대기,est-3:승인,est-4:기각)
                               , #{sign_prsn} -- 결제사유
                               , #{msg,mode=OUT,jdbcType=VARCHAR,javaType=String} -- 메세지 출력
                             )}