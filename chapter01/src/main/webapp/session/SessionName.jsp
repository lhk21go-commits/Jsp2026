<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 네임 페이지</title>
</head>
<body>
	<h2>세션 네임 페이지</h2>
	<%
		//String sessname = request.getParameter("name");
		//세션에 저장된 seName 데이터를 꺼내온다. : getAttribute()
		String seName2 = (String)session.getAttribute("seName");
	%>
	
	<%=seName2 %>님 반갑습니다.
	
	<a href="SessionName02.jsp">세션 다른 페이지로 이동</a>
	
</body>
</html>