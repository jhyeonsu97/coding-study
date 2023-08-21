<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메터 값 설정 -->
<%
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String content = request.getParameter("content");
%>
<!-- 널값 체크(제목,암호) -->
<%
if( title == null || pass == null ) { 
%>
		<script>
		alert("잘못된 경로로의 접근");
		location="board1List.jsp";
		</script>
<%
	return; // jsp 중단
}

title = title.trim(); // 앞뒤공백제거
pass  = pass.trim();  // 앞뒤공백제거
%>
<!-- 저장 -->
<%

String sql = "insert into board1(unq,title,pass,name,content,rdate,udate)"
		   + "values(board1_seq.nextval,'"+title+"','"+pass+"','"+name+"','"+content+"',sysdate,sysdate) ";

Statement stmt = con.createStatement(); // 메모리 공간 확보
int result = stmt.executeUpdate(sql);
%>
<!-- 결과 메시지 출력 -->
<%
if( result == 1 ) {
%>
		<script>
		alert("등록완료!");
		location = "board1List.jsp";
		</script>
<%
} else {
%>
		<script>
		alert("등록실패!");
		history.back();
		</script>
<%
}
%>



