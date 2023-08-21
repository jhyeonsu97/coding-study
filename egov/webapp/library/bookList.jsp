<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>

<script>
function fn_page(pageIndex) {
    $("#pageIndex").val(pageIndex);
    $("#searchFrm").submit();
}
</script>

<body>

[ 도서 목록 ] 

<p>
    Total : ${total }
</p>
<p>
    <form id="searchFrm" method="post" action="/bookList.do">
        <input type="hidden" name="pageIndex" id="pageIndex" value="1">
        <select name="searchCondition">
            <option value="title" 
                <c:if test="${vo.searchCondition=='title' }">selected</c:if> >제목</option>
            <option value="authors"
                <c:if test="${vo.searchCondition=='authors' }">selected</c:if> >저자</option>
            <option value="isbn"
                <c:if test="${vo.searchCondition=='isbn' }">selected</c:if> >ISBN</option>
        </select>
        <input type="text" name="searchKeyword" value="${vo.searchKeyword }">
        <button type="submit">검색</button>
    </form>
</p>
<table border="1" width="1000" cellpadding="1">

    <tr>
        <th width="5%">번호</th>
        <th width="10%">표지</th>
        <th width="*">제목</th>
        <th width="15%">저자</th>
        <th width="15%">출판사</th>
        <th width="15%">ISBN</th>
    </tr>
    
    <c:set var="rownumber" value="${vo.recordCountPerPage }"/>
    <c:forEach var="list" items="${resultList}" varStatus="status">
        <c:if test="${list.title.contains(vo.searchKeyword) || list.authors.contains(vo.searchKeyword) || list.isbn.contains(vo.searchKeyword)}">
            <tr align="center">
                <td>${rownumber }</td>
                <td><img src="${list.thumbnail }" alt="표지 이미지" style="width: 50px; height: 70px;"></td>
                <td align="left"><a href="bookDetail.do?unq=${list.unq }">${list.title }</a></td>
                <td>${list.authors }</td>
                <td>${list.publisher }</td>
                <td>${list.isbn }</td>
            </tr>
            <c:set var="rownumber" value="${rownumber-1 }"/>
        </c:if>
    </c:forEach>
    
</table>
<div class="page_number_area">
    <c:forEach var="i" begin="1" end="${vo.lastPage }">
        <a href="javascript:fn_page('${i }')">${i }</a>  
    </c:forEach>
</div>

</body>
</html>