 { CALL proc_esti_catalog_price( #{standard_val} -- 내가 설정한 기준값
                             ,   #{up_percent} -- 초과
                             , #{down_percent} -- 이하
                             , #{result,mode=OUT,jdbcType=INTEGER,javaType=INTEGER})}