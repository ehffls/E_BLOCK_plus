/*
	 inb_eq(입고비품)테이블에서 조회된 입출신청가능한 비품 중에서
    비품관리팀(8001) 결재권자(권한번호:37)에게 비품입출 신청하는 쿼리
    
    신청내역은 inb_ioask_list(비품입출신청내역)테이블에 추가된다.
*/


INSERT INTO `inb_ioask_list`
SET   io_ano 	= nextSeqVal('seq_io_ano')
	 , ask_date	= DATE_FORMAT(now(), '%Y-%m-%d') -- <!-- '2018-10-26' -->
    , io_sort	= 'inb-0'#{io_sort}  <!-- inb-0(대여), 1(보관=반납), 2(분실), 3(파손) -->
    , ask_eno  = 17#{ask_eno} 		<!-- 신청사원번호 -->
    , sign_eno = (SELECT e_no FROM `emp`
					    WHERE d_no  = 8001  -- <!-- 비품관리팀 -->
					      AND au_no = 38	   -- <!-- 비품입출신청 승인권한(38) -->
					    ORDER BY e_rank DESC-- <!-- 부서내 최고선임 -->
								   ,e_no ASC 	-- <!-- 직급이 같은 경우 선입사자가 최고선임 -->
					    LIMIT 1)				-- <!-- 1명으로 한정조회` -->
    , inb_no	= 4#{inb_no}			<!-- 신청대상 입고비품번호 -->
    , ask_rsn	= '비품대여신청 테스트'#{ask_rsn} <!-- 신청사유 -->
;


SELECT e_no FROM `emp`
					    WHERE d_no  = 8001  -- <!-- 비품관리팀 -->
					      AND au_no = 38	   -- <!-- 비품입출신청 승인권한(38) -->
					    ORDER BY e_rank DESC-- <!-- 부서내 최고선임 -->
								   ,e_no ASC 	-- <!-- 직급이 같은 경우 선입사자가 최고선임 -->
					    LIMIT 1;

-- 리스트 내 신청입력 확인
SELECT * FROM `inb_ioask_list`;

-- 대상 변경 확인 (트리거 작동여부) : 대여신청이므로 입력안되야 정상임
SELECT * FROM `inb_eq`;

-- 대상 기록 확인 (트리거 작동여부) : 대여신청이므로 입력안되야 정상임
SELECT * FROM `inb_io_list`;