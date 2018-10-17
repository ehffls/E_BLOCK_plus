package eblock.c_dao;

import java.util.List;
import java.util.Map;

public interface EstimateDao {
	public List<Map<String,Object>> getTest(Map<String,Object> pMap);

	public int esti_insupd(Map<String, Object> pMap);
	
	public int esti_sign(Map<String,Object> pMap);

	public List<Map<String, Object>> esti_catalog(Map<String, Object> pMap);

	public List<Map<String, Object>> esti_list(Map<String, Object> pMap);

	public List<Map<String, Object>> esti_result(Map<String, Object> pMap);
	
	public int catalog_price(Map<String, Object> pMap);
}
