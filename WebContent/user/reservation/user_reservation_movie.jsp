<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
	String id = (String) request.getSession().getAttribute("ID");
	request.getSession().setAttribute("ID", id);

	String str = "";
	Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/movie_reservation";
		String dbId = "root";
		String dbPass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String sql = "select * from movie";
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		int cnt = 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>select movie</title>
</head>
<body>
	<table width="30%">
	<tr>
		<td></td>
		<td>Title</td>
		<td></td>
	</tr>
	<%
		while(rs.next()) {
			%>
				<tr>
					<td><%=cnt++ %></td>
					<td><%=rs.getString("title") %></td>
					<td><a href="user_reservation_schedule.jsp?Movie_Number=<%=rs.getString("movie_number")%>">select</a></td>
				</tr>
			<%
		}
	%>
	</table>
</body>
</html>
<%
}catch(Exception e) {
		e.printStackTrace();
		str = "Fail";
	}
%>
