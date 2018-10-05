package eblock.a_controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import eblock.b_logic.EquipLogic;
import util.HashMapBinder;

public class EquipController implements Controller {
	Logger logger = Logger.getLogger(EquipController.class);
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
		logger.info("excute 호출 성공, work:"+work+", crud:"+crud);

		Map<String,Object> pMap = new HashMap<String,Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pMap);

		String name = null;
		String path = null;
		Object robj = null;

		List<Map<String, Object>> list = null;
		int result = 0;

		if(work.equals("add")) {
			if(crud.equals("ask")) {
				list = equipLogic.add_ask(pMap);
				name ="addAsk";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("askUpd")) {
				result = equipLogic.add_askUpd(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("askDel")) {
				result = equipLogic.add_askDel(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("sign")) {
				result = equipLogic.add_sign(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
		}
		else if(work.equals("purc")) {
			if(crud.equals("ask")) {
				list = equipLogic.purc_ask(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("askUpd")) {
				result = equipLogic.purc_askUpd(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("askDel")) {
				result = equipLogic.purc_askDel(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("sign")) {
				result = equipLogic.purc_sign(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
		}
		else if(work.equals("inb")) {
			if(crud.equals("add")) {
				result = equipLogic.inb_add(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("ask")) {
				result = equipLogic.inb_ask(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("askUpd")) {
				result = equipLogic.inb_askUpd(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("askDel")) {
				result = equipLogic.inb_askDel(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("sign")) {
				result = equipLogic.inb_sign(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("list")) {
				list = equipLogic.inb_list(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
		}
		else if(work.equals("ask")) {
			if(crud.equals("list")) {
				list = equipLogic.ask_list(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
		}
		else if(work.equals("sign")) {
			if(crud.equals("list")) {
				list = equipLogic.sign_list(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
		}
		else if(work.equals("mk")) {
			if(crud.equals("add")) {
				result = equipLogic.mk_add(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("upd")) {
				result = equipLogic.mk_upd(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("del")) {
				result = equipLogic.mk_del(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("list")) {
				list = equipLogic.mk_list(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
		}

		req.setAttribute(name, robj);

		return path;
	}

}
