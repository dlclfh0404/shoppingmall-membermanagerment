<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%@ include file="layout/db_connect.jsp" %>    
<%
  String sql="select mb.custno, mb.custname, "
           + " case when grade = 'A' then 'VIP' "
           +       "when grade = 'B' then '일반' else '직원' end grade, "
           + " sum(mo.price) price "
           + " from member_tbl_02 mb, money_tbl_02 mo "
           + " where mb.custno = mo.custno "
           + " and mo.price is not null "
           + " group by mb.custno , mb.custname, mb.grade "
           + " order by sum(mo.price) desc";
  PreparedStatement pstmt = conn.prepareStatement(sql);
  ResultSet rs = pstmt.executeQuery();
 
%>    

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/style.css?ver=1.1.2">
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
         <h3 class="title">회원매출조회</h3>
        <div class="scroll">
        <table class="table_line">
            <tr>
                <th>회원번호</th>
                <th>회원성명</th>
                <th>고객등급</th>
                <th>매출</th>
            </tr>
           <%  int i=0;
               while(rs.next()){ %>
            <tr align="center">
                <td><%= rs.getString("custno")%></td>
                <td><%= rs.getString("custname") %></td>
                <td><%= rs.getString("grade") %></td>
                <td><%= rs.getString("price") %></td>
              </tr>
             
           <%         i += Integer.parseInt(rs.getString("price"));
               } %>
               
               <tr>
                   <td colspan="3">총합</td>
                   <td><%= i %></td>
               </tr>
        </table>
        </div>
     </main>
     
      <footer>
         <jsp:include page="layout/footer.jsp"></jsp:include>
    </footer>
</body>
</html>