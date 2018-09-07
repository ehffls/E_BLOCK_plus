package eblock.a_controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eblock.b_logic.CommuteLogic;
import util.HashMapBinder;

public class CommuteController implements Controller {
	String work = null;
	String crud = null;
	CommuteLogic commuteLogic = null;
	
	public CommuteController(String work, String crud) {
		this.work = work;
		this.crud = crud;
		commuteLogic = new CommuteLogic();
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
