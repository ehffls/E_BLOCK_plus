/*
	@Title	: Test Sequences [ Author-Jeongryeol Lee ]
	@Info	: 생성된 시퀀스 단위테스트
*/

-- 1. 테스트 시퀀스 입력하기
INSERT INTO sequences VALUES ('seq_columnName', 0);

-- 5. 활용하기 : 생성된 시퀀스로부터 nextval 값 가져오기
select nextSeqVal('seq_columnName') as seq_columnName_val from dual;

select currSeqVal('seq_columnName') as seq_columnName_val from dual;

UPDATE `sequences`SET currval = 99
 WHERE name = 'seq_columnName';

select * from `sequences`;