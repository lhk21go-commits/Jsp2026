<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>

	<h2>주행내역등록</h2>
		<form action="driveProc.jsp" method="post">
		<table>
			<tr>
				<th>주행일자</th>
				<td>
					<input type="text" name="drvDate" placeholder="20230101">
				</td>
			</tr>	
			<tr>
				<th>차량번호</th>
				<td>
					<input type="text" name="carNo" placeholder="10가0001">
				</td>
			</tr>	
			<tr>
				<th>출발Km</th>
				<td>
					<input type="text" name="drvStart"  placeholder="km">
				</td>
			</tr>	
			<tr>
				<th>도착Km</th>
				<td>
					<input type="text" name="drvEnd"  placeholder="km">
				</td>
			</tr>	
			<tr>
				<th>부서코드</th>
				<td>
					<select name="depCode">
						<option >부서</option>
						<option value = "10">[10]영업부</option>
						<option value = "20">[20]총무부</option>
						<option value = "30">[30]구매부</option>
						<option value = "40">[40]개발부</option>
					</select>
				</td>
			</tr>	
			<tr>
				<th>주유금액</th>
				<td>
					<input type="text" name="drvMoney"  placeholder="원">
				</td>
			</tr>	
		</table>
		<input type="submit" value="주행내역등록">
		<input type="reset" value="다시쓰기">
		
		
		</form>

