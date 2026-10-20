<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coffee 메뉴</title>
</head>
<body>
	<div class="container">
		<h2>커피메뉴</h2>
		<form action="CoffeeProc.jsp" method="get">
<!-- 			<ul>
				<li>
					<input type="radio" name="coffee" id="ame" value="아메리카노">
					<label for="ame">아메리카노 (3000원)</label>
				</li>		
			</ul> -->
			<input type="radio" name="menu" value="아메리카노" id="아메리카노">
			<label for="아메리카노">아메리카노 (3000원)</label><br>
			<input type="radio" name="menu" value="카페라떼" id="카페라떼">
			<label for="카페라떼">카페라떼 (3300원)</label><br>
			<input type="radio" name="menu" value="에스프레소" id="에스프레소">
			<label for="에스프레소">에스프레소 (2500원)</label><br>
			<input type="radio" name="menu" value="얼그레이티" id="얼그레이티">
			<label for="얼그레이티">얼그레이티 (3500원)</label><br>
			<label for="quantity" >수량:</label>
			<input type="number" id="quantity" name="quantity" width="200"><br>
			<label for="inputMoney">입금액:</label>
			<input type="number" id="inputMoney" name="inputMoney" width="200">
			<!-- <button>주문처리</button> -->
			<input type="submit" value="주문처리">
		</form>			
	</div>

</body>
</html>