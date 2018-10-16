package eblock.a_controller;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import eblock.b_logic.AttitudeLogic;
@Controller
@RequestMapping("/attd")
public class AttitudeController{
	Logger logger = Logger.getLogger(AttitudeController.class);
	int result = 0;
	@Autowired
	AttitudeLogic attitudeLogic = null;
	@RequestMapping("/my/ask")
	public String my_ask(@RequestParam Map<String,Object> pMap
					,@CookieValue(value="c_eno",required=false) String e_no
					,@CookieValue(value="c_dno",required=false) String d_no) {
		result = attitudeLogic.my_ask(pMap,e_no,d_no);
		return "emp/cmt/myList";
//		return "redirect:/emp/cmt/myList.jsp";
	}
	@RequestMapping("/toMe/sign")
	public String toMe_sign(@RequestParam Map<String,Object> pMap
						,@CookieValue(value="c_eno",required=false) String e_no) {
		result = attitudeLogic.toMe_sign(pMap,e_no);
		return "attd/toMe/list";
//		return "redirect:/attd/toMe/list.jsp";
	}
}

