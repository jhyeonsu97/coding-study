<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>

<%
String title = request.getParameter("title");
String content = request.getParameter("content");

if( title == null || title.equals("")) {
%>
		<script>
		alert("제목을 다시 확인해주세요.");
		history.back();
		</script>
<%
	return;
}
String sql = "insert into notice(unq,title,content,hits,rdate)"
           + " values(notice_seq.nextval,'"+title+"','"+content+"','0',sysdate)";
Statement stmt = con.createStatement();
int result = stmt.executeUpdate(sql);
if(result == 1) {
%>
		<script>
		alert("저장완료");
		location="notice_list.jsp";
		</script>
<%
} else {
%>
		<script>
		alert("저장실패");
		history.back();
		</script>
<%
}
%>



