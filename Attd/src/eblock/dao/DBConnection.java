package eblock.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	final String _URL = "jdbc:mysql://raonjena.iptime.org:3306/EBLOCK?serverTimezone=UTC&allowMultiQueries=true&noAccessToProcedureBodies=true";
	final String _USER = "EBlockSub";
	final String _PW = "HLJLJH";
	Connection con = null;

	Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(_URL, _USER, _PW);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
		}
		return con;
	}
}
