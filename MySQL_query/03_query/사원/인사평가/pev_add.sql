-- pev_add
-- 인사평가기간에 인사평가 입력하기

-- ev_sort 컬럼 삭제 ( 20180918 - Jeongryeol Lee )
ALTER TABLE `pev` DROP ev_sort;
ALTER TABLE `pev_list` DROP ev_sort;
commit;

-- qrt_no 테이블 타입 변경
ALTER TABLE `pev` MODIFY qrt_no varchar(8);
ALTER TABLE `pev_list` MODIFY qrt_no varchar(8);
 
--
SELECT * FROM `pev`;
DELETE FROM `pev` WHERE ev_eno = 2;

-- 분기쿼터 생성
SELECT CONCAT(date_format(now(),'%Y0'),quarter(now()),date_format(now(),'%m')) FROM dual

/*
	INSERT 요청시
	키가 중복되지 않으면, 1건 입력후 1을 리턴
    키가 중복되면, 중복된 키에 입력이 실행되면서 UPDATE를 실행하여 2를 리턴
 */
INSERT INTO `pev`(ev_eno,tg_eno,qrt_no,ev_date,ev_content,ev_score)
VALUES (2#{ev_eno}
       ,4#{tg_eno}
       ,CONCAT(date_format(now(),'%y-'),quarter(now()),date_format(now(),'-%m'))
       ,DATE_FORMAT(now(), '%Y-%m-%d') /* 2011-06-14 */
       ,'평가내용'#{ev_content}
       ,99#{ev_content}
       )
ON DUPLICATE KEY UPDATE
    ev_date = DATE_FORMAT(now(), '%Y-%m-%d')
   ,ev_content = '평가내용'#{ev_content}
   ,ev_score = 99#{ev_content}
;
