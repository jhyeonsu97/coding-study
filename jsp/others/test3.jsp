<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
public int multi(int a, int b){
	int c = a*b;
	return c;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Calendar cal = Calendar.getInstance();
%>
오늘은
<%=cal.get(Calendar.YEAR)%>년
<%=cal.get(Calendar.MONTH)+1%>월
<%=cal.get(Calendar.DATE)%>일
<%=cal.get(Calendar.HOUR_OF_DAY)%>시
<%=cal.get(Calendar.MINUTE)%>분
<%=cal.get(Calendar.MILLISECOND)%>초
</body>
</html>