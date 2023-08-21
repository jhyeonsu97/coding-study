<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String SessionMemberId = (String)session.getAttribute("SessionUserId");

if(SessionMemberId == null || SessionMemberId.trim().equals("")) {
%>
	<script>
	alert("로그인 해주세요");
	location = "../member/loginWrite.jsp";
	</script>
<%
	return;
}
%>