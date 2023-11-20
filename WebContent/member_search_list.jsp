<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="layout/db_connect.jsp" %>

<%
int in_custno = Integer.parseInt(request.getParameter("custno"));

String sql="select custno, custname, phone, address, "
	+ "to_char(joindate, 'yyyy-dd-mm') joindate, "
	+ " decode(grade,'A','VIP','B','일반','C','직원') grade, city "
	+ " from member_tbl_02 "
	+ " where custno=" + in_custno;

Statement pstmt = conn.createStatement();
ResultSet rs = pstmt.executeQuery(sql);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/style.css?ver1.5.1">
	<title>쇼핑몰 회원관리</title>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>	
		
	<main id="section">
		<h3	class="title">홈쇼핑 회원 정보 조회</h3>
		<table class="table_line">
			<%
			if(rs.next()){
			%>	
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>회원전화</th>
					<th>회원주소</th>
					<th>가입일자</th>
					<th>고객등급</th>
					<th>도시코드</th>
				</tr>
				<tr align="center">
					<td><%= rs.getString("custno") %></td>
					<td><%= rs.getString("custname") %></td>
					<td><%= rs.getString("phone") %></td>
					<td><%= rs.getString("address") %></td>
					<td><%= rs.getString("joindate") %></td>
					<td><%= rs.getString("grade") %></td>
					<td><%= rs.getString("city") %></td>
				</tr>
				<tr>
					<td colspan="7" align="center">
						<input type="button" name="search" value="다시 조회" onclick="location.href='member_search.jsp'">
					</td>
				</tr>
				
			<% } else {	%>
				<p>회원번호<%= in_custno %>의 회원 정보가 없습니다.</p>
				<p>
					<input type="button" value="다시조회" onclick="location.href='member_search.jsp'">
				</p>
			<%} %>
			
		</table>
	</main>
		
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>