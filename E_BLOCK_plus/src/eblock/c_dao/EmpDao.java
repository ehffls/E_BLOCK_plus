package eblock.c_dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import util.MybatisSession;

public class EmpDao {
	Logger logger = Logger.getLogger(EmpDao.class);
	
	SqlSession sqlSession = null;
	public EmpDao() {
		sqlSession = MybatisSession.getSqlSession();
	}
	
	List<Map<String, Object>> list;
	int result;
	String nameSpace = "eblock.mybatis.mapper.emp.";
	
	public List<Map<String, Object>> login_check(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"login_check", pMap);
		return list;
	}

	public List<Map<String, Object>> info_empList(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"info_empList", pMap);
		return list;
	}

	public List<Map<String, Object>> info_persList(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"info_persList", pMap);
		return list;
	}

	public int info_persUpd(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"info_persUpd",pMap);
		return result;
	}

	//─────────[ 인사평가 입력 ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int pev_add(Map<String, Object> pMap) {
		sqlSession.update(nameSpace+"pev_add",pMap);//프로시저 호출
		result = (int)pMap.get("result");//'result'키에 담긴 Object 타입을 int타입으로 형전환
		logger.info("[ pev_add ]	  result: "+result);
		return result;
	}

	//─────────[ 인사평가 수정 ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int pev_upd(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"pev_edit",pMap);//프로시저 호출
		return result;
	}

	//─────────[ 인사평가 조회 ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> pev_myList(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"pev_myList", pMap);
		return list;
	}

	public int cmt_checkIn(Map<String, Object> pMap) {
		result = sqlSession.insert(nameSpace+"cmt_checkIn",pMap);
		return result;
	}

	public List<Map<String, Object>> cmt_myList(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"cmt_myList", pMap);
		return list;
	}

	public int cntr_addEmp(Map<String, Object> pMap) {
		result = sqlSession.insert(nameSpace+"cntr_addEmp",pMap);
		return result;
	}

	public int cntr_setDept(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"",pMap);
		return result;
	}

	public int retire_ask(Map<String, Object> pMap) {
		result = sqlSession.insert(nameSpace+"retire_ask",pMap);
		return result;
	}
	
	public List<Map<String, Object>> retire_list(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"retire_list", pMap);
		return list;
	}

	public int retire_sign(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"retire_sign",pMap);
		return result;
	}

	
	public static void main(String[] args) {
		EmpDao eDao = new EmpDao();
		
		Map<String, Object> pMap = new HashMap<>();
		pMap.put("ev_eno",3);
		pMap.put("tg_eno",10);
		pMap.put("ev_content","넌 좀 혼나야함");
		pMap.put("ev_score",40);
		
		List<Map<String,Object>> rlist = null;
		int result = 3;
		 
		result = eDao.pev_add(pMap);
		
		System.out.println(result);
		
	}
}
