package eblock.a_controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import eblock.b_logic.EmpLogic;
import util.CookieBinder;
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
		CookieBinder cb = new CookieBinder(req);
		cb.bind(pMap);
		
		logger.info(pMap);

		String name = null; //attribute의 name
		String path = null; //forward:xxx.jsp
		Object robj = null; //
		
		//work와 crud가 있어야 컨트롤러가 생성되므로 NullPointerException을 논리적으로 방지한 상태이다.
		if(work.equals("login")) {
			//로그인하기
			if(crud.equals("check")) {
				robj = empLogic.login_check(pMap);
				Map rMap = (Map<String,Object>)robj;
				if(rMap.get("res_msg")==null) {
					String e_name = (String) rMap.get("e_name"); 
					String e_no = String.valueOf(rMap.get("e_no")); 
					String au_no = String.valueOf(rMap.get("au_no")); 
					Cookie c_ename = new Cookie("c_ename", e_name); 
					Cookie c_eno = new Cookie("c_eno", e_no); 
					Cookie c_auno = new Cookie("c_auno", au_no); 
					c_ename.setPath("/"); 
					c_eno.setPath("/"); 
					c_auno.setPath("/"); 
					res.addCookie(c_ename); 
					res.addCookie(c_eno); 
					res.addCookie(c_auno);
					
					Cookie c_res_msg = new Cookie("res_msg","");
					c_res_msg.setPath("/");
					c_res_msg.setMaxAge(0);
					res.addCookie(c_res_msg);
				}else {
					String res_msg = rMap.get("res_msg").toString();
					Cookie c_res_msg = new Cookie("res_msg",res_msg);
					c_res_msg.setPath("/");
					res.addCookie(c_res_msg);
				}
				path = "redirect:/emp/login/login_result.jsp"; 
			}
			
		}
		//정보조회
		else if(work.equals("info")) {
			//사원집합에 대한 조건에 따라조회하기
			if(crud.equals("empList")) {
				robj = empLogic.info_empList(pMap);
				name = "eList";
				path = "forward:/emp/info/empList_JSON.jsp";
			}
			//사원 개인정보 조회하기
			else if(crud.equals("persList")) {
				robj = empLogic.info_persList(pMap);
				name = "rList";
				path = "forward:/emp/info/persList.jsp";
			}
			//사원 개인정보 선택부분 수정하기
			else if(crud.equals("persUpd")) {
				robj = empLogic.info_persUpd(pMap);
				name = "attribute의 name";
				path = "forward:xxx.jsp";
			}
		}
		//인사평가
		else if(work.equals("pev")) {
			//인사평가 기간에 인사평가 입력하기
			if(crud.equals("add")) {
				robj = empLogic.pev_add(pMap);
				name ="pevADD";
				path="forward:pevADD.jsp";
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
				name ="pevList";
				path="forward:/emp/pev/pevMyList_JSON.jsp";
			}
			//내가평가 가능한 인사평가대상 조회
			else if(crud.equals("myList")) {
				robj = empLogic.pev_tgList(pMap);
				name ="";
				path="forward:/emp/pev/pevMyList_JSON.jsp";
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
			//출결 체크하기 (달력용)
			if(crud.equals("cmt_calendar")) {
				robj = empLogic.cmt_calendar(pMap);
				name ="calendar";
				path="forward:/emp/cmt/List_JSON.jsp";
			}
			//출결 조회하기 (개인)
			else if(crud.equals("myList")) {
				robj = empLogic.cmt_myList(pMap);
				name ="rList";
				path="forward:jsp";
			}
			//출결 조회하기 (부서)
			else if(crud.equals("deptList")) {
				robj = empLogic.cmt_deptList(pMap);
				name ="dList";
				path="forward:/emp/cmt/cmtDeptList_JSON.jsp";
			}
		}
		//인사관리
		else if(work.equals("cntr")) {
			//기존사원 계약조회
			if(crud.equals("list")) {
				robj = empLogic.cntr_list(pMap);
				name ="cntr_list";
				path="forward:/emp/cntr/cntrModal.jsp";
			}
			//인사사원 등록하기
			else if(crud.equals("addEmp")) {
				logger.info(pMap);
				robj = empLogic.cntr_addEmp(pMap, res); //쿠키 생성을 위한 응답객체
				path="redirect:/emp/cntr/cntrList.jsp";
			}
			//부서배정하기 및 이동하기
			else if(crud.equals("setDeptAuth")) {
				robj = empLogic.cntr_setDeptAuth(pMap);
				name ="setDept";
				path="forward:/emp/cntr/cntrList.jsp";
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
			//퇴사신청 수정하기
			else if(crud.equals("askUpd")) {
				robj = empLogic.retire_askUpd(pMap);
				name ="attribute의 name";
				path="forward:xxx.jsp";
			}
			//퇴사신청 조회하기
			else if(crud.equals("list")) {
				robj = empLogic.retire_list(pMap);
				name ="rList";
				path="forward:/emp/retire/list_JSON.jsp";
			}
			//퇴사신청 처리하기(결재)
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
