package eblock.c_dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import util.MybatisSession;

//사원업무 DAO계층
public class EmpDao {
	Logger logger = Logger.getLogger(EmpDao.class);	
	SqlSession sqlSession = null;// Dao클래스 인스턴스로 생성자 주입받아서 초기화
	public EmpDao() { sqlSession = MybatisSession.getSqlSession(); }
	
	List<Map<String, Object>> list;
	Map<String, Object> rMap;
	int result;
	String nameSpace = "eblock.mybatis.mapper.emp."; //emp.xml mapper namespace

	
	
	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	
	
	//─────[ 로그인하기 | 테스트완료(09/23) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public Map<String, Object> login_check(Map<String, Object> pMap) {
			//아이디,비밀번호를 입력하여 확인받기
		rMap = sqlSession.selectOne(nameSpace+"login_check", pMap);
			//확인결과가 승인메시지일때
		if("CONFIRM".equals(rMap.get("res_msg").toString())) {
			rMap = sqlSession.selectOne(nameSpace+"get_empInfo", pMap);
		}
		logger.info(rMap);
		return rMap;
	}

	
	
	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	
	
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

	
	
	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	
	
	//─────[ 인사평가 입력 <<프로시저>> | 테스트완료(09/21) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int pev_add(Map<String, Object> pMap) {
		sqlSession.update(nameSpace+"pev_add",pMap);//프로시저 호출
		result = (int)pMap.get("result");//'result'키에 담긴 Object 타입을 int타입으로 형전환
		//logger.info("[ pev_add ]	  result: "+result);
		return result;
	}
	//─────[ 인사평가 수정 <<프로시저>> | 테스트완료(09/23) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int pev_upd(Map<String, Object> pMap) {
		sqlSession.update(nameSpace+"pev_upd",pMap);//프로시저 호출
		result = (int)pMap.get("result");//'result'키에 담긴 Object 타입을 int타입으로 형전환
		logger.info("[ pev_add ] result: "+result);
		return result;
	}
	//─────[ 내가 평가한내역 조회 | 테스트완료(09/23) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> pev_myList(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"pev_myList", pMap);
		return list;
	}

	//─────[ 평가 가능한 인사평가대상 조회  ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> pev_tgList(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"pev_tgList", pMap);
		return list;
	}
	
	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	
	
	
	//─────[ 출결 체크하기 | 테스트완료(09/25) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int cmt_checkIn(Map<String, Object> pMap) {
		result = sqlSession.insert(nameSpace+"cmt_checkIn",pMap);
		return result;
	}
	
	//─────[ 출결 조회하기 (달력용) | 테스트완료(10/01) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> cmt_calendar(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"cmt_calendar",pMap);
		return list;
	}

	//─────[ 출결 조회하기 | 테스트완료(09/25) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> cmt_myList(Map<String, Object> pMap) {
		//개인이 조회하는 업무이므로 사원번호(e_no)이 조건으로 들어가야함
		list = sqlSession.selectList(nameSpace+"cmt_list", pMap);
		return list;
	}
	
	//─────[ 부서단위 출결 조회하기 | 테스트완료(09/25) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> cmt_deptList(Map<String, Object> pMap) {
		//부서장이 조회하는 업무이므로 부서명(d_name)이 조건으로 들어가야함
		list = sqlSession.selectList(nameSpace+"cmt_list", pMap);
		return list;
	}
	
	
	
	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	//─────[ 기존사원 계약조회 ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

	public List<Map<String, Object>> cntr_list(Map<String, Object> pMap) {
		//부서장이 조회하는 업무이므로 부서명(d_name)이 조건으로 들어가야함
		logger.info(pMap);
		list = sqlSession.selectList(nameSpace+"cntr_list", pMap);
		return list;
	}
	
	//─────[ 신입사원 '등록 및 계약' 혹은 기존사원 '재계약' <<프로시저>> | 테스트완료(09/27) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int cntr_addEmp(Map<String, Object> pMap) {
		sqlSession.insert(nameSpace+"cntr_addEmp",pMap);
		result = (int)pMap.get("result");//'result'키에 담긴 Object 타입을 int타입으로 형전환
		//logger.info("[ pev_add ]	  result: "+result);
		return result; 
	}

	//─────[ 부서배정/이동/권한부여 | 테스트완료(09/26) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int cntr_setDeptAuth(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"setDeptAuth",pMap);
		return result;
	}
	
	
	
	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	
	
	//─────[ 퇴사신청하기 | 테스트완료(09/27) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int retire_ask(Map<String, Object> pMap) {
		result = sqlSession.insert(nameSpace+"retire_ask",pMap);
		return result;
	}
	
	//─────[ 퇴사신청 조회하기 | 테스트완료(09/27) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public List<Map<String, Object>> retire_list(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"retire_list", pMap);
		return list;
	}

	//─────[ 퇴사신청 수정하기 | 테스트완료(09/27) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int retire_askUpd(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"retire_askUpd", pMap);
		return result;
	}
	
	//─────[ 퇴사신청 처리하기(결재) | 테스트완료(09/27) ]────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	public int retire_sign(List<Map<String, Object>> pMap) {
		result = sqlSession.update(nameSpace+"retire_sign",pMap);
		return result;
	}


	//내가평가 가능한 인사평가대상 조회
	public List<Map<String, Object>> pev_tgList(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"pev_tgList", pMap);
		return list;
	}

}
