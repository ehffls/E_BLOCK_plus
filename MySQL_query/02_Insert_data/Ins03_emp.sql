
	load data infile '/Users/jeongryeol/Downloads/Ins01_comp.csv'-- csv파일 경로
	into table `EBLOCK`.`emp`
		fields terminated by ','
		lines terminated by '\n'
		ignore 1 lines
    (c_no, c_name, c_addr, c_ph, c_lat, c_lgt);-- 권한문제로 접속불가

	SELECT USER(),CURRENT_USER();

-- 

	SELECT * FROM `emp`;
-- 	DELETE FROM `emp` WHERE d_no=1101;
-- 	UPDATE `emp` SET d_name='본부' WHERE d_name='사업본부';


