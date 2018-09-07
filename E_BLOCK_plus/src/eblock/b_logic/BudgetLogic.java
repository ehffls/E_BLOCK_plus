package eblock.b_logic;

import java.util.List;
import java.util.Map;

import eblock.c_dao.BudgetDao;

public class BudgetLogic {
	BudgetDao budgetDao = null;
	
	public BudgetLogic() {
		 budgetDao = new BudgetDao();
	}

	public List<Map<String, Object>> 나의정보_crud(Map<String, Object> pMap) {
		return null;
	}

	public int 출석_crud(Map<String, Object> pMap) {
		return 0;
	}
}
