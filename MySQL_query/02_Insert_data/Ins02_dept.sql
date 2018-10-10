
	SELECT * FROM `dept`;
-- 	DELETE FROM `dept` WHERE d_no=1101;
-- 	UPDATE `dept` SET d_name='본부' WHERE d_name='사업본부';


-- #1000 : 본부
    INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
    VALUES 	(1000,'본부', '02-1026-1000','101호',3);

-- #1101 : 재무부
    INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
    VALUES 	(1101,'재무부', '02-1026-1101','102호',3);

-- #1200 : 사업부
    INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
    VALUES 	(1200,'사업부','02-1026-1200','103호',3);
	-- #1211 : 영업1팀
		INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
		VALUES 	(1211,'영업1팀','02-1026-1211','104호',3);   
	-- #1212 : 영업2팀
		INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
		VALUES 	(1212,'영업2팀','02-1026-1212','105호',3);		
	-- #1221 : 운영2팀
		INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
		VALUES 	(1221,'운영1팀','02-1026-1221','106호',3);
	-- #1222 : 운영2팀
		INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
		VALUES 	(1222,'운영2팀','02-1026-1222','107호',3);		
	-- #1231: 마케팅팀
		INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
		VALUES 	(1231,'마케팅팀', '02-1026-1231','108호',3);		
	-- #1241 : 인사팀
		INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
		VALUES 	(1241,'인사팀','02-1234-1241','109호',3);
	-- #1242 : 인사채용팀
		INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
		VALUES 	(1242,'인사채용팀','02-1234-1242','110호',3);
 
-- #1300 : 개발부
    INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
    VALUES 	(1300,'개발부', '02-1234-1300','301호',3);
	-- #1311 : 개발1팀
    INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
    VALUES 	(1311,'개발1팀','02-1234-1311','302호',3);
    -- #1312 : 개발2팀
    INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
    VALUES 	(1312,'개발2팀','02-1234-1312','303호',3);
    -- #1313 : 개발3팀
    INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
    VALUES 	(1313,'개발1팀','02-1234-1313','304호',3);
	-- #1314 : 개발4팀
    INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
    VALUES 	(1314,'개발4팀','02-1234-1314','305호',3);

    
-- #1400 : 디자인기획부
    INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
    VALUES 	(1400,'디자인기획부', '02-1026-1400','401호',3);
    -- #1411 : 제품디자인팀
		INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
		VALUES 	(1411,'제품디자인팀', '02-1026-1411','402호',3);
	-- #1421 : 영상디자인팀
		INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
		VALUES 	(1421,'디자인기획부', '02-1026-1421','403호',3);
	-- #1431 : 그래픽디자인팀
		INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
		VALUES 	(1431,'그래픽디자인팀', '02-1026-1431','404호',3);

	 -- #8001 : 비품관리팀
		INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
		VALUES 	(8001,'비품관리팀', '02-1026-8001','511호',3);

    -- #9001 : 운영지원팀
		INSERT INTO `dept`(d_no, d_name, d_ph, d_addr, c_no)
		VALUES 	(9001,'운영지원팀', '02-1026-9001','501호',3);