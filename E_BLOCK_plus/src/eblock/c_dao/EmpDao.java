package eblock.c_dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import util.MybatisSession;

//사원업무 DAO계
public class EmpDao {
	Logger logger = Logger.getLogger(EmpDao.class);	
	SqlSession sqlSession = null;// Dao클래스 인스턴스로 생성자 주입받아서 초기화
	public EmpDao() { sqlSession = MybatisSession.getSqlSession(); }
	
	List<Map<String, Object>> list;
	int result;
	String nameSpace = "eblock.mybatis.mapper.emp."; //emp.xml mapper namespace


	
	//─────[ 로그인하기 | 테스트완료(09/23) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> login_check(Map<String, Object> pMap) {
			//아이디,비밀번호를 입력하여 확인받기
		list = sqlSession.selectList(nameSpace+"login_check", pMap);
			//확인결과가 승인메시지일때
		if(list.get(0).get("res_msg") == "CONFIRM") {
			int e_no = (int)list.get(0).get("res_msg");//결과값은 사원번호
			pMap.put("e_no",e_no);//사원번호로 사원정보받기
			list = sqlSession.selectList(nameSpace+"get_empInfo", pMap);
		}
		return list;
	}

	
	
	
	//─────[ 사원조회 | 테스트완료(09/23) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> info_empList(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"info_empList", pMap);
		return list;
	}
	//─────[ 사원개인정보조회 | 테스트완료(09/23) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> info_persList(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"info_persList", pMap);
		return list;
	}
	//─────[ 사원개인정보수정 | 테스트완료(09/23) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int info_persUpd(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"info_persUpd",pMap);
		return result;
	}

	
	
	
	//─────[ 인사평가 입력 | 테스트완료(09/21) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int pev_add(Map<String, Object> pMap) {
		sqlSession.update(nameSpace+"pev_add",pMap);//프로시저 호출
		result = (int)pMap.get("result");//'result'키에 담긴 Object 타입을 int타입으로 형전환
		//logger.info("[ pev_add ]	  result: "+result);
		return result;
	}
	//─────[ 인사평가 수정 | 테스트완료(09/23) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int pev_upd(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"pev_upd",pMap);//프로시저 호출
		result = (int)pMap.get("result");//'result'키에 담긴 Object 타입을 int타입으로 형전환
		logger.info("[ pev_add ]	  result: "+result);
		return result;
	}
	//─────[ 인사평가 조회 | 테스트완료(09/23) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> pev_myList(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"pev_myList", pMap);
		return list;
	}

	
	/////////여기까지 작업했음.
	
	
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
		List<Map<String,Object>> rlist = null;
		int result = 0;
		
		
		//인사평가 수정 테스트 (09/23)
//		pMap.put("ev_eno",3);
//		pMap.put("tg_eno",10);
//		pMap.put("ev_content","재판단.. 괜찮은 친구네 ");
//		pMap.put("ev_score",85);
//		
//		result = eDao.pev_upd(pMap);
//		System.out.println(result);

		
		//인사평가 입력 테스트 (09/21)
//		pMap.put("ev_eno",3);
//		pMap.put("tg_eno",10);
//		pMap.put("ev_content","넌 좀 혼나야함");
//		pMap.put("ev_score",40);
//		
//		result = eDao.pev_add(pMap);
//		System.out.println(result);
		
		
		//인사평가 조회 테스트 (09/23)
//		pMap.put("ev_eno", 3);
//		pMap.put("min_qrtno", "18-3");
//		rlist = eDao.pev_myList(pMap);
		
		
		
		
		
		//사원개인정보 수정 테스트 (09/23)
//		pMap.put("e_no", 5);
//		pMap.put("e_ph", "010-9988-9898");
//		pMap.put("e_addr","어디든 살고있음");
//		result = eDao.info_persUpd(pMap);

		
		//사원개인정보 조회 테스트 (09/23)
//		pMap.put("e_no", 1);
//		rlist = eDao.info_persList(pMap);
			
		
		//사원정보조회 테스트 (09/23)
//		pMap.put("e_name", "김");
//		rlist = eDao.info_empList(pMap);
		
		
		
		
		
		//로그인하기 테스트 (09/23)
//		pMap.put("e_id","lantern");
//		pMap.put("e_pw","fp1026");
//		rlist = eDao.login_check(pMap);
//		System.out.println(rlist.get(0).size());
		
		
	}
}
