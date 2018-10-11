package eblock.b_logic;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import eblock.c_dao.EmpDao;

public class EmpLogic {
	Logger logger = Logger.getLogger(EmpLogic.class);
	EmpDao empDao = null;
	
	public EmpLogic() {
		empDao = new EmpDao();
	}
	
	
	int result = 0;
	List<Map<String, Object>> list = null;
	Map<String, Object> rMap;
	
	public Map<String, Object> login_check(Map<String, Object> pMap, HttpServletResponse res) {
		rMap = empDao.login_check(pMap);
		if(rMap.get("res_msg")==null) {
			String e_name = (String) rMap.get("e_name"); 
			String e_no = String.valueOf(rMap.get("e_no")); 
			String au_no = String.valueOf(rMap.get("au_no")); 
			String d_no = String.valueOf(rMap.get("d_no")); 
			String d_name = String.valueOf(rMap.get("d_name")); 
			String e_rank = String.valueOf(rMap.get("e_rank")); 
			
			Cookie c_ename = new Cookie("c_ename", e_name); 
			Cookie c_eno = new Cookie("c_eno", e_no); 
			Cookie c_auno = new Cookie("c_auno", au_no); 
			Cookie c_dno = new Cookie("c_dno", d_no); 
			Cookie c_dname = new Cookie("c_dname", d_name); 
			Cookie c_erank = new Cookie("c_erank", e_rank); 
			c_ename.setPath("/"); 
			c_eno.setPath("/"); 
			c_auno.setPath("/"); 
			c_dno.setPath("/"); 
			c_dname.setPath("/"); 
			c_erank.setPath("/"); 
			res.addCookie(c_ename); 
			res.addCookie(c_eno); 
			res.addCookie(c_auno);
			res.addCookie(c_dno);
			res.addCookie(c_dname);
			res.addCookie(c_erank);
			
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
		return rMap;
	}

	public List<Map<String, Object>> info_empList(Map<String, Object> pMap) {
		list = empDao.info_empList(pMap);
		return list;
	}

	public List<Map<String, Object>> info_persList(Map<String, Object> pMap) {
		pMap.put("e_no", pMap.get("c_eno"));
		list = empDao.info_persList(pMap);
		//////////////////View처리 대신 Logic에서 변환처리 할 수 있는 방법 시작////////////////////////////////
		Map<String,Object> rMap = list.get(0);
		String gender = (String)rMap.get("gender");
		if("0".equals(gender)){
			gender="남자";
		} else if("1".equals(gender)) {
			gender="여자";
		}
		rMap.put("gender", gender);
		int e_rank = Integer.parseInt(rMap.get("e_rank").toString());
		String e_rankS = "";
		if(e_rank==50){
			e_rankS="대표";
		} else if(e_rank==40) {
			e_rankS="부서장";
		} else if(e_rank==30) {
			e_rankS="차장";
		} else if(e_rank==20) {
			e_rankS="팀장";
		} else if(e_rank==10) {
			e_rankS="사원";
		} else {
			e_rankS="인턴";
		}
		rMap.put("e_rank", e_rankS);
		list.add(0, rMap);
		//////////////////View처리 대신 Logic에서 변환처리 할 수 있는 방법 끝////////////////////////////////
		return list;
	}

	public int info_persUpd(Map<String, Object> pMap) {
		result = empDao.info_persUpd(pMap);
		return result;
	}

	public int pev_add(Map<String, Object> pMap) {
		result = empDao.pev_add(pMap);
		return result;
	}

	public int pev_upd(Map<String, Object> pMap) {
		result = empDao.pev_upd(pMap);
		return result;
	}

	public List<Map<String, Object>> pev_myList(Map<String, Object> pMap) {
		list = empDao.pev_myList(pMap);
		return list;
	}

	public int cmt_checkIn(Map<String, Object> pMap) {
		result = empDao.cmt_checkIn(pMap);
		return result;
	}
	
	public List<Map<String, Object>> cmt_calendar(Map<String, Object> pMap) {
		pMap.put("e_no", pMap.get("c_eno"));
		list = empDao.cmt_calendar(pMap);
		
		Map<String,Object> rMap = null;
		Map<String,Object> iMap = null;
		Map<String,Object> oMap = null;
		logger.info(list);
		List<Map<String, Object>> rlist = new ArrayList<Map<String,Object>>();
		for(int i=0;i<list.size();i++) {
			rMap = new HashMap<String,Object>();
			oMap = new HashMap<String,Object>();
			iMap = new HashMap<String,Object>();
			rMap = list.get(i);
			iMap.put("start", rMap.get("checkin"));
			iMap.put("title", "출근");
			rlist.add(iMap);
			oMap.put("start", rMap.get("checkout"));
			oMap.put("title", "퇴근");
			rlist.add(oMap);
			
		}
		return rlist;
	}

	public List<Map<String, Object>> cmt_myList(Map<String, Object> pMap) {
		list = empDao.cmt_myList(pMap);
		return list;
	}

	public List<Map<String, Object>> cmt_deptList(Map<String, Object> pMap) {
		list = empDao.cmt_deptList(pMap);
		return list;
	}
	
	public List<Map<String, Object>> cntr_list(Map<String, Object> pMap) {
		list = empDao.cntr_list(pMap);
		return list;
	}
	
	public int cntr_addEmp(Map<String, Object> pMap, HttpServletResponse res)  {
		logger.info(pMap);
		result = empDao.cntr_addEmp(pMap);
		logger.info(pMap.get("result"));
		if(result == 1) {
			try {
				Cookie c_email = new Cookie("email",URLEncoder.encode(pMap.get("e_email").toString(),"utf-8"));
				Cookie c_ename = new Cookie("name", URLEncoder.encode(pMap.get("e_name").toString(),"utf-8"));
				c_email.setMaxAge(2*60);
				c_ename.setMaxAge(2*60);
				c_email.setPath("/");
				c_ename.setPath("/");
				res.addCookie(c_email);
				res.addCookie(c_ename);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		logger.info(pMap.get("result"));
		return result;
	}

	public int cntr_setDeptAuth(Map<String, Object> pMap) {
		logger.info(pMap);
		result = empDao.cntr_setDeptAuth(pMap);
		logger.info(result);
		return result;
	}

	public int retire_ask(Map<String, Object> pMap) {
		result = empDao.retire_ask(pMap);
		return result;
	}

	public List<Map<String,Object>> retire_list(Map<String, Object> pMap) {
		list = empDao.retire_list(pMap);
		return list;
	}
	
	
	public int retire_askUpd(Map<String, Object> pMap) {
		result = empDao.retire_askUpd(pMap);
		return result;
	}
	
	public int retire_sign(Map<String, Object> pMap) {
		logger.info("pMap.get(\"param\") : "+pMap.get("param"));
		//넘어온 파람을 분할한다.
		String[] words = pMap.get("param").toString().split(",");
		//넘어온걸 반복문을 위해 리스트로 작성한다.
		List<Map<String,Object>> newList = new ArrayList<>();
		Map<String,Object> newMap = null;
		for(int i=1;i<words.length;i++) {
			newMap = new HashMap<>();
			newMap.put("outcome",words[0]);//상태값
			newMap.put("rt_no",words[i]);
			//newMap.put("rt_no", pMap.get("c_eno"));//결재자번호 10.. 쿠키에서 얻어야함.
			newList.add(newMap);
		}
		logger.info("newList : "+newList);
		//작성한 리스트를 넘김
		result = empDao.retire_sign(newList);
		logger.info("result : "+result);
		return result;
	}

	public List<Map<String,Object>> pev_tgList(Map<String, Object> pMap) {
		list = empDao.pev_tgList(pMap);
		return list;
	}




}
