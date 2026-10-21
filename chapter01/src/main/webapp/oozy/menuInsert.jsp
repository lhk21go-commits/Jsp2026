<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="css/menuInsert.css">

    <div class="menuInsert">
    <h3>메뉴등록</h3>
    <form action="menuInsertProc.jsp">
    	<div class="wrap">
		   	<table border="1">
		   		<tr>
		   			<td>메뉴명</td>
		   			<td><input type="text" name="menuName">예)콜드브루 라떼</td>
		   		</tr> 
		   		<tr>
		   			<td>분류</td>
		   			<td>
		   				<select name="section">
		   					<option value="">분류</option>
		   					<option value="10">[10]COFFEE</option>
		   					<option value="20">[20]COFFEE</option>
		   					<option value="30">[30]COFFEE</option>
		   					<option value="40">[40]COFFEE</option>
		   				</select>
					</td>
		   		</tr> 
		   		<tr>
		   			<td>가격</td>
		   			<td><input type="text" name="price"> 원</td>
		   		</tr> 
		   		<tr>
		   			<td>판매상태</td>
		   			<td><input type="radio" name="sales" value="판매중">판매중
		   			<input type="radio" name="sales" value="SEASON OUT">SEASON OUT
		   			</td>
		   		</tr> 
		   		<tr>
		   			<td>설명</td>
		   			<td><input type="textarea" rowspan="4" colspan="30" name="explanation"></td>
		   		</tr>
   			</table>
		   			<input type="submit" value="메뉴등록">
		   			<input type="reset" value="다시쓰기">
   		</div>
    </form>
    
    </div>