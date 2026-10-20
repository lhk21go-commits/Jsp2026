<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>oozy coffee</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String contentPage = "home.jsp";
		
		String pagName = request.getParameter("page");
		
		if("menuList".equals(pagName)){
			contentPage = "menuList.jsp";
		}else if("menuInsert".equals(pagName)){
			contentPage = "menuInsert.jsp";
		}
	
	%>
	<div id="wrap">
		<div id="top">
			<%@ include file="header.jsp" %>
			<%@ include file="nav.jsp" %>
		</div>
		<section>
			<jsp:include page="<%=contentPage %>"></jsp:include>	
		
		</section>
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>