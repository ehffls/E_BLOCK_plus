package eblock.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import eblock.VO.LoginVO;

public class ChatDAO {
	public Connection con 	= null;
	//Statement는 정적쿼리 처리할 때
	PreparedStatement  pstmt 	= null;//동적쿼리를 처리할 때
	ResultSet  			rs		= null;
	DBConnection        dbCon	= new DBConnection();
	public final int openRoom = 0;
	public final int secretRoom = 1;
	
	
	//로그인
	public LoginVO login(String email, String password) {
		LoginVO lvo = new LoginVO();
		StringBuilder sql = new StringBuilder("SELECT CASE(" + 
				"                	 IFNULL(" + 
				"               				(SELECT" + 
				"               						CASE (SELECT IFNULL(" + 
				"               										    (SELECT 1 FROM DUAL WHERE EXISTS" + 
				"               										     	(SELECT e_id FROM `emp` WHERE e_id = ?)" + 
				"               										    ), -1 ) FROM DUAL" + 
				"                                             )" + 
				"                                     WHEN -1 THEN -1" + 
				"                                     WHEN  1 THEN (SELECT 2 FROM `emp`" + 
				"                                                    WHERE e_id = ?" + 
				"                                                      AND e_pw = ? )" + 
				"                                      END" + 
				"                                  FROM dual" + 
				"                             ), 1 )" +  
				"                            )" +  
				"                WHEN -1 THEN 'THE ID DOSE NOT EXIST'" + 
				"                WHEN  1 THEN 'PASSWORD DOSE NOT MATCH'" + 
				"                WHEN  2 THEN 'CONFIRM'" + 
				"                 END AS 'res_msg'" + 
				"  		  FROM DUAL;");
		try {
			con = dbCon.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			pstmt.setString(2, email);
			pstmt.setString(3, password);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				lvo.login_success = true;
				lvo.res_msg = rs.getString("res_msg");
				
				rs = null;
			} else {
				lvo.login_success = false;
			}
		} catch (Exception e) {
			System.out.println("dao(login(String email, String password)):"+e.toString());
		} finally {
			allclose();			
		}
		
		return lvo;
	}

	public void allclose() {
		try {
			if(pstmt!=null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
