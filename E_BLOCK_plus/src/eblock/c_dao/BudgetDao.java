package eblock.c_dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSession;


public class BudgetDao {
	public BudgetDao() {
		SqlSession sqlSession = MybatisSession.getSqlSession();
	}

	public List<Map<String,Object>> 나의정보(Map<String, Object> pMap) {
		
		return null;
	}

	public int 나의정보삭제(Map<String, Object> pMap) {
		int result = 0;
		
		return result;
	}
	
}
