package eblock.b_logic;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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
	
	public Map<String, Object> login_check(Map<String, Object> pMap) {
		rMap = empDao.login_check(pMap);
		return rMap;
	}

	public List<Map<String, Object>> info_empList(Map<String, Object> pMap) {
		list = empDao.info_empList(pMap);
		return list;
	}

	public List<Map<String, Object>> info_persList(Map<String, Object> pMap) {
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
		result = empDao.retire_sign(pMap);
		return result;
	}




}
