package eblock.b_logic;

import eblock.c_dao.EquipDao;

public class EquipLogic {
	EquipDao equipDao = null;
	public EquipLogic(String crud) {
		equipDao = new EquipDao();
	}

}
