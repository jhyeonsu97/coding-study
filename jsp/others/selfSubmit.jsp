<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
<form name="frm" method="get" action="selfSubmit.jsp"> // get은 주소표시줄에 넘어오는 데이터 노출
http://localhost:8080/jsp_project/study1/selfSubmit.jsp?name=&tell= // 아무것도 입력 안했을때 
--%>
<form name="frm" method="post" action="selfSubmit.jsp"> 
이름 : <input type="text" name="name">
전번 : <input type="text" name="tell">
<input type="submit" value="전송">
</form><Br>
 <%
 			// 클래스 이름(request 객체)
String name = request.getParameter("name"); // 넘어오는 데이터 파라미터 변수별로 받기
String tell = request.getParameter("tell");

if(name!=null
 &&tell!=null
 &&!name.equals("")
 &&!tell.equals("")) 
{
	out.print(name +"님의 전화번호는" + tell +"입니다."); 
} else {
	out.print(" ");
}
%>
</body>
</html>