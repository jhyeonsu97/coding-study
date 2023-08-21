<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전송 파일0</title>
</head>
<body>
<form name = "frm" method="post" action="write2sub.jsp">
이름 : <input type="text" name="username"> <br>
생년월일 : <input type="text" name="birthday"> <br>
연락처 : <input type="text" name="phone"> <br>
거주지 : <input type="text" name="addr"><br>
성별 : <input type="radio" name="gender" value="M"> 남,
	  <input type="radio" name="gender" value="F"> 여 <br>
취미 : <input type="checkbox" name="hobby" value="바둑"> 바둑,
	  <input type="checkbox" name="hobby" value="장기"> 장기,
	  <input type="checkbox" name="hobby" value="체스"> 체스 <br>
<input type="submit" value="전송">


</form>
</body>
</html>