<%@page import="java.sql.*"%>

<%@page import="com.jnit1.*"%>
<%
Connection con = DbConnection.getConnection();
String name = request.getParameter("email");
String password = request.getParameter("password");
PreparedStatement ps = con.prepareStatement("select * from doctorregister where email=? and password=?");
ps.setString(1, name);
ps.setString(2, password);
ResultSet rs = ps.executeQuery();

if (rs.next()) {
	session.setAttribute("id", rs.getInt(1));
	session.setAttribute("name", rs.getString(2));
	session.setAttribute("specialist", rs.getString("specialist"));
	response.sendRedirect("doctor_home.html?msg=sucess");
}
%>