<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받는 파일</title>
</head>
<body>
<%
String username = request.getParameter("username");
String birthday = request.getParameter("birthday");
String phone = request.getParameter("phone");
String addr = request.getParameter("addr");
String gender = request.getParameter("gender");
String[] hobby = request.getParameterValues("hobby");
%>

이름 : <%=username %><Br>
생년월일: <%=birthday %><Br>
연락처 : <%=phone %> <br>
거주지 : <%=addr %> <br>
성별 : <%=gender %> <br> 
<%
if(hobby == null) {
	out.print("취미:선택없음");
} else {
	
	for(int i=0; i<hobby.length; i++) {
		out.print(hobby[i]+" ");
	}
}
%> 

<br>
<input type="button" value="뒤로" onclick="history.back()">
</body>
</html>