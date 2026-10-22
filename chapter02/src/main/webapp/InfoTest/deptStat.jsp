<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%@ page import="java.sql.*" %>
 
 <!-- 공통내용을 파일로 작성 후 include -->   
 <%--    <%@ include file="db_conn.jsp" %> --%>
    
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
	
	<h3>(부서별)주행통계</h3>
 	<table class="list" border="1">
		<tr>
			<th>부서코드</th>
			<th>부서명</th>
			<th>총운행거리</th>
			<th>총주유금액</th>
		</tr>
	<%
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "select p.DEPT_CODE, p.DEPT_NAME, sum(d.DRV_END-d.DRV_START) as t, sum(d.DRV_MONEY) as m "
						+ "from tbl_drive d "
						+ "inner join tbl_dept p on d.DEPT_CODE = p.DEPT_CODE "
						+ "group by p.DEPT_CODE ";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
	%>
		<tr>
			<td><%= rs.getString("p.DEPT_CODE") %></td>	
			<td><%= rs.getString("p.DEPT_NAME") %></td>	
			<td><%= df.format(rs.getInt("t")) %></td>	
			<td><%= df.format(rs.getInt("m")) %></td>	
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



