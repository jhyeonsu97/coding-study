<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script>
function fn_delete(cms_no) {
	if( confirm("삭제??") ) {
		location = "cmsDelete.do?cms_no="+cms_no;
	}
}
</script>
<body>
<table border="1">
	<tr>
		<th>번호</th>
		<th>코드번호</th>
		<th>코드이름</th>
		<th>사용</th>
		<th>삭제</th>
	</tr>
	<c:forEach var="a" items="${resultList}" varStatus="status">
		<tr>
			<td>${status.count }</td>
			<td><a href="cmsModify.do?cms_no=${a.cmsNo}">${a.cmsNo}</a> </td>
			<td>${a.cmsNm}</td>
			<td>${a.cmsYn}</td>
			<td><button type="button" onclick="fn_delete('${a.cmsNo}')">삭제</button></td>
		</tr>
	</c:forEach>
	
	
</table>
</body>
</html>


