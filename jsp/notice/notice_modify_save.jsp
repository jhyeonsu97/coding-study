<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>

<%
String unq = request.getParameter("unq");
String title = request.getParameter("title");
String content = request.getParameter("content");

if( unq == null || unq.equals("")) {
%>
		<script>
		alert("잘못된 경로로의 접근!");
		history.back();
		</script>
<%
	return;
}
String sql = "UPDATE notice SET title='"+title+"',content='"+content+"' "
           + " WHERE unq='"+unq+"' ";
Statement stmt = con.createStatement();
int result = stmt.executeUpdate(sql);
if(result == 1) {
%>
		<script>
		alert("수정완료");
		location="notice_list.jsp";
		</script>
<%
} else {
%>
		<script>
		alert("수정실패");
		history.back();
		</script>
<%
}
%>




