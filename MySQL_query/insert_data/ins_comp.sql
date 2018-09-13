	load data infile '/Users/jeongryeol/Downloads/Ins01_comp.csv'-- csv파일 경로
	into table `EBLOCK`.`comp`
		fields terminated by ','
		lines terminated by '\n'
		ignore 1 lines
    (c_no, c_name, c_addr, c_ph, c_lat, c_lgt);