package eblock.c_dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSession;

public class EquipDao {
	SqlSession sqlSession = null;
	public EquipDao() {
		sqlSession = MybatisSession.getSqlSession();
	}
	

	List<Map<String, Object>> list;
	int result;
	String nameSpace = "eblock.mybatis.mapper.equip.";
	
	
	public List<Map<String, Object>> add_ask(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"add_ask", pMap);
		return list;
	}


	public int add_askUpd(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"add_askUpd",pMap);
		return result;
	}


	public int add_askDel(Map<String, Object> pMap) {
		result = sqlSession.delete(nameSpace+"add_askDel",pMap);
		return result;
	}


	public int add_sign(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"add_sign",pMap);
		return result;
	}


	public List<Map<String, Object>> purc_ask(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"purc_ask", pMap);
		return list;
	}


	public int purc_askUpd(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"purc_askUpd",pMap);
		return result;
	}


	public int purc_askDel(Map<String, Object> pMap) {
		result = sqlSession.delete(nameSpace+"purc_askDel",pMap);
		return result;
	}


	public int purc_sign(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"purc_sign",pMap);
		return result;
	}


	public int inb_add(Map<String, Object> pMap) {
		result = sqlSession.insert(nameSpace+"inb_add",pMap);
		return result;
	}


	public int inb_ask(Map<String, Object> pMap) {
		result = sqlSession.insert(nameSpace+"inb_ask",pMap);
		return result;
	}


	public int inb_askUpd(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"inb_askUpd",pMap);
		return result;
	}


	public int inb_askDel(Map<String, Object> pMap) {
		result = sqlSession.delete(nameSpace+"inb_askDel",pMap);
		return result;
	}


	public int inb_sign(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"inb_sign",pMap);
		return result;
	}
	
	public List<Map<String, Object>> inb_list(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"inb_list", pMap);
		return list;
	}

	public List<Map<String, Object>> ask_list(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"ask_list", pMap);
		return list;
	}


	public List<Map<String, Object>> sign_list(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"sign_list", pMap);
		return list;
	}


	public int mk_add(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"mk_add",pMap);
		return result;
	}


	public int mk_upd(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"mk_upd",pMap);
		return result;
	}


	public int mk_del(Map<String, Object> pMap) {
		result = sqlSession.update(nameSpace+"mk_del",pMap);
		return result;
	}


	public List<Map<String, Object>> mk_list(Map<String, Object> pMap) {
		list = sqlSession.selectList(nameSpace+"mk_list", pMap);
		return list;
	}

}
