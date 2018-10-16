package eblock.d_restController;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import eblock.b_logic.AttitudeLogic;

@RestController
@RequestMapping("/attd")
public class AttitudeRestController {
	@Autowired
	AttitudeLogic attitudeLogic = null;
	
	Map<String, Object> rMap = null;
	
	@RequestMapping("/toMe/list")
	public Map<String, Object> toMe_list(@RequestParam Map<String,Object> pMap
						,@CookieValue(value="c_eno",required=false) String e_no) {
		rMap = attitudeLogic.toMe_list(pMap,e_no);
		return rMap;
//		model.addAttribute("robj", robj);
//		return "forward:/attd/toMe/list_JSON.jsp";
	}
	@RequestMapping("/list/attdAllList")
	public Map<String, Object> list_attdAllList(@RequestParam Map<String,Object> pMap) {
		rMap = attitudeLogic.list_attdAllList(pMap);
		return rMap;
//		model.addAttribute("robj", robj);
//		return "forward:/attd/list/attdAllList_JSON.jsp";
	}
}
