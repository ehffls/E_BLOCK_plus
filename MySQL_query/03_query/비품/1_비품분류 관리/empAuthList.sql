/*
	 비품관련 결재권자 조회하기
*/

SELECT
	  `emp`.e_no    AS 'e_no'
    ,`emp`.e_name  AS 'e_name'
    ,`emp`.e_ph    AS 'e_ph'
    ,`dept`.d_name AS 'd_name'
    ,`dept`.d_ph   AS 'd_ph'
  FROM `EBLOCK`.`emp` NATURAL JOIN `EBLOCK`.`dept`
 WHERE `emp`.au_no = 35#{au_no}
   AND `dept`.d_no = 9001#{d_no}