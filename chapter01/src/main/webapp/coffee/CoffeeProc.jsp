<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coffee 메뉴 처리</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); 
	// 자리수에 맞게 쉼표 처리
	DecimalFormat de = new DecimalFormat("#,##0");
	
	String menu = request.getParameter("menu");
	int price = 0; //커피가격
	int total = 0;	//총금액
	
	// Request 객체는 반환타입이 String => 파싱으로 정수변환	
	request.getParameter("quantity");
	int quantity = Integer.parseInt(request.getParameter("quantity")); 
	int inputMoney = Integer.parseInt(request.getParameter("inputMoney"));
	
	if(menu.equals("아메리카노")){
		price = 3000;
	}else if(menu.equals("카페라떼")){
		price = 3300;
	}else if(menu.equals("에스프레소")){
		price = 2500;
	}else if(menu.equals("얼그레이티")){
		price = 3500;
	}
	
	total = price * quantity;
	int change = inputMoney - total ;
	%>
	
	<h2>주문계산 결과</h2>
	<ul>
		<li>커피종류:<%=menu%></li>
		<li>1개 가격:<%=de.format(price)%></li>
		<li>수량:<%=de.format(quantity)%></li>
		<li>총 금액:<%=de.format(total)%></li>
		<li>입금액:<%=de.format(inputMoney)%></li>
		<li>거스름돈:<%=de.format(change)%></li>
		
	</ul>
			
</body>
</html>
