/*
	 -- FK로 설정할 컬럼추가하기
	 ALTER TABLE `테이블명`
	 ADD `새컬럼명` 자료형
	 AFTER `앞컬럼명` | FIRST
*/

	 ALTER TABLE `eq_add_list`
	 ADD `mk_no` NUMERIC(4) NOT NULL
	 AFTER `outcome`
	 ;

/*
	 -- PK로부터 FK로 설정하기
	 ALTER TABLE 테이블이름
	 ADD [CONSTRAINT 제약조건이름]
	 FOREIGN KEY (필드이름)
	 REFERENCES 테이블이름 (필드이름)
*/
	 ALTER TABLE `eq_add_list`
	 ADD CONSTRAINT `fk_mk_no`
	 FOREIGN KEY (`mk_no`)
	 REFERENCES `eq_market`(`mk_no`)
    ON DELETE CASCADE -- 부모키가 삭제되면 자식키의 값도 삭제되는 기능
	 ;

/*
	 -- 해당 테이블의 설정된 FK 삭제하기
    ALTER TABLE `eq_add_list`
	 DROP FOREIGN KEY `fk_mk_no`;
*/
    ALTER TABLE `eq_add_list`
	 DROP FOREIGN KEY `fk_mk_no`;

/*
	 -- 테이블 기준으로 설정한 FK확인하기
    SELECT * FROM information_schema.table_constraints
     WHERE TABLE_NAME = '테이블명'
       AND CONSTRAINT_NAME = '제약조건이름';
*/
	 SELECT * FROM information_schema.table_constraints
	  WHERE TABLE_NAME = 'eq_add_list'
       AND CONSTRAINT_NAME = 'fk_mk_no';
     
/*
	 -- 데이터베이스 기준으로 FK 확인하기
    SELECT * FROM information_schema.table_constraints
     WHERE CONSTRAINT_SCHEMA = '데이터베이스명'
       AND CONSTRAINT_NAME = '제약조건이름';
*/
	 SELECT * FROM information_schema.table_constraints
     WHERE CONSTRAINT_SCHEMA = 'EBLOCK'
       AND CONSTRAINT_NAME = 'fk_mk_no';