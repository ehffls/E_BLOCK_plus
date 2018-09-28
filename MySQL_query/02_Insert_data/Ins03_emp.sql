
-- 	import csv file ( EBLOCK-Table Data Import Wizard에서 불러오기 )

	SELECT * FROM `emp`;
-- 	DELETE FROM `emp` WHERE d_no=1101;
-- 	UPDATE `emp` SET d_name='본부' WHERE d_name='사업본부';


select * from sequences;

UPDATE sequences
    SET currval=185
    WHERE name = 'seq_e_no';