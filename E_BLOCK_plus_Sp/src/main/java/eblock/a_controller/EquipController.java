package eblock.a_controller;

import java.util.Map;

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
	@RequestMapping("/sort/list")
	public String sort_list(@RequestParam Map<String,Object> pMap,Model model){
		robj = equipLogic.sort_list(pMap);
		model.addAttribute("robj", robj);
		return "forward:/equip/all/list_JSON.jsp";
		
	}
	@RequestMapping("/add/ask")
	public String add_ask(@RequestParam Map<String,Object> pMap
			,@CookieValue(value="c_eno",required=false) String e_no){
		result = equipLogic.add_ask(pMap,e_no);
		return "redirect:/equip/add/addAskList.jsp";
	}
	@RequestMapping("/add/askList")
	public String add_askList(@RequestParam Map<String,Object> pMap
			,@CookieValue(value="c_eno",required=false) String e_no
			,Model model){
	robj = equipLogic.add_askList(pMap,e_no);
	model.addAttribute("robj", robj);
	return "forward:/equip/add/askList_JSON.jsp";
	
	}
	@RequestMapping("/add/sign")
	public String add_sign(@RequestParam Map<String,Object> pMap
			,@CookieValue(value="c_eno",required=false) String e_no){
		result = equipLogic.add_sign(pMap,e_no);
		return "redirect:/equip/add/askList.jsp";
	}
	@RequestMapping("/add/equipList")
	public String add_equipList(@RequestParam Map<String,Object> pMap
							,Model model){
	    robj = equipLogic.add_equipList(pMap);
		model.addAttribute("robj", robj);
		return "forward:/equip/add/addAskList_JSON3.jsp";
	}
	@RequestMapping("/add/newArticleAsk")
	public String add_newArticleAsk(@RequestParam Map<String,Object> pMap
										,Model model){
		robj = equipLogic.newArticleAsk(pMap);
		model.addAttribute("robj", robj);
		return"forward:/equip/add/newArticleAsk.jsp";
	}
	@RequestMapping("/mk/add")
	public String mk_add(@RequestParam Map<String,Object> pMap){
		result = equipLogic.mk_add(pMap);
		return"redirect:/equip/all/list.jsp";
	}
	@RequestMapping("/mk/list")
	public String mk_list(@RequestParam Map<String,Object> pMap, Model model){
		robj = equipLogic.mk_list(pMap);
		model.addAttribute("robj", robj);
		return"forward:/equip/mk/list_JSON.jsp";
	}
	@RequestMapping("/purc/ask")
	public String purc_ask(@RequestParam Map<String,Object> pMap
			,@CookieValue(value="c_eno",required=false) String e_no){
		robj = equipLogic.purc_ask(pMap,e_no);
		return"redirect:/equip/add/addAskList2.jsp";
	}
	@RequestMapping("/purc/askList")
	public String purc_askList(@RequestParam Map<String,Object> pMap
			,@CookieValue(value="c_eno",required=false) String e_no){
		robj = equipLogic.purc_askList(pMap,e_no);
		name ="rList";
		return"forward:/equip/purc/askList_JSON.jsp";
	}
	@RequestMapping("/purc/sign")
	public String purc_sign(@RequestParam Map<String,Object> pMap
			,@CookieValue(value="c_eno",required=false) String e_no){
		result = equipLogic.purc_sign(pMap,e_no);
		return"redirect:/equip/purc/askList.jsp";//페이지 새로고침하고자함
	}
	@RequestMapping("/inb/eqList")
	public String inb_eqList(@RequestParam Map<String,Object> pMap, Model model){
		robj = equipLogic.inb_eqList(pMap);
		model.addAttribute("robj", robj);
		return"forward:/equip/add/addAskList_JSON2.jsp";
	}
	@RequestMapping("/inb/eqListState")
	public String inb_eqListState(@RequestParam Map<String,Object> pMap, Model model){
		robj = equipLogic.inb_eqList(pMap);
		model.addAttribute("robj", robj);
		return"forward:/equip/inb/askList_JSON.jsp";
	}
	@RequestMapping("/inb/askList")
	public String inb_askList(@RequestParam Map<String,Object> pMap, Model model){
		robj = equipLogic.inb_askList(pMap);
		model.addAttribute("robj", robj);
		return"forward:/equip/inb/askList_JSON.jsp";
	}
	@RequestMapping("/inb/changeList")
	public String inb_changeList(@RequestParam Map<String,Object> pMap, Model model){
		robj = equipLogic.inb_changeList(pMap);
		model.addAttribute("robj", robj);
		return"forward:/equip/inb/changeList_JSON.jsp";
	}
	@RequestMapping("/all/list")
	public String all_list(@RequestParam Map<String,Object> pMap, Model model) {
		robj = equipLogic.mk_allList(pMap);
		model.addAttribute("robj", robj);
		return"forward:/equip/all/list_JSON.jsp";
	}
	
}


	