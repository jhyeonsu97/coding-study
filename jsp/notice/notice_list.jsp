<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/oracleCon.jsp" %>
    
<%
String sql = "SELECT unq,title,hits,to_char(rdate,'yyyy-mm-dd') rdate FROM notice "
           + " ORDER BY unq DESC";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
</head>
<style>
body { font-size:12px; }
table {
	width:600px;
	border:1px solid #555;
	border-collapse:collapse;
}
th, td {
	border:1px solid #555;
	padding:5px;
}
</style>

<body>
<table>
	<tr>
		<th width="15%">순번</th>
		<th width="*">제목</th>
		<th width="15%">등록일</th>
		<th width="15%">조회수</th>
	</tr>
	<%
	int cnt = 0;
	while( rs.next() ) {
		int unq = rs.getInt("unq");
		String title = rs.getString("title");
		String hits = rs.getString("hits");
		String rdate = rs.getString("rdate");
		cnt++;
	%>
	<tr>
		<td align="center"><%=cnt %></td>
		<td><a href="notice_detail.jsp?unq=<%=unq%>"><%=title %></a></td>
		<td align="center"><%=hits %></td>
		<td align="center"><%=rdate %></td>
	</tr>
	<%
	}
	%>
</table>
<br>
<button type="button" onclick="location='notice_write.jsp'">글쓰기</button>

</body>
</html>