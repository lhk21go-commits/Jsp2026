<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		/* DB 접속 정보 */
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root";
		String password = "1234";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sf02 = new SimpleDateFormat("yyyy-MM-dd");
		
	%>
	
	<div class="memberform">
		<h2>회원목록조회/수정</h2>
		<table>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
			
		<%
		try {
		    Class.forName(driver);
		    con = DriverManager.getConnection(url, user, password);
		    
		    String sql = "select * from member_tbl_02";
		    
		    pstmt = con.prepareStatement(sql);
		    rs = pstmt.executeQuery();
		    
		    while(rs.next()){
		 %>
		 		<tr>
		 			<td><a href="" method="get"><%=rs.getString("custno") %></a></td>
		 			<td><%=rs.getString("custname") %></td>
		 			<td><%=rs.getString("phone") %></td>
		 			<td><%=rs.getString("address") %></td>
		 			<td><%=sf02.format(sf.parseObject(rs.getString("joindate"))) %></td>
		 			<td><%=rs.getString("grade") %></td>
		 			<td><%=rs.getString("city") %></td>
	 			</tr>   	
		  <% } 
		  } catch (Exception e) {
		    e.printStackTrace();
		  } finally {
		    try {
		      if (rs != null) rs.close();
		      if (pstmt != null) pstmt.close();
		      if (con != null) con.close();
		    } catch (Exception e) { e.printStackTrace(); }
		  }
			
		%>
		
			
			
		</table>
	</div>
	
</body>
</html>