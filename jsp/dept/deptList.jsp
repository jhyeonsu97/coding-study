<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String url = "jdbc:oracle:thin:@//localhost:1521/xe";
String username ="C##java";
String userpass ="1234";
Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection(url,username,userpass);
Statement stmt = con.createStatement();

String sql = "select deptno,dname,loc from dept";
ResultSet rs = stmt.executeQuery(sql);

/*
- sql : 부서번호기준 역순
- 글쓰기 버튼
- 순번
*/

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서목록</title>
</head>

<script>
function fn_delete(deptno) {
	if(confirm("정말 삭제하시겠습니까?")) {
		location="deptDelete.jsp?deptno="+deptno;
		
	}
}
</script>

<body>
<div style="padding-bottom:10px;">
	<button type="button" onclick="location='deptWrite.jsp'">부서등록</button>
</div>
<table border="1" width="600">
	<colgroup>
		<col width="15%"/>
		<col width="15%"/>
		<col width="35%"/>
		<col width="*"/>
		<col width="10%"/>
	</colgroup>
	<tr>
		<th>번호</th>
		<th>부서번호</th>
		<th>부서이름</th>
		<th>부서위치</th>
		<th>삭제</th>
	</tr>
	<%
	int number = 0;
	while(rs.next()){
		number++;
		String deptno = rs.getString("deptno");
		String dname = rs.getString("dname");
		String loc = rs.getString("loc");
	%>	
		<tr>
			<td><%=number %></td>
			<td><a href="deptModify.jsp?deptno=<%=deptno%>"><%=deptno %></a></td>
			<td><%=dname %></td>
			<td><%=loc %></td>
			<td><button type="button" onclick="fn_delete('<%=deptno%>')">삭제</button></td>
		</tr>
	<%
	}
	%>
</table>

</body>
</html>