<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" import="java.sql.*" %>
<%@ include file="db_conn.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	String custno = request.getParameter("custno");
	String custname = "", phone = "", address = "", joindate = "", grade = "", city = "";
	
	try{
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		
		String sql = "select * from member_tbl_02 where custno=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(custno));
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			custname = rs.getString("custname");
			phone = rs.getString("phone");
			address = rs.getString("address");
			joindate = rs.getString("joindate");
			grade = rs.getString("grade");
			city = rs.getString("city");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(rs != null) rs.close();
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
		}catch(Exception e){};
	}

%>

<jsp:include page ="header.jsp" />
<section>
		<h2>회원목록조회/수정</h2>
		<form action="modProc.jsp" method="post" name="jform">
			<table class="form">
				<tr>
					<th>회원번호</th>
					<td><input type="text" name="custno" value="<%=custno %>" readonly></td>
				</tr> 		
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" value="<%=custname %>"></td>
				</tr> 		
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" value="<%=phone %>"></td>
				</tr> 		
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" value="<%=address %>"></td>
				</tr> 		
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" value="<%=joindate %>"></td>
				</tr> 		
				<tr>
					<th>고객등급[A:VIP, B:일반, C:직원]</th>
					<td>
						<select name="grade">
							<option value="">선택</option>
							<option value="A" <%="A".equals(grade)?"selected":"" %>>[A]VIP</option>
							<option value="B" <%="B".equals(grade)?"selected":"" %>>[B]일반</option>
							<option value="C" <%="C".equals(grade)?"selected":"" %>>[C]직원</option>
						</select>	 		
					</td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" value="<%=city %>"></td>
				</tr> 		
				<tr>
					<td colspan="2" class="btn=area">
						<input type="button" value="수 정" onclick="updateForm()" >
						<input type="button" value="조 회" onclick="location.href='memberForm.jsp'" >
					</td>
				</tr> 		
			</table>
		</form>
		</section>
	<script type="text/javascript">
		function updateForm(){
			let f = document.jform;
			
			if(f.custname.value  == ""){
				alert("회원성명 입력안됨")
				f.custname.focus();
				return;
			}
			if(f.phone.value  == ""){
				alert("회원주소 입력안됨")
				f.phone.focus();
				return;
			}
			if(f.address.value  == ""){
				alert("회원전화 입력안됨")
				f.address.focus();
				return;
			}
			if(f.joindate.value  == ""){
				alert("가입일자 입력안됨")
				f.custname.focus();
				return;
			}
			if(f.grade.value  == ""){
				alert("회원등급 입력안됨")
				f.custname.focus();
				return;
			}
			if(f.city.value  == ""){
				alert("도시 입력안됨")
				f.custname.focus();
				return;
			}
			
			//submit
			f.submit();
		}
	</script>
<jsp:include page="footer.jsp" />		