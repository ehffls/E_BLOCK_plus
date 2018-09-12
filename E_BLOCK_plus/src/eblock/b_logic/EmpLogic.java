package eblock.b_logic;

import java.util.List;
import java.util.Map;

import eblock.c_dao.EmpDao;

public class EmpLogic {
	EmpDao empDao = null;
	
	public EmpLogic() {
		empDao = new EmpDao();
	}
	
	
	int result = 0;
	List<Map<String, Object>> list = null;
	
	public List<Map<String, Object>> login_check(Map<String, Object> pMap) {
		list = empDao.login_check(pMap);
		return list;
	}

	public List<Map<String, Object>> info_empList(Map<String, Object> pMap) {
		list = empDao.info_empList(pMap);
		return list;
	}

	public List<Map<String, Object>> info_persList(Map<String, Object> pMap) {
		list = empDao.info_persList(pMap);
		return list;
	}

	public int info_persUpd(Map<String, Object> pMap) {
		result = empDao.info_persUpd(pMap);
		return result;
	}

	public int pev_add(Map<String, Object> pMap) {
		result = empDao.pev_add(pMap);
		return result;
	}

	public int pev_upd(Map<String, Object> pMap) {
		result = empDao.pev_upd(pMap);
		return result;
	}

	public List<Map<String, Object>> pev_myList(Map<String, Object> pMap) {
		list = empDao.pev_myList(pMap);
		return list;
	}

	public int cmt_checkIn(Map<String, Object> pMap) {
		result = empDao.cmt_checkIn(pMap);
		return result;
	}

	public List<Map<String, Object>> cmt_myList(Map<String, Object> pMap) {
		list = empDao.cmt_myList(pMap);
		return list;
	}

	public int cntr_addEmp(Map<String, Object> pMap) {
		result = empDao.cntr_addEmp(pMap);
		return result;
	}

	public int cntr_setDept(Map<String, Object> pMap) {
		result = empDao.cntr_setDept(pMap);
		return result;
	}

	public int retire_ask(Map<String, Object> pMap) {
		result = empDao.retire_ask(pMap);
		return result;
	}

	public Object retire_list(Map<String, Object> pMap) {
		list = empDao.retire_list(pMap);
		return result;
	}
	
	public int retire_sign(Map<String, Object> pMap) {
		result = empDao.retire_sign(pMap);
		return result;
	}


}
