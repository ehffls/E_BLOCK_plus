
	load data infile '/Users/jeongryeol/Downloads/Ins01_comp.csv'-- csv파일 경로
	into table `EBLOCK`.`comp`
		fields terminated by ','
		lines terminated by '\n'
		ignore 1 lines
    (c_no, c_name, c_addr, c_ph, c_lat, c_lgt);-- 권한문제로 접속불가

	SELECT USER(),CURRENT_USER();

-- 
    
    SELECT * FROM `comp`;

    DELETE FROM `comp` WHERE c_no = 4 or c_no = null;
                
	UPDATE `comp` SET c_ph='042-860-6114'
     WHERE c_no = 1;
    
--

	-- #1
    INSERT INTO `comp`(c_no, c_name, c_addr, c_ph, c_lat, c_lgt)
    VALUES 	(nextSeqVal('seq_c_no')
			,'전자정보통신연구원_ETRI'
			,'대전광역시 유성구 가정로 218'
			,'042-860-6114'
			,36.381754, 127.366019
			);

	-- #2
    INSERT INTO `comp`(c_no, c_name, c_addr, c_ph, c_lat, c_lgt)
    VALUES 	(nextSeqVal('seq_c_no')
			,'E.BLOCK+'
			,'서울특별시 금천구 가산디지털단지로 123 3층 311호 5강의실'
			,'02-0000-1111'
			,37.478842, 126.878637
			);

	-- #3 : 프로젝트 타겟이 되는 중소규모 벤처기업
    INSERT INTO `comp`(c_no, c_name, c_addr, c_ph, c_lat, c_lgt)
    VALUES 	(nextSeqVal('seq_c_no')
			,'Want2BIGsoft'
			,'서울특별시 구로구 구로3동 187-1'
			,'02-0000-1111'
			,37.485789, 126.899117
			);
