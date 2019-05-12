package com.servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnMySQL {
	public static Connection connectSql () {
		Connection conn = null;
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/shoes?useSSL=false&serverTimezone=UTC";
		String user = "wl36901";
		String password = "0909";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
				
		
	}
}
