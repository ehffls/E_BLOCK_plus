package eblock.c_daoTest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import eblock.c_dao.EquipDao;

public class EquipDaoTest {
	Logger logger = Logger.getLogger(EquipDaoTest.class);
	List<Map<String, Object>> rlist = null;
	int result = 0;
			
	public static void main(String[] args) {
		EquipDaoTest eqDaoT = new EquipDaoTest();
		EquipDao 	 eqDao  = new EquipDao();
		Map<String,Object> pMap = new HashMap<String, Object>();
		eqDaoT.testMethod(eqDao, pMap);
		eqDaoT.printConsole();
	}

	
	
	private void printConsole() {
		logger.info("--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
		if(rlist!=null)	logger.info("  rlist = "+rlist); 
		if(result!=0)	logger.info(" result = "+result); 
		logger.info("--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
	}



	private void testMethod(EquipDao eqDao, Map<String,Object> pMap) {
		
	/* 비품분류관리 */
		
		//결재권 조회하기	
//		pMap.put("au_no", 3);
//		rlist = eqDao.emp_authList(pMap);
		
		//결재권자 조회하기
//		pMap.put("d_no",1000);
//		rlist = eqDao.emp_authorList(pMap);
		
		//비품분류 등록하기
//		pMap.put("eq_sort","추가비품분류");
//		pMap.put("eq_sort","추가비품분류2");
//		pMap.put("e_no", 10);
//		result = eqDao.sort_add(pMap);
		
		//비품분류 수정하기
//		pMap.put("e_no", 10);
//		pMap.put("old_eq_sort", "추가비품분류2");
//		pMap.put("new_eq_sort", "변경비품분류");
//		result = eqDao.sort_upd(pMap);
		
		//비품분류 삭제하기
//		pMap.put("eq_sort", "추가비품분류");
//		result = eqDao.sort_del(pMap);
		
		//등록된 비품분류 조회하기
//		pMap.put("eq_sort", "드");
//		rlist = eqDao.sort_list(pMap);
		
		
///////////////////// 상위 코드 단위테스트 완료 [ 10/04 ] ///////////////////		
		
	/* 구매가능비품내역추가 */
		
		//비품추가신청내역에 새로운 비품내역추가 신청하기
		//[오류] Illegal mix of collations (utf8_unicode_ci,IMPLICIT) and (utf8_general_ci,IMPLICIT) for operation '='
		pMap.put("ask_eno",18);
		pMap.put("eq_sort", "가구");
		pMap.put("eq_name", "SIDIZ T30 민트색 회전의자");
		pMap.put("mk_no",3);
		eqDao.add_ask(pMap);
		
		//대기중인 비품내역추가신청 수정하기
			//취소신청
//		pMap.put("outcome", "eqa-1");
//		pMap.put("eq_sort", "소모품");
//		pMap.put("eq_name", "변경신청한 소모품이름");
//		pMap.put("eq_addno", "eqa-1");
		
		//비품추가신청내역 조회하기
		//사원조건 2가지 ( 신청사원 | 결재사원 )
		//상태조건 4가지 ( 취소|대기|기각|승인 )
		
		
		
	}
	
}
