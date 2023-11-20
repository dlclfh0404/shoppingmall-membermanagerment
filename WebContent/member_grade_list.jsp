<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%@ include file = "layout/db_connect.jsp" %>
<%
	String sql = "select "
			 +   "    case a.grade "
			 +   "     when 'A' then 'VIP' "
			 +   "     when 'B' then '일반' "
			 +   "     else '직원' end grade, "
			 +   "    b.city_name, count(*) count, grouping_id(a.grade, b.city_name) g_i "
			 +   " from member_tbl_02 a, city_code_tbl_02 b "
			 +   " where a.city = b.city "
			 +   " group by rollup(a.grade, b.city_name) "
			 +   " order by a.grade asc";
			 
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 ResultSet rs = pstmt.executeQuery();
			 
			 String city_name;
			 String grade;
			 int    g_i;
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>쇼핑몰 회원관리</title>
	<link rel="stylesheet" type="text/css" href="css/style.css?ver1.1.1">
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>	
	
	<main id="section">
		<h3	class="title">회원GRADE별_지역인원수</h3>
		<table class="table_line">
			<colgroup>
				<col width="20%">
				<col width="20%">
				<col width="20%">
			</colgroup>
			<thead>
			<tr>
				<th>GRADE</th>
				<th>지역명</th>
				<th>인원수</th>
			</tr>
			</thead>
			
			<% 
				while(rs.next()) {
					g_i        = rs.getInt("g_i");               //grouping_id 0일반 1소계 3전체계
					grade      = rs.getString("grade");          //Grade 명
					city_name  = rs.getString("city_name");      //City명
					if (g_i == 1) {
						city_name = "***합계";
					}
					if (g_i == 3) {
						grade = "전체합계";
						city_name = "";
					}
			%>
				<tr align="center">
					<td><%= grade %></td>
					<td><%= city_name %></td>
					<td><%= rs.getString("count") %></td>
				</tr>
			<% } %>
		</table>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>