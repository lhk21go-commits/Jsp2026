<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량조회</title>
<link rel="stylesheet" href="css/driveList.css">
</head>
<body>
	<%
		Connection con = null;
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root";
		String password = "1234";
		
		// 자바에서 날짜 형식변경하는 클래스
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sf02 = new SimpleDateFormat("yyyy년MM월dd일");
		
	%>
	<h3>차량조회</h3>
	<table class="list" width="700" border="1">
		<tr height="40" align="center"> 
			<th>차량번호</th>
			<th>모델</th>
			<th>제조사</th>
			<th>구매일</th>
		</tr>
	<%
		try{
			// driver 로드
			Class.forName(driver);
			// DB 연결
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "select * from TBL_CAR";
			pstmt = con.prepareStatement(sql);
			//select문 실행은 executeQuery()
			// select문 ResultSet() 객체에 담는다.
			rs = pstmt.executeQuery();
			
			while(rs.next()){	//rs.next()메소드는 다음이 존재하면 true
	%>
			<tr height="40">
				<td align="center"><%= rs.getString("CAR_NO") %></td>					
				<td align="center"><%= rs.getString("CAR_MODEL") %></td>					
				<td align="center"><%= rs.getString("CAR_COMPANY") %></td>					
				<!-- 
				format()은 Date형식이고, DB는 String이기 때문에
				parse() : String -> Date => Date객체
				format() : Date -> String => Date객체 => 2023년01월01일
				 -->
				<td align="center"><%= sf02.format(sf.parse(rs.getString("CAR_DATE"))) %></td>
			</tr>					
		<%	}
			
		}catch(Exception e){
			e.printStackTrace();
			out.println("DB fail");
		}finally{
			if(rs != null){
				try{
				rs.close();
				}catch(Exception e){}
			}
			if(con != null){
				try{
				con.close();
				}catch(Exception e){}
			}
			if(pstmt != null){
				try{
				pstmt.close();
				}catch(Exception e){}
			}
		}
	%>

	</table>
</body>
</html>