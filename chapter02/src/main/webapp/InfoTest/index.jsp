<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량주행관리 프로그램</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	// 지금 현재는 pageName은 null
	// pageName은 반드시 null 처리 한다.
	String pageName = request.getParameter("page");
	
	// 메뉴를 클릭하지 않으면 기본화면인 index.jsp
	String contentPage = null;

	// 클릭한 메뉴의 page 이름을 section에 보여준다.
	if("carList".equals(pageName)){
		contentPage = "carList.jsp";
	}else if("driveForm".equals(pageName)){
		contentPage = "driveForm.jsp";
	}else if("driveList".equals(pageName)){
		contentPage = "driveList.jsp";
	}else if("deptStat".equals(pageName)){
		contentPage = "deptStat.jsp";
	}else if("carDrive".equals(pageName)){
		contentPage = "carDrive.jsp";
	}else if("companyStat".equals(pageName)){
		contentPage = "companyStat.jsp";
	}
%>
	<div id="wrap">
		<!-- header.jsp include하기 -->
		<%@ include file="header.jsp" %>
	
		
		<!-- section 부분의 HTML-->
		<section>
		<% if(contentPage != null){ 
		%>

			<jsp:include page="<%=contentPage %>"></jsp:include>
		<% }else { %>
		<h3>과정평가형 자격 CBQ</h3>
			<p>국가직무능력표준(NCS:National Competency Standards)으로 설계된
				교육·훈련교육과정을 이수한 후, 내부·외부 평가를 거쳐 일정 합격 기준을 충족하는
				교육·훈련생에게 국가기술자격을 부여하는 제도
			</p>
			<p class="bold">산업현장 중심의 교육평가로 더 커지는 능력</p>
			<p class="bold">알고 있는 것에 할 수 있는 것을 더하는</p>
			<p class="bold">과정평가형 자격은 </p>
			<p class="bold">현장 중심형 인재육성을 지원합니다.</p>
	
		<% } %>	
		
		</section>	
		
		<!-- footer.jsp include하기 -->
 		<%@ include file="footer.jsp" %>
		
	</div>
</body>
</html>