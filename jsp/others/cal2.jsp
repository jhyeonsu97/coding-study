<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 파라메터 값을 받음
String yy = request.getParameter("yy");
String mm = request.getParameter("mm");

// Calendar 클래스의 인스턴스(객체)화
Calendar cal = Calendar.getInstance();

// 현재 시점의 년, 월, 일
int y = cal.get(Calendar.YEAR); // 출력년도
int m = cal.get(Calendar.MONTH); // 출력월
int d2 = cal.get(Calendar.DATE);

// 현재 시점의 년-월-일 변수처리 :: 달력의 오늘날짜 처리관련
String today = y+"-"+(m+1)+"-"+d2;

// 파라메터 변수 값의 유효성 체크
if(yy!=null 
&& mm!=null 
&& !yy.equals("") 
&& !mm.equals("")) 
{	
	// 유효성체크
	boolean yy_chk = yy.matches("[0-9]{4}"); // true or false
	boolean mm_chk = mm.matches("[0-9]{1,2}");
	if (yy_chk == true && mm_chk == true) {
		y = Integer.parseInt(yy);
		m = Integer.parseInt(mm)-1;	
	}
}

// 출력하는 달 1일의 요일을 얻기 위한 세팅
cal.set(y,m,1); // 2023-06-01 / cal.set(2023,5,1)
// 출력하는 달 1일의 요일 얻음
int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); // 5(목)
// 출력하는 달 마지막 날을 얻음
int lastday = cal.getActualMaximum(Calendar.DATE); // 30

// 이전 버튼의 세팅
int b_yy;
int b_mm = (m+1)-1; // 이전달의 세팅
if(b_mm<1) {
	b_yy = y-1; // 2023-1 = 2022
	b_mm = 12; // 0 -> 12
} else {
	b_yy = y;
}
// 다음 버튼의 세팅
int n_yy;
int n_mm = (m+1)+1; // 다음달의 세팅
if( n_mm >12) {
	n_yy = y+1; // 2023+1 = 2024
	n_mm = 1; // 13 -> 1
} else {
	n_yy = y;
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<form name = "frm" method="post" action="cal2.jsp">
	<!--
	<input type="text" name="yy" size="4">년 
	<input type="text" name="mm" size="2">월 
	-->
	<select name="yy">
	<%
	cal = Calendar.getInstance();
	int j_yy = cal.get(Calendar.YEAR);
	for(int j=(j_yy-10); j<=(j_yy+10); j++) {
	%>
		<option value = "<%=j%>"><%=j %></option>
	<%
	}
	%>
	</select>
	년
	<select name="mm">
	<%
	for(int k=1; k<=12; k++) {
	%>
		<option value = "<%=k%>"><%=k %></option>
	<%
	}
	%>
	</select>
	<input type="submit" value="달력보기">
</form>
</div>

<div>
<%=y %>년 <%=m+1 %>월
<%--
<input type="button" value="이전" onclick="location='cal2.jsp?yy=2023&mm=5'">
<input type="button" value="이후" onclick="location='cal2.jsp?yy=2023&mm=7'">
--%>
<input type="button" value="이전" onclick="location='cal2.jsp?yy=<%=b_yy%>&mm=<%=b_mm%>'">
<input type="button" value="이후" onclick="location='cal2.jsp?yy=<%=n_yy%>&mm=<%=n_mm%>'">
</div>
<table border="1" width="350">
	<tr>
		<th>일</th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
		<th>토</th>
	</tr>
	<tr>
		<%
		int cnt = 0;
		for(int i=1; i<dayOfWeek; i++) { // 1 ~ 4
			out.print("<Td></td>");
			cnt++;
		}
		
		for(int d=1; d<=lastday; d++){
			cnt++; // 1 ~ 7
			String color="#555555";
			if(cnt == 1) { // 일
				color ="red";
			} else if(cnt == 7) { // 토
				color = "blue";
			}
			String v_date =  y+"-"+(m+1)+"-"+d;
			if(today.equals(v_date)) {
				color = "green";
			}
		%>
			<td><font color="<%=color %>"><%=d %></font></td>
		<%
			if(cnt==7){
				out.print("</tr><tr>"); 
				cnt = 0; // 숫자를 0부터 다시 세게 하려는 목적
			}
		}
		while(cnt<7){
			out.print("<Td></<td>");
			cnt++;
		}
		%>
	</tr>
</table>
</body>
</html>