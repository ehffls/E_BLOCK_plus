package eblock.b_logic;

import java.util.List;
import java.util.Map;

import eblock.c_dao.AttitudeDao;

public class AttitudeLogic {
	AttitudeDao attitudeDao = null;
	
	public AttitudeLogic() {
		 attitudeDao = new AttitudeDao();
	}

	
	int result = 0;
	List<Map<String, Object>> list = null;
	
	public int my_ask(Map<String, Object> pMap) {
		result = attitudeDao.my_ask(pMap);
		return result;
	}

	public int my_askUpd(Map<String, Object> pMap) {
		result = attitudeDao.my_askUpd(pMap);
		return result;
	}

	public List<Map<String, Object>> my_list(Map<String, Object> pMap) {
		list = attitudeDao.my_list(pMap);
		return list;
	}

	public int toMe_sign(Map<String, Object> pMap) {
		result = attitudeDao.toMe_sign(pMap);
		return result;
	}

	public List<Map<String, Object>> toMe_list(Map<String, Object> pMap) {
		list = attitudeDao.toMe_list(pMap);
		return list;
	}
}
