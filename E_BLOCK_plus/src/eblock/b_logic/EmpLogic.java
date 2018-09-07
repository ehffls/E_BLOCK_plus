package eblock.b_logic;

import eblock.c_dao.EmpDao;

public class EmpLogic {
	EmpDao empDao = null;
	
	public EmpLogic() {
		empDao = new EmpDao();
	}
}
