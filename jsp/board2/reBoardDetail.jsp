<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메서 값 세팅 -->
<%
String unq = request.getParameter("unq");
%>
  
<!-- unq의 null 체크 -->
<%
//  detail.jsp?unq=
if( unq == null || unq.equals("") ) {
%>
		<script>
		alert("잘못된 경로로의 접근!!");
		location="reBoardList.jsp";
		</script>
<%	
	return;
}
%>

<!-- 상세보기 SQL 작성 및 적용 -->
<%
String sql = " select title,name,content,rdate "
		   + "   from reboard "
		   + " where unq='"+unq+"' ";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
if( rs.next() == false ) {
%>
		<script>
		alert("잘못된 경로로의 접근!!");
		location="board1List.jsp";
		</script>
<%
	return;
} 
String title   = rs.getString("title");
String name    = rs.getString("name");
String content = rs.getString("content");
String rdate   = rs.getString("rdate");

content = content.replace("\n", "<br>");

stmt.executeUpdate
	("update reboard set hits=hits+1 where unq='"+unq+"'");

%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 게시판 상세</title>
</head>
<style>
body {
	font-size:12px;
	font-family:맑은 고딕;
}
table {
	width:600px;
	border:1px solid #555;
	border-collapse:collapse;
}
th,td {
	border:1px solid #555;
	padding:5px;
}
</style>

<script>

</script>

<body>
<form name="frm" method="post" action="board1WriteSave.jsp">
<table>
	<caption style="font-size:20px;
				    font-weight:bold;">(답변게시판)상세화면</caption>
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th>제목</th>
		<td><%=title %></td>
	</tr>
	<tr>
		<th>글쓴이</th>
		<td><%=name %></td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
		<div style="width:98%; height:150px;">
		<%=content %>
		</div>
		</td>
	</tr>
	<tr>
		<th>등록일시</th>
		<td><%=rdate %></td>
	</tr>
</table>
<div style="width:600px;
			margin-top:10px;
			text-align:center;">
	<button type="button" onclick="history.back();">이전</button>
	<button type="button" onclick="location='reBoardModify.jsp?unq=<%=unq%>'">수정</button>
	<button type="button" onclick="location='reBoardPass.jsp?unq=<%=unq%>'">삭제</button>
	<button type="button" onclick="location='reBoardReply.jsp?unq=<%=unq%>'">답글</button>

</div>
</form>

</body>
</html>