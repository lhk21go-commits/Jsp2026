<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String menuName = request.getParameter("menuName");
	String section = request.getParameter("section");
	String price = request.getParameter("price");
	String sales = request.getParameter("sales");
	String explanation = request.getParameter("explanation");
	String msg = "";

	if(menuName == null || menuName.isEmpty()){
		msg = "메뉴명이 입력되지 않았습니다!"; 
	}else if(section == null || section.isEmpty()){
		msg = "분류가 선택되지 않았습니다!";
	}else if(price == null || price.isEmpty()){
		msg = "가격이 입력되지 않았습니다!";
	}else if(sales == null || sales.isEmpty()){
		msg = "판매상태가 선택되지 않았습니다!";
	}else if(explanation == null || explanation.isEmpty()){
		msg = "설명이 입력되지 않았습니다!";
	}
	
	if(msg != ""){	%>
	<script type="text/javascript">
		alert("<%=msg%>");
		history.go(-1);
	</script>
	<%		
	}else {
	%>
    <div class="container">
    	<h3>메뉴등록 확인</h3>
    		<table border="1">
    			<tr>
    				<th>메뉴명</th>
    				<td><%=menuName %></td>
    			</tr>
    			<tr>
    				<th>분류</th>
    				<td><%=section %></td>
    			</tr>
    			<tr>
    				<th>가격</th>
    				<td><%=price %></td>
    			</tr>
    			<tr>
    				<th>판매상태</th>
    				<td><%=sales%></td>
    			</tr>
    			<tr>
    				<th>설명</th>
    				<td><%=explanation%></td>
    			</tr>
    			
    		</table>
    
    </div>
    
    <% } %>