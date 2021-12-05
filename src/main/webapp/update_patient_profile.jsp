<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body bgcolor="wheat">
<br><br><br><br>
<center><h1>Welcome to Patient Home
<br><br><br>
<a href="patient_profile.jsp">Profile</a> |
<a href="apply_appointment.jsp">Apply Appointment</a> |
<a href="view_appointment.jsp">View Appointment</a> |
<a href="index.jsp">Logout</a>

</h1></center>
<br><br><br><br>
<%@page import="java.sql.*" %>
<%
int id=Integer.parseInt(request.getParameter("id"));
Connection con=null;
PreparedStatement ps=null;
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/appointmentapplication";
String username="root";
String password="root";
	 con=DriverManager.getConnection(url,username,password);
	 

	 ps=con.prepareStatement("select * from patientregister where patientid=?");
	 ps.setInt(1,id);
	ResultSet rs=ps.executeQuery();
	
	while(rs.next()){

		

%>
<form action="./patient_profile_update.jsp" method="get" align="center">
<input type="hidden" name="id" value=<%=rs.getInt(1) %>>
<input type="text" name="name" value=<%=rs.getString(2) %>>
<input type="text" name="email" value=<%=rs.getString(3) %> >
<input type="text" name="phone" value=<%=rs.getInt(5) %>>
<input type="text" name="address" value=<%=rs.getString(6) %> >
<input type="submit" value="Update">
</form>
<%} %>
</body>
</html>