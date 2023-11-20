<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/db_connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리</title>
<link rel="stylesheet" href="css/style.css?ver1.1.1.4">
<script type="text/javascript">
	function cheakValue() {
		if(document.data.custno.value ==""){
			alert("회원번호를 입력하세요.");
			document.data.custno.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>


	<main id="section">
		<h3 class="title">홈쇼핑 회원 정보 조회</h3>
		<form name="data" action="member_search_list.jsp" method="post" onsubmit="return cheakValue()">
			<table class="table_line">
				<tr>
					<th>회원번호입력</th>
					<td><input type="text" name="custno" autofocus></td>
				</tr>
				
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="취소" onclick="location.href='member_list.jsp'">
						<input type="submit" value="조회">
					</td>
				</tr>
			</table>
		</form>
	</main>

	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
	<%
	/* rs.close();
	pstmt.close(); */
	conn.close();
	%>
</body>
</html>
