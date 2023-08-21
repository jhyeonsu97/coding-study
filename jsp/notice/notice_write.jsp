<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기</title>
</head>
<body>
<form name="frm" method="post" action="notice_write_save.jsp">
<table border="1" width="500" cellpadding="5">
	<tr>
		<th width="25%">제목</th>
		<td width="75%"><input type="text" name="title"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="content" style="width:98%;height:100px;"></textarea></td>
	</tr>
	<tr>
		<th colspan="2">
		<button type="submit">저장</button>
		<button type="reset">취소</button>
		</th>
	</tr>
</table>
</form>
</body>
</html>