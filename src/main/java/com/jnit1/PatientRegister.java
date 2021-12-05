package com.jnit1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PatientRegister
 */

public class PatientRegister extends HttpServlet {
	
	Connection con=null;
	PreparedStatement ps=null;
public void init(ServletConfig config) {
	con=DbConnection.getConnection();
	
}
public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException {
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	int phone=Integer.parseInt(request.getParameter("phone"));
	String address=request.getParameter("address");
	try {
		ps=con.prepareStatement("insert into patientregister(name,email,password,phone,address) value(?,?,?,?,?)");
		ps.setString(1, name);
		ps.setString(2, email);
		ps.setString(3, password);
		ps.setInt(4, phone);
		ps.setString(5, address);
		int x=ps.executeUpdate();
		PrintWriter pw=response.getWriter();
		if(x!=0)
			response.sendRedirect("patient_login.html");
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	
}
}
