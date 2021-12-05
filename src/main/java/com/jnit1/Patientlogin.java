package com.jnit1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class Patientlogin extends HttpServlet {
	
	Connection con=null;
	PreparedStatement ps=null;
public void init(ServletConfig config) {
	con=DbConnection.getConnection();
}
public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	try {
	
		ps=con.prepareStatement("select * from patientregister where email=? and password=?");
		ps.setString(1, email);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		HttpSession hs=request.getSession();
		if(rs.next()) {
			hs.setAttribute("id", rs.getInt(1));
			hs.setAttribute("email",rs.getString(3));
			
			response.sendRedirect("patient_home.html");
			
		}
		else {
			response.sendRedirect("patient_login.html");
		}
		
	} catch (SQLException e) {
	
		e.printStackTrace();
	}
}
}
	