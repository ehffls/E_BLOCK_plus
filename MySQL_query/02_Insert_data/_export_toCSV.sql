/*
	테이블로부터 csv파일에 export하기 : ( UTF-8로 동일하게 설정할 것 )
 */
    select * from `table_name` 
	into outfile '/directory/data/dummy.csv'
	fields terminated by ','
	lines terminated by '\n';