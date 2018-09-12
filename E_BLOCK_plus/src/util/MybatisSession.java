package util;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//MapperConfig.xml에 등록된 DB에 접속하는 정보를 모두 담은 SQL세션을 생성해주는 공통코드
public class MybatisSession {
	//Logger logger = Logger.getLogger(DBConnection.class);
	static String resource = "eblock/mybatis/MapperConfig.xml";//커넥션에 필요한 정보를 담은 xml문서
	public static SqlSession getSqlSession() {
		//logger.info("getConnection 호출 성공");
		SqlSession sqlSes = null;
		SqlSessionFactory sqlMapper = null;

		//mybatis-3.4.6.pdf 2페이지  하단 참조
		//InputStream 대신 Reader class사용 : 한글바이트 때문
		
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();//SqlSession 생성
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(reader!=null) reader.close();//자원반납
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return sqlSes;
	}
}