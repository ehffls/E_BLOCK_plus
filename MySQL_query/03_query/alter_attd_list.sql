-- 새로운 컬럼을 만들어 fk를 추가할때는 이미 있는 테이블에서 무결성 제약이 걸리지 않는지 확인 필요
ALTER TABLE `EBLOCK`.`attd_list` 
ADD COLUMN `d_no` DECIMAL(4,0) NOT NULL AFTER `sign_date`,
ADD INDEX `attd_list_ibfk_3_idx` (`d_no` ASC);
;

ALTER TABLE `EBLOCK`.`attd_list` 
ADD CONSTRAINT `attd_list_ibfk_3`
  FOREIGN KEY (`d_no`)
  REFERENCES `EBLOCK`.`dept` (`d_no`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;