package eblock.a_controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import eblock.b_logic.EstimateLogic;

@RequestMapping("/Esti")
@Controller
public class EstimateController {
	private static final Logger logger = LoggerFactory.getLogger(EstimateController.class);
	
	@Autowired
	EstimateLogic estimateLogic = null;
	
	@RequestMapping("/test")
	public String test(@RequestParam Map<String,Object> pMap) {
		List<Map<String,Object>> rlist = estimateLogic.test(pMap);
		
		return "";
	}

}
