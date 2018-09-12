package eblock.a_controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import eblock.b_logic.AttitudeLogic;
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
		logger.info("excute È£Ãâ ¼º°ø, work:"+work+", crud:"+crud);

		Map<String,Object> pMap = new HashMap<String,Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pMap);
		
		String name = null;
		String path = null;
		Object robj = null;
		
		List<Map<String, Object>> list = null;
		int result = 0;
		
		if(work.equals("my")) {
			if(crud.equals("ask")) {
				result = attitudeLogic.my_ask(pMap);
				name ="attributeÀÇ name redirect¸é ¾È¾¸";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("askUpd")) {
				result = attitudeLogic.my_askUpd(pMap);
				name ="attributeÀÇ name redirect¸é ¾È¾¸";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("askDel")) {
				result = attitudeLogic.my_askDel(pMap);
				name ="attributeÀÇ name redirect¸é ¾È¾¸";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("list")) {
				list = attitudeLogic.my_list(pMap);
				name ="attributeÀÇ name redirect¸é ¾È¾¸";
				path="forward:xxx.jsp";
			}
		}
		else if(work.equals("toMe")) {
			if(crud.equals("sign")) {
				result = attitudeLogic.toMe_sign(pMap);
				name ="attributeÀÇ name redirect¸é ¾È¾¸";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("list")) {
				list = attitudeLogic.toMe_list(pMap);
				name ="attributeÀÇ name redirect¸é ¾È¾¸";
				path="forward:xxx.jsp";
			}
		}
		
		req.setAttribute(name, robj);

		return path;
	}

}
