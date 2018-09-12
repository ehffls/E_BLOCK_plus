package eblock.a_controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import eblock.b_logic.BudgetLogic;
import util.HashMapBinder;

public class BudgetController implements Controller {
	Logger logger = Logger.getLogger(BudgetController.class);
	String work = null;
	String crud = null;
	BudgetLogic budgetLogic = null;
	
	public BudgetController(String work, String crud){
		this.work = work;
		this.crud = crud;
		budgetLogic = new BudgetLogic();
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
		
		if(work.equals("ex")) {
			if(crud.equals("deptEx")) {
				result = budgetLogic.ex_deptEx(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("deptUpd")) {
				result = budgetLogic.ex_deptUpd(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("deptDel")) {
				result = budgetLogic.ex_deptDel(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("deptList")) {
				list = budgetLogic.ex_deptList(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("okEx")) {
				result = budgetLogic.ex_okEx(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("okDel")) {
				result = budgetLogic.ex_okDel(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("okList")) {
				list = budgetLogic.ex_okList(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
		}
		else if(work.equals("pay")) {
			if(crud.equals("ex")) {
				result = budgetLogic.pay_ex(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			else if(crud.equals("list")) {
				list = budgetLogic.pay_list(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
		}
		
		req.setAttribute(name, robj);

		return path;
	}

}
