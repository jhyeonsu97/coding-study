<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/oracleCon.jsp" %>

<%@ include file="../include/certify.jsp" %>

<!-- 파라메터 값 받기 -->
<%
String sche_date = request.getParameter("sche_date");
%>
    
<!-- delete sql작성 및 적용 -->
<%
// userid와 sche_date를 비교하여 삭제
String sql = " delete from sche_mgr "
			+ " where userid = '+SessionMemberId+' "
			+ " and to_char(sche_date,'yyyy-mm-dd') = '"+sche_date+"' ";
Statement stmt = con.createStatement();
int result = stmt.executeUpdate(sql);
if(result == 1){
%>
	<script>
	alert("일정삭제완료!");
	location="planMain.jsp";
	</script>
<%	
}
%>