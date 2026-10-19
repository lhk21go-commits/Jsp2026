<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
	<%
		/* 스크립트릿은 자바코드만 가능 */
		request.setCharacterEncoding("utf-8");
	
		//RequestJoin.jsp의 입력된 정보를 Request 객체를 통해 
		//정보를 꺼내오세요
		
		String id = request.getParameter("id");
		String pass= request.getParameter("pass");
		String passchk = request.getParameter("passchk");	//비밀번호 확인용
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		/* 체크박스는 동시에 여러 개를 선택해야 하므로 배열에 담는다.  */
		String[] hobby = request.getParameterValues("hobby");
		String job = request.getParameter("job");
		String age = request.getParameter("age");
		String info = request.getParameter("info");
		
		String msg = "";
		/* 텍스트 입력 창은 비워두고 제출하면 null이 아니고 ""(빈 문자열)이 넘어오고,
			체크박스, 라디오 버튼은 선택하지 않으면 null로 넘어온다.
		*/
		
		if(id == null || id.isEmpty()){
			msg = "아이디를 입력하세요";	
		
		}else if(pass == null || pass.isEmpty()){
			msg = "비밀번호를 입력하세요";
		}else if(passchk == null || passchk.isEmpty()){
			msg = "비밀번호 확인를 확인하세요";
		}else if(!pass.equals(passchk)){
			msg = "비밀번호가 틀립니다.";
		}else if(email == null || email.isEmpty()){
			msg = "이메일을 입력하세요";
		}else if(tel == null || tel.isEmpty()){
			msg = "전화번호를 입력하세요";
		}else if(hobby == null || hobby.length == 0){
			msg = "관심분야를 한 개 이상 선택하세요";
		}else if(job == null || job.isEmpty()){
			msg = "직업을 선택하세요";
		}else if(age == null){
			msg = "연령을 선택하세요";
		}
			/* msg 예외 처리 할 것  */
		if(msg != ""){
			
	%>
	<!-- 
		자바스크립트 객체 종류
		1. 코어객체
		2. DOM 객체
		3. BOM객체 ==> 브라우저에서 사용하는 객체
		
			history객체는 브라우저가 현재 탭이나 창에서 방문했던 웹페이지들의 기록(Session History)을 관리하고 제어하는 객체이다.
			
			*history 객체의 메소드 종류
			 	- history.back(): 바로 이전 페이지로 이동(뒤로가기)
			 	- history.forward(): 바로 다음 페이지로 이동(앞으로가기)
			 	- history.go(n): 지정한 상대적 위치만큼 이동
			 	 -> history.go(1)은 앞으로 가기
			 	 -> history.go(0)은 현재페이지
			 	 -> history.go(-1)은 뒤로 가기
	 -->
	<script type="text/javascript">
			alert("<%= msg %>");
			history.go(-1;)
	</script>			

	<%}else {
		
	} %>
	<!-- 테이블로 화면 출력 -->
	<div class=""joinContainer">
	<h2>회원가입 출력정보</h2>
	<table width="500" border="1">
		<tr height="50">
			<td>id</td>
			<td><%= id %></td>
		</tr>
		<tr>
			<td>pass</td>
			<td><%= pass %></td>
		</tr>
		<tr>
			<td>passchk</td>
			<td><%= passchk %></td>
		</tr>
		<tr>
			<td>tel</td>
			<td><%= tel %></td>
		</tr>
		<tr>
			<td>email</td>
			<td><%= email %></td>
		</tr>
		<tr>
			<td>hobby</td>
			<td><% for(int i=0; i<hobby.length; i++){ 
					out.write(hobby[i]+" ");
				 } %>
			</td>
			
		</tr>
		<tr>
			<td>job</td>
			<td><%= job %></td>
		</tr>
		<tr>
			<td>age</td>
			<td><%= age %></td>
		</tr>
		<tr>
			<td>info</td>
			<td><%= info %></td>
		</tr>
		
	
	
	</table>
	</div>
	<% } %>
	
	
</body>
</html>