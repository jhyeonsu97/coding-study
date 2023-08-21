<%@page import="conn.Cookies"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/oracleCon.jsp" %>
<%
String userid = request.getParameter("userid");
String userpw = request.getParameter("userpw");
String chk 	  = request.getParameter("chk");

if(chk==null) {
	out.print("null");
} else {
	out.print("ok");
}
%>
<%
String sql= "select count(*) cnt from memberinfo "
        + " where userid='"+userid+"' and userpw='"+userpw+"'";

Statement stmt =  con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt("cnt");
if(cnt == 0) {
%>
   <script>
   alert("아이디와 암호를 다시 확인해주세요.");
   history.back();
   </script>
<%
   return;
}
// sessionUserId
// 예) String SessionUserId ="test123";
// 세션변수 생성
session.setAttribute("SessionUserId", userid);
session.setMaxInactiveInterval(3600); // 세션유지시간 (설정 하지 않으면 브라우저가 닫히는 순간 = 세션변수가 사라지는 순간)   

// 쿠키설정(아이디 기억하기)
if(chk == null) { // 체크해제의 경우
	response.addCookie(Cookies.createCookie("CookieUserId","","/",-1));
} else { // 체크상태의 경우
	//(변수명, 변수값, 적용범위, 적용시간)
	response.addCookie(Cookies.createCookie("CookieUserId",userid,"/",-1));
}

%>
   <script>
   alert("<%=userid %>님 환영합니다.");
   location="../main/main.jsp";
   </script>
 
    