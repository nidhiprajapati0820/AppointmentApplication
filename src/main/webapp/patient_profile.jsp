<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body bgcolor="wheat">
<br><br><br><br>
<center><h1>Welcome to Patient Home</h1></center>
<br><br><br>
<a href="patient_profile.jsp">Profile</a>
<br><br><br>
<%@page import="java.sql.*" %>
<table align="center" border="2" cellpadding="20" width="500" height="150">
<tr>
<td>Patient Id</td><td>Name</td><td>Email</td><td>Phone</td><td>Address</td><td>Action</td>
</tr>
<%
Connection con=null;
PreparedStatement ps=null;
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/appointmentapplication";
String username="root";
String password="root";
	 con=DriverManager.getConnection(url,username,password);
	 
String email=(String)session.getAttribute("email");

	 ps=con.prepareStatement("select * from patientregister where email=?");
	 ps.setString(1,email);
	ResultSet rs=ps.executeQuery();
	
	while(rs.next()){

		
		%>
<tr><td><%=rs.getInt(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td>
<td><%=rs.getInt(5) %></td> <td><%=rs.getString(6) %></td>
<td><a href="update_patient_profile.jsp?id=<%=rs.getInt(1)%>">Update</a></td>
</tr>
<%} %>
</table>
</body>
</html> 