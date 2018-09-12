package eblock.a_controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import eblock.b_logic.EmpLogic;
import util.HashMapBinder;

public class EmpController implements Controller {
	Logger logger = Logger.getLogger(EmpController.class);
	String work = null;
	String crud = null;
	EmpLogic empLogic = null;

	public EmpController(String work, String crud) {
		this.work = work;
		this.crud = crud;
		empLogic = new EmpLogic();
	}
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("excute 호출 성공, work:"+work+", crud:"+crud);
		
		Map<String,Object> pMap = new HashMap<String,Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pMap);
		
		
		String name = null; //attribute의 name
		String path = null; //forward:xxx.jsp
		Object robj = null; //
		
		//work와 crud가 있어야 컨트롤러가 생성되므로 NullPointerException을 논리적으로 방지한 상태이다.
		if(work.equals("login")) {
			//로그인하기
			if(crud.equals("check")) {
				robj = empLogic.login_check(pMap);
				name ="attribute의 name";
				path="forward:xxx.jsp";
			}
		}
		//정보조회
		else if(work.equals("info")) {
			//사원집합에 대한 조건에 따라조회하기
			if(crud.equals("empList")) {
				robj = empLogic.info_empList(pMap);
				name ="attribute의 name";
				path="forward:xxx.jsp";
			}
			//사원 개인정보 조회하기
			else if(crud.equals("persList")) {
				robj = empLogic.info_persList(pMap);
				name ="attribute의 name";
				path="forward:xxx.jsp";
			}
			//사원 개인정보 선택부분 수정하기
			else if(crud.equals("persUpd")) {
				robj = empLogic.info_persUpd(pMap);
				name ="attribute의 name";
				path="forward:xxx.jsp";
			}
		}
		//인사평가
		else if(work.equals("pev")) {
			//인사평가 기간에 인사평가 입력하기
			if(crud.equals("add")) {
				robj = empLogic.pev_add(pMap);
				name ="attribute의 name";
				path="forward:xxx.jsp";
			}
			//인사평가 기간에 인사평가 수정하기
			else if(crud.equals("update")) {
				robj = empLogic.pev_upd(pMap);
				name ="attribute의 name";
				path="forward:xxx.jsp";
			}
			//내가 평가한내역 조회하기(타인은 열람불가)
			else if(crud.equals("myList")) {
				robj = empLogic.pev_myList(pMap);
				name ="attribute의 name";
				path="forward:xxx.jsp";
			}
		}
		//출결
		else if(work.equals("cmt")) {
			//출결 체크하기
			if(crud.equals("checkIn")) {
				robj = empLogic.cmt_checkIn(pMap);
				name ="attribute의 name";
				path="forward:xxx.jsp";
			}
			//출결 조회하기
			else if(crud.equals("myList")) {
				robj = empLogic.cmt_myList(pMap);
				name ="attribute의 name";
				path="forward:xxx.jsp";
			}
		}
		//인사관리
		else if(work.equals("cntr")) {
			//인사사원 등록하기
			if(crud.equals("addEmp")) {
				robj = empLogic.cntr_addEmp(pMap);
				name ="attribute의 name";
				path="forward:xxx.jsp";
			}
			//부서배정하기 및 이동하기
			else if(crud.equals("setDept")) {
				robj = empLogic.cntr_setDept(pMap);
				name ="attribute의 name";
				path="forward:xxx.jsp";
			}
		}
		//퇴사
		else if(work.equals("retire")) {
			//퇴사 신청하기
			if(crud.equals("ask")) {
				robj = empLogic.retire_ask(pMap);
				name ="attribute의 name";
				path="forward:xxx.jsp";
				
			}
			//퇴사신청 조회하기
			else if(crud.equals("list")) {
				robj = empLogic.retire_list(pMap);
				name ="attribute의 name";
				path="forward:xxx.jsp";
			}
			//퇴사신청 처리하기
			else if(crud.equals("sign")) {
				robj = empLogic.retire_sign(pMap);
				name ="attribute의 name";
				path="forward:xxx.jsp";
			}
		}

		if(path.contains("forward")) {
			req.setAttribute(name, robj);
		}
		return path;
	}
}
