package eblock.d_restController;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import eblock.b_logic.EmpLogic;

@RestController
@RequestMapping("/emp")
public class EmpRestController {
	
	@Autowired
	EmpLogic empLogic = null;
	
	Map<String, Object> rMap = null;
	
	@RequestMapping("/info/empList")
	public Map<String, Object> info_empList(@RequestParam Map<String,Object> pMap) {
		rMap = empLogic.info_empList(pMap);
		return rMap;
	}
	@RequestMapping("/pev/myList")
	public Map<String, Object> pev_myList(@RequestParam Map<String,Object> pMap) {
		rMap = empLogic.pev_myList(pMap);
		return rMap;
	}
	@RequestMapping("/pev/tgList")
	public Map<String, Object> pev_tgList(@RequestParam Map<String,Object> pMap
					,@CookieValue(value="c_eno",required=false) String e_no) {
		rMap = empLogic.pev_tgList(pMap,e_no);
		return rMap;
	}
	@RequestMapping("/cmt/cmt_calendar")
	public List<Map<String, Object>> cmt_cmt_calendar(@RequestParam Map<String,Object> pMap
					,@CookieValue(value="c_eno",required=false) String e_no) {
		List<Map<String, Object>> rlist = empLogic.cmt_calendar(pMap,e_no);
		return rlist;
	}
	@RequestMapping("/cmt/deptList")
	public Map<String, Object> cmt_deptList(@RequestParam Map<String,Object> pMap) {
		rMap = empLogic.cmt_deptList(pMap);
		return rMap;
	}
	@RequestMapping("/retire/list")
	public Map<String, Object> retire_list(@RequestParam Map<String,Object> pMap
				,@CookieValue(value="c_eno",required=false) String e_no) {
		rMap = empLogic.retire_list(pMap,e_no);
		return rMap;
	}
}
