<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메터값 받기 -->
<%
String p1 = request.getParameter("pass1");
String p2 = request.getParameter("pass2");
String p3 = request.getParameter("pass3");
%>
<!-- 널 체크 -->

<!-- 저장된 암호화의 일치여부 sql작성/적용 및 비교 -->
<%
String userid = (String) session.getAttribute("SessionUserId");
String sql = "select count(*) cnt from memberinfo "
			+ " where userid = '"+userid+"' and userpw='"+p1+"' ";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
rs.next();

int cnt = rs.getInt("cnt");
if(cnt == 0){
%>	
	<script>
	alert("등록된 암호와 일치하지 않습니다.");
	history.back();
	</script>
<%
	return;
}
%>

<!-- 암호변경 sql작성/적용 -->
<%
String sql2 = "update memberinfo set userpw='"+p2+"' "
			+ " where userid='"+userid+"' ";
int result = stmt.executeUpdate(sql2);
if(result == 1){
%>
	<script>
	alert("암호변경에 성공했습니다. \n다음 로그인 시 적용됩니다.");
	opener.location="../main/main.jsp";
	self.close();
	</script>
<%	
} else {
%>
	<script>
	alert("암호변경에 실패했습니다.\n다시 로그인 해주세요.");
	opener.location="../member/loginWrite.jsp";
	self.close();
	</script>
<%
}
%>