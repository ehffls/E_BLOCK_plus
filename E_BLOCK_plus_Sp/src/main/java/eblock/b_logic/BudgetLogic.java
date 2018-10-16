package eblock.b_logic;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import eblock.c_dao.BudgetDao;

public class BudgetLogic {
	@Autowired
	private BudgetDao budgetDao = null;
	
	

	
	int result = 0;
	List<Map<String, Object>> list = null;
	
	public int ex_deptEx(Map<String, Object> pMap) {
		result = budgetDao.ex_deptEx(pMap);
		return result;
	}

	public int ex_deptUpd(Map<String, Object> pMap) {
		result = budgetDao.ex_deptUpd(pMap);
		return result;
	}

	public int ex_deptDel(Map<String, Object> pMap) {
		result = budgetDao.ex_deptDel(pMap);
		return result;
	}

	public List<Map<String, Object>> ex_deptList(Map<String, Object> pMap) {
		list = budgetDao.ex_deptList(pMap);
		return list;
	}

	public int ex_okEx(Map<String, Object> pMap) {
		result = budgetDao.ex_okEx(pMap);
		return result;
	}

	public int ex_okDel(Map<String, Object> pMap) {
		result = budgetDao.ex_okDel(pMap);
		return result;
	}

	public List<Map<String, Object>> ex_okList(Map<String, Object> pMap) {
		list = budgetDao.ex_okList(pMap);
		return list;
	}

	public int pay_ex(Map<String, Object> pMap) {
		result = budgetDao.pay_ex(pMap);
		return result;
	}

	public List<Map<String, Object>> pay_list(Map<String, Object> pMap) {
		list = budgetDao.pay_list(pMap);
		return list;
	}


}
