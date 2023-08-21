<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>

<%
String unq = request.getParameter("unq");

if( unq == null || unq.equals("")) {
%>
		<script>
		alert("잘못된 경로로의 접근!");
		history.back();
		</script>
<%
	return;
}
String sql = "DELETE FROM notice WHERE unq='"+unq+"' ";
Statement stmt = con.createStatement();
int result = stmt.executeUpdate(sql);
if(result == 1) {
%>
		<script>
		alert("삭제완료");
		location="notice_list.jsp";
		</script>
<%
} else {
%>
		<script>
		alert("삭제실패");
		history.back();
		</script>
<%
}
%>



