package eblock.b_logic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import eblock.c_dao.EquipDao;

public class EquipLogic {
	Logger logger = Logger.getLogger(EquipLogic.class);	
	EquipDao equipDao = null;
	
	public EquipLogic(String crud) {
		equipDao = new EquipDao();
	}
	
	
	int result = 0;
	List<Map<String, Object>> list = null;

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	/* 비품분류관리 */
	
	//결재권 조회하기
	public List<Map<String, Object>> emp_authList(Map<String, Object> pMap) {
		list = equipDao.emp_authList(pMap);
		return list;
	}
	//결재권자 조회하기
	public List<Map<String, Object>> emp_authorList(Map<String, Object> pMap) {
		list = equipDao.emp_authorList(pMap);
		return list;
	}
	//[결재권자]
	//비품분류 등록하기
	public int sort_add(Map<String, Object> pMap) {
		pMap.put("e_no", pMap.get("c_eno"));
		result = equipDao.sort_add(pMap);
		return result;
	}
	//[결재권자]
	//등록된 비품분류 수정하기 
	public int sort_upd(Map<String, Object> pMap) {
		result = equipDao.sort_upd(pMap);
		return result;
	}
	//[결재권자]
	//등록된 비품분류 삭제하기 
	public int sort_del(Map<String, Object> pMap) {
		result = equipDao.sort_del(pMap);
		return result;
	}
	//등록된 비품분류 조회하기 
	public List<Map<String, Object>> sort_list(Map<String, Object> pMap) {
		list = equipDao.sort_list(pMap);
		return list;
	}
	
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	/* 구매가능비품내역추가 */
	
	//비품추가신청내역에 새로운 비품내역추가 신청하기 
	public int add_ask(Map<String, Object> pMap) {
		pMap.put("ask_eno", pMap.get("c_eno"));
		result = equipDao.add_ask(pMap);
		return result;
	}
	//대기중인 비품내역추가신청 수정하기
	public int add_askUpd(Map<String, Object> pMap) {
		result = equipDao.add_askUpd(pMap);
		return result;
	}
	//비품추가신청내역 조회하기
	public List<Map<String, Object>> add_askList(Map<String, Object> pMap) {
		pMap.put("sign_eno", pMap.get("c_eno"));//결재자번호 10.. 쿠키에서 얻어야함.
		list = equipDao.add_askList(pMap);
		return list;
	}
	//[결재권자]
	//비품추가신청내역에 새로운비품내역 추가신청 결재하기
	public int add_sign(Map<String, Object> pMap) {
		logger.info("pMap.get(\"param\") : "+pMap.get("param"));
		//넘어온 파람을 분할한다.
		String[] words = pMap.get("param").toString().split(",");
		//넘어온걸 반복문을 위해 리스트로 작성한다.
		List<Map<String,Object>> newList = new ArrayList<>();
		Map<String,Object> newMap = null;
		for(int i=1;i<words.length;i++) {
			newMap = new HashMap<>();
			newMap.put("outcome",words[0]);//상태값
			newMap.put("eq_addno",words[i]);
			newMap.put("e_no", pMap.get("c_eno"));//결재자번호 10.. 쿠키에서 얻어온 값
			newList.add(newMap);
		}
		logger.info("newList : "+newList);
		//작성한 리스트를 넘김
		result = equipDao.add_sign(newList);
		logger.info("result : "+result);
		return result;
	}
	//[결재권자]
	//(신청가능)비품테이블에서 비품 조회하기
	public List<Map<String, Object>> add_equipList(Map<String, Object> pMap) {
		list = equipDao.add_equipList(pMap);
		return list;
	}
	//[결재권자]
	//(신청가능)비품테이블에 비품가격 수정하기
	public int add_equipCost(Map<String, Object> pMap) {
		result = equipDao.add_equipCost(pMap);
		return result;
	}
	
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	/* 거래처관리 */
	
	//[결재권자]
	//거래처 등록하기 
	public int mk_add(Map<String, Object> pMap) {
		logger.info(pMap);
		result = equipDao.mk_add(pMap);
		return result;
	}
	//[결재권자]
	//등록된 거래처 수정하기  
	public int mk_upd(Map<String, Object> pMap) {
		result = equipDao.mk_upd(pMap);
		return result;
	}
	//등록된 거래처 조회하기  
	public List<Map<String, Object>> mk_list(Map<String, Object> pMap) {
		list = equipDao.mk_list(pMap);
		return list;
	}
	//거래처|비품종류 거래처 조회하기
	public List<Map<String, Object>> mk_allList(Map<String, Object> pMap) {
		list = equipDao.mk_allList(pMap);
		return list;
	}
	
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

