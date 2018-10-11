package eblock.a_controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import eblock.b_logic.AttitudeLogic;
import util.CookieBinder;
import util.HashMapBinder;

public class AttitudeController implements Controller {
	Logger logger = Logger.getLogger(AttitudeController.class);
	String work = null;
	String crud = null;
	AttitudeLogic attitudeLogic = null;
	
	public AttitudeController(String work, String crud) {
		this.work = work;
		this.crud = crud;
		attitudeLogic = new AttitudeLogic();
	}

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		logger.info("excute 호출 성공, work:"+work+", crud:"+crud);


		Map<String,Object> pMap = new HashMap<String,Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pMap);
		CookieBinder cb = new CookieBinder(req);
		cb.bind(pMap);
		
		String name = null;
		String path = null;
		Object robj = null;
		
		List<Map<String, Object>> list = null;
		int result = 0;
		
		if(work.equals("my")) {
			if(crud.equals("ask")) {
				result = attitudeLogic.my_ask(pMap);
				path="redirect:/emp/cmt/myList.jsp";
			}
			else if(crud.equals("askUpd")) {
				result = attitudeLogic.my_askUpd(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("list")) {
				robj = attitudeLogic.my_list(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
		}
		else if(work.equals("toMe")) {
			if(crud.equals("sign")) {
				result = attitudeLogic.toMe_sign(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("list")) {
				robj = attitudeLogic.toMe_list(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
		}
		else if(work.equals("list")) {
			if(crud.equals("attdAllList")) {
				robj = attitudeLogic.list_attdAllList(pMap);
				name ="attdlist";
				path="forward:/attd/list/attdAllList_JSON.jsp";
			}
		}
		else if(work.equals("all")) {
			if(crud.equals("list")) {
				result = attitudeLogic.toMe_sign(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
		
		}
		
		if(path.contains("forward")) {
			req.setAttribute(name, robj);
		}

		return path;
	}

}
