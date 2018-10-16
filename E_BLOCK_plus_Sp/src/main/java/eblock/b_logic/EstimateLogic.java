package eblock.b_logic;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eblock.c_dao.EmpDao;
import eblock.c_dao.EstimateDao;

@Service
public class EstimateLogic {
	private static final Logger logger = LoggerFactory.getLogger(EstimateLogic.class);
	
	@Autowired
	EstimateDao estimateDao = null;
	
	@Autowired
	EmpDao empDao = null;

	public List<Map<String, Object>> test(Map<String, Object> pMap) {
		List<Map<String,Object>> rlist = estimateDao.getTest(pMap);
		
		pMap.put("e_no", 1);
		List<Map<String,Object>> rlist2 = empDao.info_persList(pMap);

		System.out.println(rlist);
		System.out.println(rlist2);
		
		return null;
	}
}