	/* 비품구매 */
	
	//구매가능내역에서 비품구매 신청하기
	public List<Map<String, Object>> purc_ask(Map<String, Object> pMap) {
		pMap.put("ask_eno", pMap.get("c_eno"));
		list = equipDao.purc_ask(pMap);
		return list;
	}
	//구매가능내역에서 비품구매 신청 수정하기 (취소포함)
	public int purc_askUpd(Map<String, Object> pMap) {
		result = equipDao.purc_askUpd(pMap);
		return result;
	}
	//비품구매신청내역 조회하기
	public List<Map<String,Object>> purc_askList(Map<String, Object> pMap) {
		pMap.put("sign_eno", pMap.get("c_eno"));
		list = equipDao.purc_askList(pMap);
		return list;
	}
	//[결재권자]
	//비품구매신청내역 결재하기
	public int purc_sign(Map<String, Object> pMap) {
		logger.info("pMap.get(\"param\") : "+pMap.get("param"));
		//넘어온 파람을 분할한다.
		String[] words = pMap.get("param").toString().split(",");
		//넘어온걸 반복문을 위해 리스트로 작성한다.
		List<Map<String,Object>> newList = new ArrayList<>();
		Map<String,Object> newMap = null;
		for(int i=1;i<words.length;i++) {
			newMap = new HashMap<>();
			newMap.put("outcome",words[0]);//상태값
			newMap.put("eq_pno",words[i]);
			newMap.put("sign_eno", pMap.get("c_eno"));//결재자번호.. 쿠키에서 얻어야함.
			newList.add(newMap);
		}
		logger.info("newList : "+newList);
		//작성한 리스트를 넘김
		result = equipDao.purc_sign(newList);
		logger.info("result : "+result);
		return result;
	}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	/* 비품입고처리 및 입고비품관리 */
	
	//입고비품내역에서 입출가능한 비품 조회하기
	public List<Map<String, Object>> inb_eqList(Map<String, Object> pMap) {
		list = equipDao.inb_eqList(pMap);
		return list;
	}
	//비품입출신청내역에 비품입출 신청하기
	public int inb_ask(Map<String, Object> pMap) {
		result = equipDao.inb_ask(pMap);
		return result;
	}
	//비품입출신청내역에서 신청 수정하기(취소포함)
	public int inb_askUpd(Map<String, Object> pMap) {
		result = equipDao.inb_askUpd(pMap);
		return result;
	}
	//[결재권자]
	//입고비품내역에서 입출비품내역 조회하기
	public List<Map<String, Object>> inb_askList(Map<String, Object> pMap) {
		list = equipDao.inb_askList(pMap);
		return list;
	}
	//[결재권자]
	//입고비품내역에서 입출비품내역 조회하기
	public List<Map<String, Object>> inb_changeList(Map<String, Object> pMap) {
		list = equipDao.inb_changeList(pMap);
		return list;
	}
	//[결재권자]
	//비품입출신청내역의 신청 결재하기 (기각|승인)
	public int inb_sign(Map<String, Object> pMap) {
		result = equipDao.inb_sign(pMap);
		return result;
	}
	//[결재권자]
	//입고비품상태관리 프로시저로 처리하기 (수리반출|반입완료|폐기)
	public int inb_change(Map<String, Object> pMap) {
		result = equipDao.inb_change(pMap);
		return result;
	}
	
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	/* 조회 */
	
	//내가 신청한 결재내역 조회하기 (비품구매 | 비품반출 2종)
	public List<Map<String, Object>> ask_list(Map<String, Object> pMap) {
		list = equipDao.ask_list(pMap);
		return list;
	}
	//내가 신청받은 결재요청 조회하기 (조건: 대기|승인|기각)
	public List<Map<String, Object>> sign_list(Map<String, Object> pMap) {
		list = equipDao.sign_list(pMap);
		return list;
	}
	//추가 비품 신청 드롭다운(보현)
	public Map<String, Object> newArticleAsk(Map<String, Object> pMap) {
		Map<String,Object> rMap = new HashMap<String,Object>();
		List<Map<String,Object>> list2 = equipDao.mk_list(pMap);
		List<Map<String,Object>> list3 = equipDao.sort_list(pMap);
		rMap.put("mk_list",list2);
		rMap.put("sort_list",list3);
		
		return rMap;
	}


}
