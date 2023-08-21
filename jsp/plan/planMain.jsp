<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>
<%@ include file="../include/certify.jsp" %>

<% 

// (이전)(다음) 버튼 클릭 시 세팅된 값(파라메터 값)을 받음
String yy = request.getParameter("yy");
String mm = request.getParameter("mm");

Calendar cal = Calendar.getInstance();

// 현재 시점의 년,월,일  
int y = cal.get(Calendar.YEAR); 
int m = cal.get(Calendar.MONTH);
int d2 = cal.get(Calendar.DATE); 

// 현재 시점의 년-월-일 변수처리 :: 달렬의 오늘날짜 처리관련
String today = y+"-"+(m+1)+"-"+d2;

// 파라메터 변수 값의 유효성 체크
if( yy != null && 
    mm != null && 
    !yy.equals("") && 
    !mm.equals("")) 
{
	// 유효성체크
	boolean yy_chk = yy.matches("[0-9]{4}");   // true or false
	boolean mm_chk = mm.matches("[0-9]{1,2}"); // true or false
	if (yy_chk == true && mm_chk == true) {
		y = Integer.parseInt(yy);
		m = Integer.parseInt(mm)-1;
	}
}
//----------------------
// 출력하는 (달의 1일)의 요일과 마지막날을 얻기 위한 세팅
cal.set(y,m,1);  // cal.set(2023,5,1)
// 출력하는 달의 1일의 요일 얻음
int dayOfweek = cal.get(Calendar.DAY_OF_WEEK);      //ex: 5는 목요일
// 출력하는 달의 마지막 날을 얻음
int lastday = cal.getActualMaximum(Calendar.DATE);  //30

/* 이전 버튼 세팅 s */
int b_yy;
int b_mm = (m+1)-1;  // 이전달의 세팅

if( b_mm < 1) { 
	b_yy = y-1; // 2023 - 1 = 2022
	b_mm = 12;  // 0 -> 12
} else {
	b_yy = y;
}
/* 이전 버튼 세팅 e */

/* 다음 버튼 세팅 s */
int n_yy;
int n_mm = (m+1)+1;  // (5+1) + 1 -> 7
                     // (11+1) + 1 -> 13
if( n_mm > 12 ) { 
	n_yy = y+1;      // 2023 + 1 = 2024
	n_mm = 1;        // 13 -> 1
} else {
	n_yy = y;
}
/* 다음 버튼 세팅 e */
%>


<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>일정조회화면</title>
  <link rel="stylesheet" href="../css/layout.css">
</head>

<style>
.cal_table {
	width:80%;
}
.cal_table th {

}
.cal_table td {
	text-align:left;
	padding:5px;
	height:60px;
}
</style>

<body>
<div class="wrap">
    <header>
		<div class="top_header">

		</div>
    </header>
    <nav>
	 	<div class="nav_left_space">&nbsp;</div>
		<div class="nav_center_space"> 
	
	<!-- nav menu S -->
		<%@ include file="../include/navmenu.jsp" %>
	<!-- nav menu E -->
		
		</div>
		<div class="nav_right_space">&nbsp;</div>
    </nav>
	<aside>
	<!-- aside area S -->
		<%@ include file="../include/aside.jsp" %>
	<!-- aside area E -->
	</aside>
    <section>
       <article>
	<!-- 본문 S -->
	

<div style="width:80%; text-align:left; margin-bottom:10px;">
 	
 	<input type="button" value="이전" 
          onclick="location='planMain.jsp?yy=<%=b_yy%>&mm=<%=b_mm%>' ">
	&nbsp;
	<%=y %>년 <%=m+1 %>월
	&nbsp;
	<input type="button" value="다음" 
          onclick="location='planMain.jsp?yy=<%=n_yy%>&mm=<%=n_mm%>' ">
</div>


<table class="cal_table">
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
int cnt=0;
for(int i=1; i<dayOfweek; i++) { // 1 ~ 4
	out.print("<td></td>");
	cnt++;
}
String sql_10 = "";

//Statement stmt = null;
//ResultSet rs = null;

for(int d=1; d<=lastday; d++) {
	cnt++;  // 1~7
	String color= "#555555";
	if(cnt == 1) {  // 일
		color= "red";
	} else if(cnt == 7) { // 토
		color= "blue";
	}
	String v_date = y+"-"+(m+1)+"-"+d;
	if( today.equals(v_date) ) {
		color = "green";
	}
	
String send_m = (m+1)<10?"0"+(m+1):(m+1)+"";
String send_d = d<10?"0"+d:d+"";
String send_date = y+"-"+send_m+"-"+send_d;

sql_10 = "select substr(title,1,20) as title from sche_mgr "
	   + " where userid='"+SessionMemberId+"' "
	   + "   and to_char(sche_date,'yyyy-mm-dd')='"+send_date+"'";

Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql_10);

String title = "";

if(rs.next()) {
	title = rs.getString("title");
}
%>

<td>
<a href="planWrite.jsp?date=<%=send_date %>">
	<font color="<%=color %>"><%=d %></font>
	<br>
	<%=title %>
</a>
</td>
<%
	if( cnt == 7 ) {
		out.print("</tr><tr>");
		cnt = 0;
	}
}

while( cnt < 7 ) {
	out.print("<td></td>");
	cnt++;
}	
%>

	</tr>
</table>

    <!-- 본문 E -->
    </article>
 </section>
 <footer>
<!-- footer area S -->
<%@ include file="../include/footer.jsp" %>
<!-- footer area E -->
    </footer>
</div>
</body>
</html>