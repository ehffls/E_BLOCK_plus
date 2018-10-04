

CALL `dyn_cursor`('SELECT `ENGINE` FROM `information_schema`.`ENGINES`', NULL, @var1);
CALL `dyn_cursor`('SELECT 1 AS `uno` FROM `information_schema`.`TABLES`', NULL, @var2);
CALL `dyn_cursor`('SELECT -;', NULL, @var2);

DELIMITER ||
 
 
DROP PROCEDURE IF EXISTS `dyn_lock`;
CREATE PROCEDURE `dyn_lock`(IN `query` 	 TEXT
								  , IN `lock_name` CHAR(64)
                          , IN `timeout` 	 TINYINT UNSIGNED)
	NO SQL
	LANGUAGE SQL
	COMMENT 'Get a lock for dyn cursor'
BEGIN
	-- output from GET_LOCK()
	DECLARE lock_res TINYINT UNSIGNED;
 
	-- error in query
	DECLARE CONTINUE HANDLER
		FOR SQLEXCEPTION
		SIGNAL SQLSTATE VALUE '45000' SET
				MESSAGE_TEXT  = '[dyn_lock] Dynamic SQL returned an error';
 
	-- get lock or exit with err
	SET lock_res = GET_LOCK(`lock_name`, IFNULL(`timeout`, 5));
	IF (lock_res IS NULL) THEN
		SIGNAL SQLSTATE VALUE '45000' SET
				MESSAGE_TEXT  = '[dyn_lock] Could not acquire lock: Unknown error';
	ELSEIF (lock_res = 0) THEN
		SIGNAL SQLSTATE VALUE '45000' SET
				MESSAGE_TEXT  = '[dyn_lock] Could not acquire lock: Timeout expired';
	END IF;
 
	-- create dynamic view
	SET @dyn_sql = CONCAT('CREATE OR REPLACE VIEW `', lock_name, '` AS ', query, ';');
	PREPARE stmt_dyn_view FROM @dyn_sql;
	EXECUTE stmt_dyn_view;
	DEALLOCATE PREPARE stmt_dyn_view;
END;
 
 
DROP PROCEDURE IF EXISTS `dyn_cursor`;
CREATE PROCEDURE `dyn_cursor`(IN `query` TEXT, IN `timeout` TINYINT UNSIGNED, OUT x TEXT)
	READS SQL DATA
	LANGUAGE SQL
	COMMENT 'Simulate dynamic cursor'
BEGIN
	-- we assume there is only 1 column to be read;
	-- TEXT is good for any type
	DECLARE val TEXT;
	-- no more rows flag
	DECLARE eof BOOL;
 
	-- select data from a view. only the view is really dynamic
	DECLARE cur_dyn CURSOR FOR
		SELECT * FROM dyn_view;
 
	-- set eof flag
	DECLARE CONTINUE HANDLER
		FOR NOT FOUND
		SET eof = TRUE;
 
	CALL `dyn_lock`(`query`, 'dyn_view', `timeout`);
 
	-- open cursor on view
	OPEN cur_dyn;
 
	-- now that we have the cursor, we can release lock
	DO RELEASE_LOCK('dyn_view');
 	
	lp_dyn: LOOP
		IF eof = TRUE THEN
			LEAVE lp_dyn;
		END IF;
		
		FETCH cur_dyn INTO val;
	END LOOP;
 
	CLOSE cur_dyn;
 
	SET x = val;
END
 
 
||
DELIMITER ;