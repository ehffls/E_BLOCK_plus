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
	Object robj = null; //
	
	@Autowired
	EmpLogic empLogic = null;
	@RequestMapping("/login/check")
	public String login_check(@RequestParam Map<String,Object> pMap,HttpServletResponse res) {
		robj = empLogic.login_check(pMap, res);
		return "emp/login/login_result.jsp";
	}

	@RequestMapping("/info/persList")
	public String info_persList(@RequestParam Map<String,Object> pMap
			,@CookieValue(value="c_eno",required=false) String e_no
			,Model model) {
		robj = empLogic.info_persList(pMap,e_no);
		model.addAttribute("robj", robj);
		return "forward:/emp/info/persList";
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
	@RequestMapping("/cntr/list")
	public String cntr_list(@RequestParam Map<String,Object> pMap) {
		robj = empLogic.cntr_list(pMap);
		 name = "cntr_list";
		return "forward:/emp/cntr/cntrModal.jsp";
	}
	@RequestMapping("/cntr/addEmp")
	public String cntr_addEmp(@RequestParam Map<String,Object> pMap,HttpServletResponse res) {
		robj = empLogic.cntr_addEmp(pMap, res); // 쿠키 생성을 위한 응답객체
		return "emp/cntr/cntrAddResult2";
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
		return "emp/cmt/myList";
	}
}
	
