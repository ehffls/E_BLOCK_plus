package eblock.b_logic;

import java.util.HashMap;
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
	
	int result = 0;
	String msg = null;
	List<Map<String, Object>> list = null;
	Map<String, Object> rMap;
	
	public List<Map<String, Object>> test(Map<String, Object> pMap) {
		pMap.put("e_no", 1);
		List<Map<String,Object>> rlist2 = empDao.info_persList(pMap);
				
		List<Map<String,Object>> rlist = estimateDao.getTest(pMap);
		
		System.out.println(rlist2);
		System.out.println(rlist);
		
		return null;
	}

	public int esti_insupd(Map<String, Object> pMap, String e_no, String d_no, String e_rank) {
		/*		pMap.put("pe_no", 46);
		pMap.put("pesti_ano", 6);
		pMap.put("pec_no", 5);
		pMap.put("pesti_email", "5555@gmail.com");
		pMap.put("p_note", "신청");
		pMap.put("psign_eno1", 27);
		pMap.put("psign_eno2", 8);
		pMap.put("psign_eno3", 1);
		pMap.put("pe_rank", 20);
		pMap.put("pask_eno", 46);*/
		pMap.put("e_no", Integer.parseInt(e_no));
		pMap.put("pask_eno", Integer.parseInt(e_no));
		pMap.put("d_no", Integer.parseInt(d_no));
		pMap.put("e_rank", e_rank);
		int pesti_ano = 0;
		if(pMap.get("pesti_ano")!=null) {
			pesti_ano = Integer.parseInt(pMap.get("pesti_ano").toString());
		}
		else{
			pMap.put("pesti_ano", 0);	
		}
			
		
		logger.info("pMap: "+pMap.get("e_no"));
		Map<String, Object> rMap = empDao.esti_sign_no(pMap);
		pMap.put("psign_eno1", rMap.get("sign_eno1"));
		pMap.put("psign_eno2", rMap.get("sign_eno2"));
		pMap.put("psign_eno3", rMap.get("sign_eno3"));
		
		estimateDao.esti_insupd(pMap);
		logger.info(String.valueOf("-------------:"+pMap));
		result = (Integer)pMap.get("result");
		logger.info(String.valueOf(result));
		return result;
	}
	
	public String esti_sign(Map<String,Object> pMap, String e_no) {
		
/*		pMap.put("esti_pano", 5);
		pMap.put("sign_peno", 27);
		pMap.put("poutcome", "a");
		pMap.put("sign_prsn", "a");
		pMap.put("pcontent", "완료");*/
		pMap.put("sign_peno", e_no);
		logger.info("pMap: "+pMap.get("e_no"));  
		estimateDao.esti_sign(pMap);
	    msg = pMap.get("msg").toString();
	    return msg;
	   }

	public Map<String, Object> esti_catalog(Map<String, Object> pMap) {
		list = estimateDao.esti_catalog(pMap);
		logger.info("catalog_cur : "+pMap.get("catalog_cur"));
		
		rMap = new HashMap<String, Object>();
		rMap.put("data", pMap.get("catalog_cur"));
		
		return rMap;
	}

	public Map<String, Object> esti_list(Map<String, Object> pMap, String e_no, String path) {
		//pMap.put("peno", 1);
		//pMap.put("ask_sign", 1);
		pMap.put("peno", e_no);
		
		if(path.equals("phase0")) {
			pMap.put("level", 0);
			pMap.put("ask_sign", 0);
		}
		else if(path.equals("phase1")) {
			pMap.put("level", 1);
			pMap.put("ask_sign", 0);
		}
		else if(path.equals("phase2")) {
			pMap.put("level", 2);
			pMap.put("ask_sign", 0);
		}
		else if(path.equals("submit")) {
			pMap.put("level", -1);
			pMap.put("ask_sign", 1);
		}
		
		list = estimateDao.esti_list(pMap);
		logger.info("esti_cur : "+pMap.get("esti_cur"));
		
		rMap = new HashMap<String, Object>();
		rMap.put("data", pMap.get("esti_cur"));
		
		return rMap;
	}

	public  Map<String, Object> esti_result(Map<String, Object> pMap) {
		//pMap.put("peno", 46);
		//pMap.put("ask_sign", 0);
		pMap.put("ask_sign", 0);
		list = estimateDao.esti_result(pMap);
		logger.info("esti_cur : "+pMap.get("esti_cur"));
		
		rMap = new HashMap<String, Object>();
		rMap.put("data", pMap.get("esti_cur"));
		
		return rMap;
	}
	
	public String catalog_price(Map<String, Object> pMap) {
		logger.info(pMap.toString());
		
		estimateDao.catalog_price(pMap);
		
		msg = pMap.get("result").toString();
		logger.info("msg:"+msg);
				
		return msg;
	}
}
