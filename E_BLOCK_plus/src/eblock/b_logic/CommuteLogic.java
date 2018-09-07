package eblock.b_logic;

import eblock.c_dao.CommuteDao;

public class CommuteLogic {
	CommuteDao commuteDao = null;
	
	public CommuteLogic() {
		 commuteDao = new CommuteDao();
	}
}
