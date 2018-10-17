package eblock.a_controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import eblock.b_logic.EstimateLogic;

@RequestMapping("/esti")
@Controller
public class EstimateController {
	private static final Logger logger = LoggerFactory.getLogger(EstimateController.class);

	int result = 0;
	String msg = null;
	
	@Autowired
	EstimateLogic estimateLogic = null;
	
	//이건 테스트
	@RequestMapping("/test")
	public String test(@RequestParam Map<String,Object> pMap) {
		List<Map<String,Object>> rlist = estimateLogic.test(pMap);
		
		return "";
	}
	
	//신규신청 & 수정
	@RequestMapping("/catalog/insupd")
	public String esti_insupd (@RequestParam Map<String,Object> pMap
							   ,@CookieValue(value="c_eno",required=false) String e_no
							   ,@CookieValue(value="c_dno",required=false) String d_no
							   ,@CookieValue(value="c_erank",required=false) String e_rank)
	{
		try {
			URLDecoder.decode(e_rank, "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		result = estimateLogic.esti_insupd(pMap, e_no, d_no, e_rank);
		logger.info("result : "+result);
		return "redirect:/esti/list/esti_fromMe.jsp";
	}
	
	//결제
	@RequestMapping("/list/sign")
	public String esti_sign (@RequestParam Map<String,Object> pMap
							,@CookieValue(value="c_eno",required=false) String e_no)
	{	
		msg = estimateLogic.esti_sign(pMap,e_no);
		logger.info("msg : "+msg);

		return "redirect:/esti/list/esti_toMe.jsp";
	}
	
	//카탈로그 가격 일괄 수정
	//결제
	@RequestMapping("/catalog/price")
	public String catalog_price (@RequestParam Map<String,Object> pMap)
	{	
		estimateLogic.catalog_price(pMap);
		
		return "redirect:/esti/catalog/esti_list.jsp";
	}
	
}
