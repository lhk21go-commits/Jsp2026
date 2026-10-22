<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <link rel="stylesheet" href="css/driveList.css">

	<h3>주행내역등록</h3>
		<form action="driveProc02.jsp" name="driveFrm" method="post">
		<table class="form">
			<tr>
				<th>주행일자</th>
				<td>
					<label><input type="text" name="drvDate" >예)20230101</label>
				</td>
			</tr>	
			<tr>
				<th>차량번호</th>
				<td>
					<label><input type="text" name="carNo" >예)10가0001</label>
				</td>
			</tr>	
			<tr>
				<th>출발Km</th>
				<td>
					<label><input type="text" name="drvStart"  >km</label>
				</td>
			</tr>	
			<tr>
				<th>도착Km</th>
				<td>
					<label><input type="text" name="drvEnd" >km</label>
				</td>
			</tr>	
			<tr>
				<th>부서코드</th>
				<td>
					<select name="deptCode">
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
					<label><input type="text" name="drvMoney" >원</label>
				</td>
			</tr>	
		</table>
		<input type="button" value="주행내역등록" onclick="chkform()">
		<input type="button" value="다시쓰기" onclick="resetform()">
		
		</form>
		<!-- 자바스크립트를 이용한 유효성 검사하기  -->
		<script type="text/javascript">
			function chkform(){
				let f = document.driveFrm;
				if(f.drvDate.value == ""){
					alert("주행일자입력 안됨");
					/* 주행입력에 포커스(커서 이동)하는 방법 */
					f.drvDate.focus();
					return;
				}				
				if(f.carNo.value == ""){
					alert("차량번호입력 안됨");
					/* 주행입력에 포커스(커서 이동)하는 방법 */
					f.carNo.focus();
					return;
				}				
				if(f.drvStart.value == ""){
					alert("출발km입력 안됨");
					/* 주행입력에 포커스(커서 이동)하는 방법 */
					f.drvStart.focus();
					return;
				}				
				if(f.drvEnd.value == ""){
					alert("도착km입력 안됨");
					/* 주행입력에 포커스(커서 이동)하는 방법 */
					f.drvEnd.focus();
					return;
				}				
				if(f.deptCode.value == ""){
					alert("부서입력 안됨");
					/* 주행입력에 포커스(커서 이동)하는 방법 */
					f.deptCode.focus();
					return;
				}				
				if(f.drvMoney.value == ""){
					alert("요금입력 안됨");
					/* 주행입력에 포커스(커서 이동)하는 방법 */
					f.drvDate.focus();
					return;
				}
				
				/* 아직 submit이 되지 않음 */
				f.submit();
			}	
		
			function resetform(){
				let f = document.driveFrm;
				alert("정보를 지우고 다시 입력");
				f.reset();
				f.drvDate.focus();
			}		
		
		</script>
		
