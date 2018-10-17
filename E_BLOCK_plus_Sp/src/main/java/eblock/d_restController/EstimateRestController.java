package eblock.d_restController;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import eblock.b_logic.EstimateLogic;

@RestController
@RequestMapping("/esti")
public class EstimateRestController {
	Logger logger = Logger.getLogger(EstimateRestController.class);

	@Autowired
	EstimateLogic estimateLogic = null;
	Map<String,Object> rMap = null;

	//카탈로그 전체 조회
	@RequestMapping("/catalog/list")
	public Map<String, Object> esti_catalog (@RequestParam Map<String,Object> pMap)

	{	
		rMap = estimateLogic.esti_catalog(pMap);
		
		return rMap;
	}

	//결제 신청 조회
	@RequestMapping("/list/list/{path}")
	public Map<String, Object> esti_list (@RequestParam Map<String,Object> pMap
			,@CookieValue(value="c_eno",required=false) String e_no
			,@PathVariable String path)

	{	
		logger.info(path);
		rMap = estimateLogic.esti_list(pMap, e_no, path);
		
		return rMap;
	}

	//결제 완료 조회
	@RequestMapping("/list/result")
	public Map<String, Object> esti_result (@RequestParam Map<String,Object> pMap
			,@CookieValue(value="c_eno",required=false) String e_no)

	{	
		pMap.put("peno", e_no);
		rMap = estimateLogic.esti_result(pMap);
		
		return rMap;
	}

}
