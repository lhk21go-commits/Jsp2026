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
	<%
		request.setCharacterEncoding("utf-8");
		String pageName = request.getParameter("page");
		String contentPage = null;
		
		if("joinForm".equals(pageName)){
			contentPage = "joinForm.jsp";
		}else if("memberForm".equals(pageName)){
			contentPage = "memberForm.jsp";
		}else if("saleForm".equals(pageName)){
			contentPage = "saleForm.jsp";
		}
	
	
	%>


	<div class=container>
		<%@ include file="header.jsp" %>
		<%@ include file="nav.jsp" %>
		
		<section>
		<% if(contentPage != null){ %>
			<jsp:include page="<%= contentPage %>"></jsp:include>
		<% }else { %>
			<h2>쇼핑몰회원관리 프로그램</h2>
			<p>쇼핑몰 회원정보와 회원매출 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.</p>
			<p>프로그램 작성 순서</p>
				<ul style="list-style: none">
					<li>1. 회원정보 테이블을 생성한다.</li>
					<li>2. 매출정보 테이블을 생성한다.</li>
					<li>3. 회원정보, 매출정보 테이블에서 제시된 문제의 참조데이터를 추가 생성한다.</li>
					<li>4. 회원정보 입력 화면 프로그램을 작성한다.</li>
					<li>5. 회원정보 조회 프로그램을 작성한다.</li>
					<li>6. 회원매출정보 조회 프로그램을 작성한다.</li>
				
				</ul>
		<% } %>
		</section>	
		<%@ include file="footer.jsp" %>
	
	</div>


</body>
</html>