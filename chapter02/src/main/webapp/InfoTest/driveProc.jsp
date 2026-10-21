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
		String drvStart = request.getParameter("drvStart");
		String drvEnd = request.getParameter("drvEnd");
		String depCode = request.getParameter("depCode");
		String drvMoney = request.getParameter("drvMoney");
		String reStart = request.getParameter("reset");
		
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
			pstmt.setString(1, drvDate);
			pstmt.setString(2, carNo);
			pstmt.setInt(3, Integer.parseInt(drvStart));
			pstmt.setInt(4, Integer.parseInt(drvEnd));
			pstmt.setString(5, depCode);
			pstmt.setInt(6, Integer.parseInt(drvMoney));
			
			pstmt.executeUpdate();
		
		}catch(Exception e){
			e.printStackTrace();
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
		
		String msg = "";
		
		if(drvDate == null || drvDate.isEmpty()){
			msg = "주행일자가 입력되지 않았습니다!";
		}else if(carNo == null || carNo.isEmpty()){
			msg = "차량번호가 입력되지 않았습니다!";
		}else if(drvStart == null || drvStart.isEmpty()){
			msg = "출발Km가 입력되지 않았습니다!";
		}else if(drvEnd == null || drvEnd.isEmpty()){
			msg = "도착Km가 입력되지 않았습니다!";
		}else if(depCode == null || depCode.isEmpty()){
			msg = "부서코드가 입력되지 않았습니다!";
		}else if(drvMoney == null || drvMoney.isEmpty()){
			msg = "주유금액이 입력되지 않았습니다!";
		}
		
		if(msg != ""){
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
				<td><%=depCode%></td>
			</tr>
			<tr>
				<th>주유금액</th>
				<td><%=drvMoney+" " %>원</td>
			</tr>
		
		</table>
		<script type="text/javascript">
			alert("주행내역이 정상적으로 등록 되었습니다.");
			history.go(-1);
		</script>	
	
	
	<% } %>
</body>
</html>