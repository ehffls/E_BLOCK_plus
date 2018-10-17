package eblock.d_restController;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import eblock.b_logic.EquipLogic;
@RestController
@RequestMapping("/equip")
public class EquipRestController{
	Logger logger = Logger.getLogger(EquipRestController.class);
	@Autowired
	EquipLogic equipLogic = null;
	
	Map<String,Object> rMap = null;
	@RequestMapping("/sort/list")
	public Map<String,Object> sort_list(@RequestParam Map<String,Object> pMap){
		rMap = equipLogic.sort_list(pMap);
		return rMap;
		
	}
	@RequestMapping("/add/askList")
	public Map<String,Object> add_askList(@RequestParam Map<String,Object> pMap
			,@CookieValue(value="c_eno",required=false) String e_no
			){
	rMap = equipLogic.add_askList(pMap,e_no);
	return rMap;
	
	}
	@RequestMapping("/add/equipList")
	public Map<String,Object> add_equipList(@RequestParam Map<String,Object> pMap){
	    rMap = equipLogic.add_equipList(pMap);
		return rMap;
	}
	@RequestMapping("/mk/list")
	public Map<String,Object> mk_list(@RequestParam Map<String,Object> pMap){
		rMap = equipLogic.mk_list(pMap);
		return rMap;
	}
	@RequestMapping("/purc/askList")
	public Map<String,Object> purc_askList(@RequestParam Map<String,Object> pMap
			,@CookieValue(value="c_eno",required=false) String e_no){
		rMap = equipLogic.purc_askList(pMap,e_no);
		return rMap;
	}
	@RequestMapping("/inb/eqList")
	public Map<String,Object> inb_eqList(@RequestParam Map<String,Object> pMap){
		rMap = equipLogic.inb_eqList(pMap);
		return rMap;
	}
	@RequestMapping("/inb/eqListState")
	public Map<String,Object> inb_eqListState(@RequestParam Map<String,Object> pMap){
		rMap = equipLogic.inb_eqList(pMap);
		return rMap;
	}
	@RequestMapping("/inb/askList")
	public Map<String,Object> inb_askList(@RequestParam Map<String,Object> pMap){
		rMap = equipLogic.inb_askList(pMap);
		return rMap;
	}
	@RequestMapping("/inb/changeList")
	public Map<String,Object> inb_changeList(@RequestParam Map<String,Object> pMap){
		rMap = equipLogic.inb_changeList(pMap);
		return rMap;
	}
	@RequestMapping("/all/list")
	public Map<String,Object> all_list(@RequestParam Map<String,Object> pMap) {
		rMap = equipLogic.mk_allList(pMap);
		return rMap;
	}
	
}


	