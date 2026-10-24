<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
<!-- <link rel="stylesheet" href="css/main.css"> -->
</head>
<body>
	
	
	<div class="joinform">
		<h2>홈쇼핑 회원등록</h2>
		<table>
			<tr>
				<th>회원번호(자동생성)</th>
				<td><input type="text" name="join"></td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type="text" name="join"></td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input type="text" name="join"></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input type="text" name="join"></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input type="text" name="join">예)20151202</td>
			</tr>
			<tr>
				<th>고객등급[A:VIP, B:일반, C:직원]</th>
				<td>
					<select>
						<option name="join" value="">선택</option>					
						<option name="join" value="vip">VIP</option>					
						<option name="join" value="일반">일반</option>					
						<option name="join" value="직원">직원</option>					
					</select>
				</td>
			</tr>
			<tr>
				<th>도시코드</th>
				<td><input type="text" name="join"></td>
			</tr>
		</table>
	</div>
</body>
</html>