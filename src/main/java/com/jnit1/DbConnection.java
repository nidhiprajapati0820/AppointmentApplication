package com.jnit1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

 public class DbConnection {

	public static Connection getConnection() {
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String url="jdbc:mysql://localhost:3306/appointmentapplication";
		String username="root";
		String password="root";
		try {
			 con=DriverManager.getConnection(url,username,password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}

