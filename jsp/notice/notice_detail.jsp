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
String hits = rs1.getString("hits");
String rdate = rs1.getString("rdate");

String sql2 = "UPDATE notice SET hits=hits+1 WHERE unq='"+unq+"'";
stmt1.executeUpdate(sql2);

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
<script>
function fn_delete(unq) {
	if( confirm("정말삭제??") ) {
		location="notice_delete.jsp?unq="+unq;
	}
}

</script>

<body>
<form name="frm" method="post" action="notice_write_save.jsp">
<table>
	<tr>
		<th width="25%">제목</th>
		<td width="75%"><%=title %></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><div style="width:98%;height:100px;"><%=content %></div></td>
	</tr>
	<tr>
		<th colspan="2">
		<button type="button" onclick="history.back();">뒤로</button>
		<button type="button" onclick="location='notice_modify.jsp?unq=<%=unq %>'">수정</button>
		<button type="button" onclick="fn_delete('<%=unq %>')">삭제</button>
		</th>
	</tr>
</table>
</form>
</body>
</html>