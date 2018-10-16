package eblock.c_dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;



public class BudgetDao {
	private SqlSessionTemplate sqlSessionTemplate=null;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	List<Map<String, Object>> list;
	int result;
	String nameSpace = "eblock.mybatis.mapper.budget.";
	
	public int ex_deptEx(Map<String, Object> pMap) {
		result = sqlSessionTemplate.insert(nameSpace+"ex_deptSign",pMap);
		return result;
	}

	public int ex_deptUpd(Map<String, Object> pMap) {
		result = sqlSessionTemplate.update(nameSpace+"ex_deptUpd",pMap);
		return result;
	}

	public int ex_deptDel(Map<String, Object> pMap) {
		result = sqlSessionTemplate.delete(nameSpace+"ex_deptDel",pMap);
		return result;
	}

	public List<Map<String, Object>> ex_deptList(Map<String, Object> pMap) {
		list = sqlSessionTemplate.selectList(nameSpace+"ex_deptList", pMap);
		return list;
	}

	public int ex_okEx(Map<String, Object> pMap) {
		result = sqlSessionTemplate.insert(nameSpace+"ex_okSign",pMap);
		return result;
	}

	public int ex_okDel(Map<String, Object> pMap) {
		result = sqlSessionTemplate.delete(nameSpace+"ex_okDel",pMap);
		return result;
	}

	public List<Map<String, Object>> ex_okList(Map<String, Object> pMap) {
		list = sqlSessionTemplate.selectList(nameSpace+"ex_okList", pMap);
		return list;
	}

	public int pay_ex(Map<String, Object> pMap) {
		result = sqlSessionTemplate.insert(nameSpace+"pay_sign", pMap);
		return result;
	}

	public List<Map<String, Object>> pay_list(Map<String, Object> pMap) {
		list = sqlSessionTemplate.selectList(nameSpace+"pay_list", pMap);
		return list;
	}
	
	
	
}
