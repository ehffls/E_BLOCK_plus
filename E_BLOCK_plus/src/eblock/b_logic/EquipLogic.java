package eblock.b_logic;

import java.util.List;
import java.util.Map;

import eblock.c_dao.EquipDao;

public class EquipLogic {
	EquipDao equipDao = null;
	
	public EquipLogic(String crud) {
		equipDao = new EquipDao();
	}
	
	
	int result = 0;
	List<Map<String, Object>> list = null;

	public List<Map<String, Object>> add_ask(Map<String, Object> pMap) {
		list = equipDao.add_ask(pMap);
		return list;
	}

	public int add_askUpd(Map<String, Object> pMap) {
		result = equipDao.add_askUpd(pMap);
		return result;
	}

	public int add_askDel(Map<String, Object> pMap) {
		result = equipDao.add_askDel(pMap);
		return result;
	}

	public int add_sign(Map<String, Object> pMap) {
		result = equipDao.add_sign(pMap);
		return result;
	}

	public List<Map<String, Object>> purc_ask(Map<String, Object> pMap) {
		list = equipDao.purc_ask(pMap);
		return list;
	}

	public int purc_askUpd(Map<String, Object> pMap) {
		result = equipDao.purc_askUpd(pMap);
		return result;
	}

	public int purc_askDel(Map<String, Object> pMap) {
		result = equipDao.purc_askDel(pMap);
		return result;
	}

	public int purc_sign(Map<String, Object> pMap) {
		result = equipDao.purc_sign(pMap);
		return result;
	}

	public int inb_add(Map<String, Object> pMap) {
		result = equipDao.inb_add(pMap);
		return result;
	}

	public int inb_ask(Map<String, Object> pMap) {
		result = equipDao.inb_ask(pMap);
		return result;
	}

	public int inb_askUpd(Map<String, Object> pMap) {
		result = equipDao.inb_askUpd(pMap);
		return result;
	}

	public int inb_askDel(Map<String, Object> pMap) {
		result = equipDao.inb_askDel(pMap);
		return result;
	}

	public int inb_sign(Map<String, Object> pMap) {
		result = equipDao.inb_sign(pMap);
		return result;
	}

	public List<Map<String, Object>> inb_list(Map<String, Object> pMap) {
		list = equipDao.inb_list(pMap);
		return list;
	}

	public List<Map<String, Object>> ask_list(Map<String, Object> pMap) {
		list = equipDao.ask_list(pMap);
		return list;
	}

	public List<Map<String, Object>> sign_list(Map<String, Object> pMap) {
		list = equipDao.sign_list(pMap);
		return list;
	}

	public int mk_add(Map<String, Object> pMap) {
		result = equipDao.mk_add(pMap);
		return result;
	}

	public int mk_upd(Map<String, Object> pMap) {
		result = equipDao.mk_upd(pMap);
		return result;
	}

	public int mk_del(Map<String, Object> pMap) {
		result = equipDao.mk_del(pMap);
		return result;
	}

	public List<Map<String, Object>> mk_list(Map<String, Object> pMap) {
		list = equipDao.mk_list(pMap);
		return list;
	}
	
}
