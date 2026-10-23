<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 삭제</title>
</head>
<body>
<%
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String pass2 = request.getParameter("pass2");
		
		String msg = null;
		boolean idChk = false;
		boolean passChk = false;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		//DB접속 정보 설정
		String driver = "com.mysql.cj.jdbc.Driver";	//JDBC 드라이버
		// DB URL(스키마 이름 : jspdb)
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root";	//DB 계정
		String password = "1234";	//DB 비번
		
		//select문 담는 ResultSet객체 변수 생성
		ResultSet rs = null;

		// 비밀번호의 입력여부를 판단
		if(pass2 == null || pass2.trim().isEmpty()){
			msg = "비밀번호를 확인하세요";
		}else {

			try{
				//드라이버 연결
				Class.forName(driver);
				//DB연결
				con = DriverManager.getConnection(url, user, password);
				//쿼리문 작성
				String sql = "select id from member where id=? and pass=?";
				pstmt = con.prepareStatement(sql);	
				// sql문의 ?에 대응하는 부분
				pstmt.setString(1, id);
				pstmt.setString(2, pass2);
				// select문은 ResultSet() 객체에 담는다.
				rs = pstmt.executeQuery();
				
				// 현재 rs 는 id정보가 같은 한 사람의 정보만 가진다.
				if(rs.next()){
					// 자원반납 위 조회에서 사용한 pstmt를 반납
					pstmt.close();
					rs.close();
					
					// 2)비밀번호 확인이 종료되면 삭제하기
					// update 테이블명 set 수식(a=b) where 조건
					String sql2 = "delete from member where id=?" ;
					pstmt = con.prepareStatement(sql2);
					pstmt.setString(1, id);
					

					// delete가 실행되면 1이 된다. 실행되지 않으면 0
					
					int result = pstmt.executeUpdate();
					if(result > 0){
						msg = "삭제 성공";
					}else {
						msg = "삭제 실패";
					}
					
				}else{
					msg = "패스워드가 일치하지 않습니다";
				}
				
			}catch(Exception e){
				e.printStackTrace();
				msg = "삭제 오류, DB 확인 요망";
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
		}
		

%>
	<script type="text/javascript">
		alert("<%=msg %>");
	<% if(passChk){ %>
		location.href="main.jsp?page=MemberList";
	<% }else{ %>
		history.go(-1);
	<% } %>
	</script>
</body>
</html>