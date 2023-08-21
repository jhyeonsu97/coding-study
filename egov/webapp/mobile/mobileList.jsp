<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>목록</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<meta name="description" content="" />
	<meta name="author" content="THINKER" />
	<meta name="viewport" content="width=device-width; initial-scale=1.0" />
	<link rel="shortcut icon" href="/favicon.ico" />
	<link rel="apple-touch-icon" href="/apple-touch-icon.png" />
	<link rel="stylesheet" href="style/list2.css"/>	
</head>
<style>
.table1 {
	width:98%;
	border-top:2px solid #555;
	border-bottom:1px solid #ccc;
	border-collapse:collapse;
	margin-top:30px;
	margin-left:5px;
	font-size:12px;
}
.table1 th {
	border-top:1px solid #cccccc;
	padding:5px;
}
.table1 td {
	text-align:center;
	border-top:1px solid #cccccc;
	padding:5px;
}
</style>
<body>
	
<div class="header">
	<a class="button menu" href="#menu">Menu</a>	
	<h1 class="title">비품관리</h1>
	<a class="button" href="#settings">Settings</a>
</div>

<div class='section'>
	<ul class="list">
      <li><a href="/mobileWrite.do">비품등록</a></li>
      <li><a href="/mobileList.do">비품목록</a></li>
      <li><a href="/mobileList2.do">비품현황</a></li>
      <li><a href="/mobileDelete.do">비품제거</a></li>   			
	</ul>				
</div>
<div>
<table class="table1" align="center">
	<caption style="padding-bottom:5px;">비품목록</caption>
	<tr>
		<th>비품번호</th>
		<th>비품이름</th>
		<th>비품분류</th>
		<th>등록일자</th>
		<th>비품상태</th>
		<th>비품금액</th>
	</tr>
	
	<c:forEach var="list" items="${resultList}" varStatus="status">
	<tr align="center">
		<td>${list.unq }</td>
		<td>${list.name }</td>
		<td>${list.type1 }</td>
		<td>${list.equdate }</td>
		<td>${list.statement1 }</td>
		<td>${list.price }</td>
	</tr>
	</c:forEach>
	
</table>
</div>

</body>
</html>
