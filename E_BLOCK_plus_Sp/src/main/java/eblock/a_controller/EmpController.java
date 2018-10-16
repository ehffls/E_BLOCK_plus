package eblock.a_controller;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import eblock.b_logic.EmpLogic;

@Controller
@RequestMapping("/emp")
public class EmpController  {
	Logger logger = Logger.getLogger(EmpController.class);
	String work = null;
	String crud = null;
	String name = null; // attribute의 name
	Object robj = null; //
	
	@Autowired
	EmpLogic empLogic = null;
	@RequestMapping("/login/check")
	public String login_check(@RequestParam Map<String,Object> pMap,HttpServletResponse res) {
		robj = empLogic.login_check(pMap, res);
		return "redirect:/emp/login/login_result.jsp";
	}
	@RequestMapping("/info/empList")
	public String info_empList(@RequestParam Map<String,Object> pMap, Model model) {
		robj = empLogic.info_empList(pMap);
		model.addAttribute("robj", robj);
		return "forward:/emp/info/empList_JSON.jsp";
	}
	@RequestMapping("/info/persList")
	public String info_persList(@RequestParam Map<String,Object> pMap
			,@CookieValue(value="c_eno",required=false) String e_no
			,Model model) {
		robj = empLogic.info_persList(pMap,e_no);
		model.addAttribute("robj", robj);
		return "forward:/emp/info/persList.jsp";
	}
	@RequestMapping("/pev/add")
	public String pev_add(@RequestParam Map<String,Object> pMap) {
		robj = empLogic.pev_add(pMap);
		 name = "aPev";
		return "forward:/emp/pev/pevTgList.jsp";
	}
	@RequestMapping("/pev/upd")
	public String pev_upd(@RequestParam Map<String,Object> pMap) {
		robj = empLogic.pev_upd(pMap);
		 name = "uPev";
		return "forward:/emp/pev/pevMyList.jsp";
	}
	@RequestMapping("/pev/myList")
	public String pev_myList(@RequestParam Map<String,Object> pMap, Model model) {
		robj = empLogic.pev_myList(pMap);
		model.addAttribute("robj", robj);
		return "forward:/emp/pev/pevMyList_JSON.jsp";
	}
	@RequestMapping("/pev/tgList")
	public String pev_tgList(@RequestParam Map<String,Object> pMap, Model model) {
		robj = empLogic.pev_tgList(pMap);
		model.addAttribute("robj", robj);
		return "forward:/emp/pev/pevTgList_JSON.jsp";
	}
	@RequestMapping("/cmt/cmt_calendar")
	public String cmt_cmt_calendar(@RequestParam Map<String,Object> pMap
					,@CookieValue(value="c_eno",required=false) String e_no
					,Model model) {
		robj = empLogic.cmt_calendar(pMap,e_no);
		model.addAttribute("robj", robj);
		return "forward:/emp/cmt/List_JSON.jsp";
	}
	@RequestMapping("/cmt/deptList")
	public String cmt_deptList(@RequestParam Map<String,Object> pMap, Model model) {
		robj = empLogic.cmt_deptList(pMap);
		model.addAttribute("robj", robj);
		return "forward:/emp/cmt/cmtDeptList_JSON.jsp";
	}
	@RequestMapping("/cntr/list")
	public String cntr_list(@RequestParam Map<String,Object> pMap) {
		robj = empLogic.cntr_list(pMap);
		 name = "cntr_list";
		return "forward:/emp/cntr/cntrModal.jsp";
	}
	@RequestMapping("/cntr/addEmp")
	public String cntr_addEmp(@RequestParam Map<String,Object> pMap,HttpServletResponse res) {
		robj = empLogic.cntr_addEmp(pMap, res); // 쿠키 생성을 위한 응답객체
		return "redirect:/emp/cntr/cntrAddResult2.jsp";
	}
	@RequestMapping("/cntr/setDeptAuth")
	public String cntr_setDeptAuth(@RequestParam Map<String,Object> pMap, Model model) {
		robj = empLogic.cntr_setDeptAuth(pMap);
		model.addAttribute("robj", robj);
		return "forward:/emp/cntr/cntrList.jsp";
		
	}
	@RequestMapping("/retire/ask")
	public String retire_ask(@RequestParam Map<String,Object> pMap
					,@CookieValue(value="c_eno",required=false) String e_no) {
		robj = empLogic.retire_ask(pMap,e_no);
		 name = "setDept";
		return "redirect:/emp/cmt/myList.jsp";
		
	}
	@RequestMapping("/retire/list")
	public String retire_list(@RequestParam Map<String,Object> pMap
				,@CookieValue(value="c_eno",required=false) String e_no
				,Model model) {
		robj = empLogic.retire_list(pMap,e_no);
		model.addAttribute("robj", robj);
		return "forward:/emp/retire/list_JSON.jsp";
		
		
		
	}
}
	
