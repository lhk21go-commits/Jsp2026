<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<jsp:include page="header.jsp" />
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
		
		DecimalFormat df = new DecimalFormat("#,##0");
		DecimalFormat df02 = new DecimalFormat("￦#,##0");
	%>
	
	<section>
		<h2 align="center">회원매출조회</h2>
		<table class="form">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
	<%
		String grade = "";
		String gradeName = "";
			
		try {
		    Class.forName(driver);
		    con = DriverManager.getConnection(url, user, password);
		    
		    String sql = "select mb.custno, mb.custname, mb.grade, "
		    		+"sum(mn.price) as p from member_tbl_02 mb "
		    		+"inner join money_tbl_02 mn on mb.custno = mn.custno "
		    		+"group by mb.custno order by sum(mn.price) desc ";
		    
		    pstmt = con.prepareStatement(sql);
		    rs = pstmt.executeQuery();
		    
		    while(rs.next()){
		    	grade = rs.getString("mb.grade");
		    	if(grade.equals("A")) gradeName = "VIP";
		    	else if(grade.equals("B")) gradeName = "일반";
		    	else  gradeName = "직원";
	 %>
		 		<tr>
		 			<td><%=rs.getInt("mb.custno") %></a></td>
		 			<td><%=rs.getString("mb.custname") %></td>
		 			<td><%=gradeName %></td>
		 			<td><%=df02.format(rs.getInt("p")) %></td>
		 		 <%-- <%=String.format("\%,d",rs.getInt("P")) %>도 가능  --%>
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
	
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>