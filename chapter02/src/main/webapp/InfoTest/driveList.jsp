<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주행내역 조회</title>
<link rel="stylesheet" href="css/driveList.css">
</head>
<body>  
	<%
		Connection con = null;
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root";
		String password = "1234";
	
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sf02 = new SimpleDateFormat("yyyy년MM월dd일");
		
		DecimalFormat df = new DecimalFormat("#,##0");
		DecimalFormat df02 = new DecimalFormat("￦#,##0");
		
		
	%>
	
	<table class="List">
	<h3>주행내역조회</h3>
	<table class="list" border="1">
		<tr>
			<th>주행일자</th>
			<th>차량번호</th>
			<th>모델</th>
			<th>출발km</th>
			<th>도착km</th>
			<th>부서명</th>
			<th>주유금액</th>
		</tr>
	<%
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "select d.DRV_DATE, d.CAR_NO, c.CAR_MODEL,	d.DRV_START, d.DRV_END,	p.DEPT_NAME, d.DRV_MONEY "
							+ "from tbl_drive d "
							+ "inner join tbl_car c on d.CAR_NO = c.CAR_NO "
							+ "inner join tbl_dept p on d.DEPT_CODE = p.DEPT_CODE "
							+ "order by d.CAR_NO asc";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
	%>
		<tr>
			<td><%= sf02.format(sf.parse(rs.getString("d.DRV_DATE"))) %></td>	
			<td><%= rs.getString("d.CAR_NO") %></td>	
			<td><%= rs.getString("c.CAR_MODEL") %></td>	
			<td><%= df.format(rs.getInt("d.DRV_START")) %></td>	
			<td><%= df.format(rs.getInt("d.DRV_END")) %></td>	
			<td><%= rs.getString("p.DEPT_NAME") %></td>	
			<td><%= df02.format(rs.getInt("d.DRV_MONEY")) %></td>	
		</tr>
	<%	
			}		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs != null){
				try{
					rs.close();
				}catch(Exception e){}
					
				}
			if(con != null){
				try{
					con.close();
				}catch(Exception e){}
					
				}
			if(pstmt != null){
				try{
					pstmt.close();
				}catch(Exception e){}
					
				}

		}
		
	
	
	
	%>	
		
	</table>
</body>
</html>