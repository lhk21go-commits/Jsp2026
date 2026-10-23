<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 전체 목록보기</title>
</head>
<body>
	<h2>개인 회원 정보보기</h2>
	<%
		request.setCharacterEncoding("utf-8");
		// MemberList.jsp에서 넘겨받음
		String id = request.getParameter("id");
	//DB 연동 시작--------------------------------------------------------------------------------

		Connection con = null;
		PreparedStatement pstmt = null;
		
		//select문 담는 ResultSet객체 변수 생성
		ResultSet rs = null;
		
		//DB접속 정보 설정
		String driver = "com.mysql.cj.jdbc.Driver";	//JDBC 드라이버
		// DB URL(스키마 이름 : jspdb)
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root";	//DB 계정
		String password = "1234";	//DB 비번
	%>	
		<table width="700" border="1">
			<tr height="50" align="center">
				<td>번호</td>
				<td>아이디</td>
				<td>이메일</td>
				<td>전화번호</td>
				<td>관심분야</td>
				<td>직업</td>
				<td>연령</td>
				<td>남기는 말</td>
			</tr>	
			
	<%		
	try{
		// 드라이버 로딩
		Class.forName(driver);
		// DB연결
		con = DriverManager.getConnection(url, user, password);
		
		// 한명에 관련된 정보 검색 select문 이용
		String sql = "select * from member where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		// resultSet 객체에 담기
		// DB의 회원정보 담기
		
		rs = pstmt.executeQuery();
		// rs의 담긴 정보를 추출하는 메소드 => rs.getString()
		if(rs.next()){
	%>
		<!-- select문으로 검색한 정보가 출력되는 <tr></tr> 필요 -->
		<tr height="50" align="center">
			<td><%= rs.getString("id")%></td>
			<td><%= rs.getString("email")%></td>
			<td><%= rs.getString("tel")%></td>
			<td><%= rs.getString("hobby")%></td>
			<td><%= rs.getString("job")%></td>
			<td><%= rs.getString("age")%></td>
			<td><%= rs.getString("info")%></td>
		</tr>
		<tr height="50">
				<td colspan="8" align="center">
						<button onclick="location.href='main.jsp?page=MemberUpdateForm&id=<%=id %>'">회원수정</button>
						<button onclick="location.href='main.jsp?page=MemberDeleteForm&id=<%=id %>'">회원삭제</button>
						<button onclick="location.href='main.jsp?page=MemberList'">목록보기</button>
						<button onclick="location.href='main.jsp?page=MemberJoin'">회원가입</button>
				</td>
		</tr>	
	</table>
	<a href="main.jsp?page=MemberList">회원 목록으로</a>
	<%  }
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			// 자원 종료한다.
			if(rs != null){ 
				try{
					rs.close();
				}catch(Exception e){}}
			if(con != null)	{
				try{
					con.close();
				}catch(Exception e){}}
			if(pstmt != null) {
				try{
					pstmt.close();
				}catch(Exception e){}}
		}
	
	%>

</body>
</html>				