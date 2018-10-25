package eblock.a_controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import eblock.b_logic.EquipLogic;
@Controller
@RequestMapping("/equip")
public class EquipController{
	Logger logger = Logger.getLogger(EquipController.class);
	String work = null;
	String crud = null;
	String name = null;
	Object robj = null;
	int result = 0;
	@Autowired
	EquipLogic equipLogic = null;
	@RequestMapping("/sort/add")
	public String sort_add(@RequestParam Map<String,Object> pMap
			,@CookieValue(value="c_eno",required=false) String e_no){
		result = equipLogic.sort_add(pMap,e_no);
		return "redirect:/equip/all/list.jsp";
	}
	
	@RequestMapping("/add/ask")
	public String add_ask(@RequestParam Map<String,Object> pMap
			,@CookieValue(value="c_eno",required=false) String e_no){
		result = equipLogic.add_ask(pMap,e_no);
		return "redirect:/equip/add/addAskList.jsp";
	}
	
	@RequestMapping("/add/sign")
	public String add_sign(@RequestParam Map<String,Object> pMap
			,@CookieValue(value="c_eno",required=false) String e_no){
		result = equipLogic.add_sign(pMap,e_no);
		return "redirect:/equip/add/askList.jsp";
	}
	
	@RequestMapping("/add/newArticleAsk")
	public String add_newArticleAsk(@RequestParam Map<String,Object> pMap
										,Model model){
		robj = equipLogic.newArticleAsk(pMap);
		model.addAttribute("robj", robj);
		return "forward:/equip/add/newArticleAsk.jsp";
	}
	@RequestMapping("/mk/add")
	public String mk_add(@RequestParam Map<String,Object> pMap){
		result = equipLogic.mk_add(pMap);
		return "redirect:/equip/all/list.jsp";
	}
	
	@RequestMapping("/purc/ask")
	public String purc_ask(@RequestParam Map<String,Object> pMap
			,@CookieValue(value="c_eno",required=false) String e_no){
		robj = equipLogic.purc_ask(pMap,e_no);
		return "redirect:/equip/add/addAskList2.jsp";
	}
	
	@RequestMapping("/purc/sign")
	public String purc_sign(@RequestParam Map<String,Object> pMap
			,@CookieValue(value="c_eno",required=false) String e_no){
		result = equipLogic.purc_sign(pMap,e_no);
		return "redirect:/equip/purc/askList.jsp";//페이지 새로고침하고자함
	}
	
	@RequestMapping("/push")
	public void push(@RequestParam Map<String,Object> pMap
			,@CookieValue(value="c_eno",required=false) String e_no
			,HttpServletResponse response){
		result = equipLogic.push(pMap,e_no);
		
		PrintWriter writer = null;
		try {
			response.setContentType("text/event-stream");
			// cache must be set to no-cache
			response.setHeader("Cache-Control", "no-cache");
			// encoding is set to UTF-8
			response.setCharacterEncoding("UTF-8");

			writer = response.getWriter();

			//System.out.println(sign_count);
			writer.write("data: " + result + "\n\n");
			writer.write("retry: 5000\n");
			writer.flush();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} 
		writer.close();
		
		//return "redirect:/front/push.jsp?sign_count="+result;//페이지 새로고침하고자함
	}
	
	
}


	