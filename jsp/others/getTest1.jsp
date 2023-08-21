<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get 방식 테스트</title>
</head>
<body>

<%--
데이터 전송
GET방식/POST방식
1. getTest1.jsp
Get : 주소표기 뒤에 변수를 설정하여 전송하는 방식 
http://웹주소:포트번호/프로젝트명/파일명
http://localhost:8080/jsp_project/getTest1.jsp?eng=100&kor=90
2. getTest2.jsp
a href="http://localhost:8080/jsp_project/getTest1.jsp?eng=100&kor=90"
-------------------------
{아이디&암호 전송} GET방식 전송
1. getTest3.jsp // 메인
2. getTest3_sub.jsp
-------------------------
{아이디&암호 전송} POST방식 전송
1. postTest3.jsp // 메인
http://localhost:8080/jsp_project/postTest3.jsp?
2. postTest3_sub.jsp
--%>

<%
String eng = request.getParameter("eng");
String kor = request.getParameter("kor");
out.print(eng+"<br>");
out.print(kor);

int hap = Integer.parseInt(eng) + Integer.parseInt(kor);
out.print("합계 : "+hap);
%>

</body>
</html>