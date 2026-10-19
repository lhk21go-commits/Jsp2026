<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 나는 forward 페이지</h2>
	
	 <%
	 	request.setCharacterEncoding("utf-8");
	 
	 	// request의 내장 객체에 getParameter("name")메소드를 
	 	// 이용하여 form에 입력한 정보를 꺼내올 수 있다.
	 	// 단, request.getParameter("name")의 반환 데이터타입은 String이다
	 	
	 	// id라는 name을 가진 input의 정보를 getParameter()를 통해 꺼내서
	 	// id변수에 저장한다.
	 	String id = request.getParameter("id");
	 	String pass = request.getParameter("pass");
	 %>
	 	
	 	<h3>당신의 아이디는 <%= id %>이고, 비밀번호는 <%= pass %>이다.</h3>

	 	<a href="RequestForward.jsp">다음페이지</a>
	
</body>
</html>