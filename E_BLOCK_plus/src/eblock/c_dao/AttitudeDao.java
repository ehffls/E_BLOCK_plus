package eblock.c_dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSession;

public class AttitudeDao {
	SqlSession sqlSession = null;
	public AttitudeDao() {
		sqlSession = MybatisSession.getSqlSession();
	}
	
	List<Map<String, Object>> list;
	int result;
	String nameSpace = "eblock.mybatis.mapper.attitude.";
	
	public int my_ask(Map<String, Object> pMap) {
		result = sqlSession.insert(nameSpace+"my_ask",pMap);
		return result;
	}

	public int my_askUpd(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"my_askUpd",pMap);
		return result;
	}

	public int toMe_sign(List<Map<String, Object>> pMap) {
		result = sqlSession.update(nameSpace+"toMe_sign",pMap);
		return result;
	}

	public List<Map<String, Object>> attd_list(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"attd_list", pMap);
		return list;
	}

	
	
}
