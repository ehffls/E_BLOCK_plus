/*
    inb_ioask_list(비품입출신청내역)테이블에 입력되어 대기중인 입출신청건을 결재한다.
    다음 사항이 결재에 반영되어야한다.
    
    - sign_rsn(결재사유)
    - outcome(신청결과) : 기각 | 승인
    
    승인이 되는 경우,
    inb_eq(입고비품)과 inb_io_list(비품입출내역)로
    트리거가 작동한다.[trg_inb_ioask_list]
*/

UPDATE
	 `inb_ioask_list`
SET
	  sign_date = DATE_FORMAT(now(), '%Y-%m-%d') -- <!-- 결재일자 '2018-10-26' -->
	 ,sign_rsn = '비품대여신청 결재테스트:승인'#{ask_rsn} <!-- 신청변경사유 -->
	 ,outcome = 'ioa-3'#{outcome}  <!-- ioa-2(기각) | 3(승인) -->
WHERE
	 io_ano   = 3#{io_ano} <!-- 결재대상신청번호 -->
AND outcome  = 'ioa-1' -- <!-- 대기중인 신청에 한정 -->
AND sign_eno = 16#{sign_eno} <!-- 결재대상신청번호 -->
;

UPDATE
	 `inb_ioask_list`
SET
	  sign_date = DATE_FORMAT(now(), '%Y-%m-%d') -- <!-- 결재일자 '2018-10-26' -->
	 ,sign_rsn = '비품대여신청 결재테스트:기각'#{ask_rsn} <!-- 신청변경사유 -->
	 ,outcome = 'ioa-2'#{outcome}  <!-- ioa-2(기각) | 3(승인) -->
WHERE
	 io_ano   = 4#{io_ano} <!-- 결재대상신청번호 -->
AND outcome  = 'ioa-1' -- <!-- 대기중인 신청에 한정 -->
AND sign_eno = 16#{sign_eno} <!-- 결재대상신청번호 -->
;

SELECT * FROM `inb_ioask_list`; -- 확인

-- 대상 변경 확인 (트리거 작동여부) : 승인때만 갱신
SELECT * FROM `inb_eq`;

-- 대상 기록 확인 (트리거 작동여부) : 승인때만 입력
SELECT * FROM `inb_io_list`;

