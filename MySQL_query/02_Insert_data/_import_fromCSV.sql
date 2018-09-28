/*
	csv파일로부터 테이블에 import하기 : ( UTF-8로 동일하게 설정할 것 )
 */
	load data infile '/directory/data/dummy.csv'-- csv파일 경로
	into table `table_name`-- 테이블명
		fields terminated by ','-- 구분자
		lines terminated by '\n'-- 행구분자
		ignore 1 lines-- 1행 무시옵션
	-- 아래 컬럼명 입력
    (col1
    ,col2
    ,col3
    );