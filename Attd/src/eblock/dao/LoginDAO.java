package eblock.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import eblock.VO.LoginVO;

public class LoginDAO {
	public Connection con 	= null;
	//Statement는 정적쿼리 처리할 때
	PreparedStatement  pstmt 	= null;//동적쿼리를 처리할 때
	ResultSet  			rs		= null;
	DBConnection        dbCon	= new DBConnection();
	
	String res_msg;
	
	//로그인
	public String login(String email, String password) {
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
				res_msg = rs.getString("res_msg");
				
				rs = null;
				pstmt = null;
				if(res_msg.equals("CONFIRM")) {
					StringBuilder empInfo_sql = new StringBuilder("SELECT" + 
							"			 d_no   AS 'd_no'" + 
							"	 		,d_name AS 'd_name'" + 
							"	 		,e_no   AS 'e_no'" + 
							"    		,e_name AS 'e_name'" + 
							"    		,e_rank AS 'e_rank'" + 
							"    		,au_no	AS 'au_no'" + 
							"  		  FROM `view_DpEmpName`" + 
							" 		 WHERE e_no = (SELECT e_no FROM `emp`WHERE e_id = ?" + 
							"                                               AND e_pw = ?);");
					
					pstmt = con.prepareStatement(empInfo_sql.toString());
					pstmt.setString(1, email);
					pstmt.setString(2, password);
					
					rs = pstmt.executeQuery();
					if(rs.next()) {
						int e_no = rs.getInt("e_no");
						rs = null;
						pstmt = null;
						
						StringBuilder cmt_sql = new StringBuilder("INSERT INTO `cmt_list`(cmt_no, e_no, cmt_date, cmt_time)" + 
								"		VALUES(nextSeqVal('seq_cmt_no')" + 
								"			  ,?" + 
								"			  ,DATE_FORMAT(now(), '%Y-%m-%d')" + 
								"      		  ,curtime()" + 
								"			  )" + 
								"		ON DUPLICATE KEY" + 
								"		UPDATE" + 
								"			   e_no = ?" + 
								"			  ,cmt_date = DATE_FORMAT(now(), '%Y-%m-%d')" + 
								"			  ,cmt_time = curtime()");
						pstmt = con.prepareStatement(cmt_sql.toString());
						pstmt.setInt(1, e_no);
						pstmt.setInt(2, e_no);
						
						int result = pstmt.executeUpdate();
						
						if(result==1) {
							res_msg = "출첵 확인";
						}else {
							res_msg = "춠첵 실패";
						}
						
						
						
						rs = null;
						pstmt = null;
					} else {
						
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			allclose();			
		}
		
		return res_msg;
	}

	public void allclose() {
		try {
			if(pstmt!=null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public LoginVO chek() {
		return null;
	}
}
