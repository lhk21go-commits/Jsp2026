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
<title>차량별주행조회</title>
<link rel="stylesheet" href="css/driveList.css">

</head>
<body>  
	<%
		request.setCharacterEncoding("utf-8");
	
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
	<h3>차량별주행조회</h3>
	<div class=search align="center">
		<form action="index.jsp">
			<select>
				<option value="">차량선택</option>
				<%
					try{
						Class.forName(driver);
						con = DriverManager.getConnection(url, user, password);
						
						String sql = "select CAR_NO, CAR_MODEL from tbl_car";
						
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						
						while(rs.next()){
				%>							
				<option value="<%=rs.getString("CAR_NO")%>">[<%=rs.getString("CAR_NO")%>]&nbsp;<%= rs.getString("CAR_MODEL") %></option>
			
					<%	}	%>
			</select>
			<%
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
			<input type="submit" value="조회" onclick="chooseCar()" >
		</form>
	</div><br>
	<section>
	<script type="text/javascript">
		function chooseCar(){
			
		}
	</script>
<%-- 		<% 
			if(contentPage != null){ 
		%>
			<jsp:include page="<%=contentPage %>"></jsp:include>
		<% } %> --%>
	</section>
	
	
</body>
</html>