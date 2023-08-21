<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단독실행 불가</title>
</head>
<body>
<%
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String gg = "";
if(gender.equals("M")){
	gg="남";
} else {
	gg="여";
}
%>

전송Id : <%=userid %><Br>
전송Pw : <%=pass %><Br>
전송Nm : <%=name %> <br>
전송Gd : <%=gg %>

</body>
</html>