/*
    비품관리팀(8001) 결재권자(권한번호:37)에게 비품입출 신청된 나의 신청을 수정한다.
    수정하고자 하는 신청내역은 inb_ioask_list(비품입출신청내역)테이블에 입력된 로우로,
    다음 사항을 수정할 수 있다. (취소포함)
    
    - io_sort(입출분류) : 대여/보관/반납/분실 (신청대기상태중에 상태를 변경될 수 있다.)
    - ask_rsn(신청사유)
    - outcome(신청결과) : 자진 취소
*/

UPDATE
	 `inb_ioask_list`
SET
	  io_sort = 'inb-2'#{io_sort}  <!-- inb-0(대여) | 1(보관=반납) | 2(분실) | 3(파손) -->
	 ,ask_rsn = '비품대여신청 취소테스트'#{ask_rsn} <!-- 신청변경사유 -->
	 ,outcome = 'ioa-0'#{outcome}  <!-- ioa-0(취소) | 1(대기) -->
WHERE
	 io_ano = 1#{io_ano} <!-- 변경대상신청번호 -->
;


SELECT * FROM `inb_ioask_list`; -- 확인

