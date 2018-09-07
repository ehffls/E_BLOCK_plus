package eblock.a_controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eblock.b_logic.EquipLogic;
import util.HashMapBinder;

public class EquipController implements Controller {
	String work = null;
	String crud = null;
	EquipLogic equipLogic = null;

	public EquipController(String work, String crud) {
		this.work = work;
		this.crud = crud;
		equipLogic = new EquipLogic(crud);
	}

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String path = null;

		Map<String,Object> pMap = new HashMap<String,Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pMap);
		
		if() {
			
		}
		else if() {
			
		}
		
		return path;
	}

}
