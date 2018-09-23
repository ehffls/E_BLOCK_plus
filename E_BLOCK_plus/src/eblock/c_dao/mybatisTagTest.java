package eblock.c_dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSession;

public class mybatisTagTest {
	SqlSession sqlSession = null;
	public mybatisTagTest() {
		sqlSession = MybatisSession.getSqlSession();
	}
	

	List<Map<String, Object>> list;
	int result;
	String nameSpace = "eblock.mybatis.mapper.mybatisTagTest.";
	
	
	public List<Map<String, Object>> multi_update_test(Map<String, Object> pMap) {
		List<Map<String, Object>> plist = new ArrayList<>();
		pMap = new HashMap<>();
		pMap.put("au_no", 35);
		pMap.put("au_scope", "비품추가요청승인 변경");
		pMap.put("test", "a");
		plist.add(pMap);
		pMap = new HashMap<>();
		pMap.put("au_no", 36);
		pMap.put("au_scope", "비품구요청승인 변경");
		pMap.put("test", "b");
		plist.add(pMap);
		list = sqlSession.selectList(nameSpace+"multi_update_test", plist);
		return list;
	}
	
	public static void main(String[] args) {
		mybatisTagTest mtt = new mybatisTagTest();
		mtt.multi_update_test(null);
	}
	
}
