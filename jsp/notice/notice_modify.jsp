<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/oracleCon.jsp" %>
<%
String unq = request.getParameter("unq");

if( unq == null || unq.equals("")) {
%>
		<script>
		alert("잘못된 경로로의 접근");
		history.back();
		</script>
<%
	return;
}
String sql1 = "SELECT title,content,rdate,hits FROM notice "
           + " WHERE unq='"+unq+"' ";
Statement stmt1 = con.createStatement();
ResultSet rs1 = stmt1.executeQuery(sql1);
if( !rs1.next() ) {
%>
		<script>
		alert("다시 시도해주세요!");
		history.back();
		</script>
<%
	return;
}
String title = rs1.getString("title");
String content = rs1.getString("content");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
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
<form name="frm" method="post" action="notice_modify_save.jsp">
	<input type="hidden" name="unq" value="<%=unq %>">
<table>
	<tr>
		<th width="25%">제목</th>
		<td width="75%"><input type="text" name="title" value="<%=title %>"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="content" style="width:98%;height:100px;"><%=content %></textarea></td>
	</tr>
	<tr>
		<th colspan="2">
		<button type="button" onclick="history.back();">뒤로</button>
		<button type="submit">수정</button>
		<button type="button" onclick="location='notice_list.jsp'">목록</button>
		</th>
	</tr>
</table>
</form>
</body>
</html>