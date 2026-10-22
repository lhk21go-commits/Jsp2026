<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주행내역등록 처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String drvDate = request.getParameter("drvDate");
		String carNo = request.getParameter("carNo");
		/* String 타입의 정수로 데이터 변환 2가지 방법으로  */
		String drvStart = request.getParameter("drvStart");
		String drvEnd = request.getParameter("drvEnd");
		String deptCode = request.getParameter("deptCode");
		String drvMoney = request.getParameter("drvMoney");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root";
		String password = "1234";
		
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "insert into tbl_drive values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			// pstmt 객체에 입력받은 값을 저장하여 sql의 insert문이 실행되도록 한다.
			pstmt.setString(1, drvDate);
			pstmt.setString(2, carNo);
			pstmt.setInt(3, Integer.parseInt(drvStart));
			pstmt.setInt(4, Integer.parseInt(drvEnd));
			pstmt.setString(5, deptCode);
			pstmt.setInt(6, Integer.parseInt(drvMoney));
			
			pstmt.executeUpdate();
	%>	<!-- 정상 등록시 처리  -->
		<script type="text/javascript">
			alert("주문내역 정상 등록됨");
			location.href = "index.jsp";
		</script>
	<%
		}catch(Exception e){
			e.printStackTrace();
	%> <!-- 등록 실패시 처리  -->
		<script type="text/javascript">
			alert("등록 실패");
			history.go(-1);
		</script>
	<%			
		}finally{
			if(pstmt != null){
				try{
					pstmt.close();
				}catch(Exception e){}
			}
						if(con != null){
				try{
					con.close();
				}catch(Exception e){}
			}
		}
		
		String msg = null;
		
		if(drvDate == null || drvDate.trim().isEmpty()){
			msg = "주행일자가 입력되지 않았습니다!";
		}else if(carNo == null || carNo.trim().isEmpty()){
			msg = "차량번호가 입력되지 않았습니다!";
		}else if(drvStart == null || drvStart.trim().isEmpty()){
			msg = "출발Km가 입력되지 않았습니다!";
		}else if(drvEnd == null || drvEnd.trim().isEmpty()){
			msg = "도착Km가 입력되지 않았습니다!";
		}else if(deptCode == null || deptCode.trim().isEmpty()){
			msg = "부서코드가 입력되지 않았습니다!";
		}else if(drvMoney == null || drvMoney.trim().isEmpty()){
			msg = "주유금액이 입력되지 않았습니다!";
		}
		
		if(msg != null){
	%>
		<script type="text/javascript">
			alert("<%= msg %>");
			history.go(-1);
		</script>
	<% }else { %>	
		<table>
			<tr>
				<th>주행일자</th>
				<td><%=drvDate %></td>
			</tr>
			<tr>
				<th>차량번호</th>
				<td><%=carNo%></td>
			</tr>
			<tr>
				<th>출발Km</th>
				<td><%=drvStart+" "%>km</td>
			</tr>
			<tr>
				<th>도착Km</th>
				<td><%=drvEnd+" "%>km</td>
			</tr>
			<tr>
				<th>부서코드</th>
				<td><%=deptCode%></td>
			</tr>
			<tr>
				<th>주유금액</th>
				<td><%=drvMoney+" " %>원</td>
			</tr>
		
		</table>
	
	<% } %>
</body>
</html>