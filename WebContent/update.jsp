<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="layout/db_connect.jsp"%>
<%
	String sql = "select custno, custname, phone, address,"
			   + " to_char(joindate, 'yyyy-mm-dd') joindate, grade, city"
			   + " from member_tbl_02 "
			   + " where custno =" + request.getParameter("custno");
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쇼핑물 회원관리</title>
	<link rel="stylesheet" href="./css/style.css?ver1.1.15">
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	
	<main id="section">
		<h2 class="title">홈쇼핑 회원 정보 수정</h2>
		<form name="data" method="post" action="update_p.jsp" onsubmit="return checkValue()">
			<table class="table_line">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" value="<%= rs.getString("custno") %>" readonly></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" value="<%= rs.getString("custname") %>" placeholder="성명을 입력해주세요" autofocus></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" value="<%= rs.getString("phone") %>" placeholder="000-0000-0000" required></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" value="<%= rs.getString("address")%>"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" value="<%= rs.getString("joindate") %>" required></td>
				</tr>
				<tr>
					<th>고객등급(A-VIP B-일반 C-직원)</th>
					<td><input type="text" name="grade" value="<%= rs.getString("grade")%>"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" value="<%= rs.getString("city") %>"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정">
						<input type="button" value="조회" onclick="location.href='member_list.jsp'">
						<input type="button" value="삭제" onclick="location.href='delete.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</main>
	
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>