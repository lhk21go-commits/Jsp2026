<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
</head>
<body>
<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		
		/* 이메일, 전하번호만 수정하려고 함 */
		String email = "";
		String tel = "";
		/* 넘겨온 아이디가 DB와 일치하는지 체크하는 체크키 */
		boolean idChk = false;
		

		Connection con = null;
		PreparedStatement pstmt = null;
		
		//select문 담는 ResultSet객체 변수 생성
		ResultSet rs = null;
		int count = 0;	//회원수 세는 변수
		
		//DB접속 정보 설정
		String driver = "com.mysql.cj.jdbc.Driver";	//JDBC 드라이버
		// DB URL(스키마 이름 : jspdb)
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root";	//DB 계정
		String password = "1234";	//DB 비번
		
		System.out.println("1번, try 전");
		try{
			//드라이버 연결
			Class.forName(driver);
			//DB연결
			con = DriverManager.getConnection(url, user, password);
			//쿼리문 작성
			String sql = "select id, email, tel from member where id=?";
			pstmt = con.prepareStatement(sql);	
			// sql문의 ?에 대응하는 부분
			pstmt.setString(1, id);
			// select문은 ResultSet() 객체에 담는다.
			rs = pstmt.executeQuery();
			
			// 현재 rs 는 id정보가 같ㅇ느 한 사람의 정보만 가진다.
			if(rs.next()){
				idChk = true;
				email = rs.getString("email");
				tel = rs.getString("tel");
			}
			
		}catch(Exception e){
		System.out.println("1번, catch 안");
			e.printStackTrace();
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

	<h3> 개인 회원정보 수정</h3>
	<form action="MemberUpdateProc.jsp" method="post">
	
		<input type="hidden" name="id" value="<%=id %>">
		<table width="400" border="1">
			<tr height="50">
				<td align="center" width=150">아이디</td>
				<!-- 넘거받은 id는 수정대상이 아니다. -->
				<td width="250"><%=id %></td>
			</tr>
			<tr height="50">
				<td align="center" width=150">이메일</td>
				<td width="250">
					<input type="email" name="email" value="<%=email %>">
				</td>
			</tr>
			<tr height="50">
				<td align="center" width=150">전화</td>
				<td width="250">
					<input type="tel" name="tel" value="<%=tel %>">
				</td>
			</tr>
			<tr height="50">
				<td align="center" width=150">패스워드</td>
				<td width="250">
					<input type="password" name="pass2" placeholder="본인 비밀번호를 입력하세요">
				</td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
					<input type="submit" value="회원 수정하기">&nbsp;
					<input type="button" value="회원 전체보기" onclick="location.href='main.jsp?page=MemberList'">&nbsp;
				</td>
			</tr>
		
		</table>
	
	
	</form>
</body>
</html>