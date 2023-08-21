<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/main.css">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>상세보기</title>
</head>

<style>

.board1 {
	width:1000px;
	border-top:2px solid #474747;
	border-bottom:1px solid #cccccc;
	border-collapse:collapse;
}
.board1 th {
	border-bottom:1px solid #cccccc;
	border-collapse:collapse;
	padding:5px;
	height:30px;
}
.board1 td {
	border-bottom:1px solid #cccccc;
	border-collapse:collapse;
	padding:5px;
	text-align:center;
	height:20px;
}

.page_number_area {
	width:100%;
	text-align:center;
	padding-top:20px;
}

.board_content {
	line-height:1.8;
	margin-top: 50px;
	margin-bottom:50px;
} 
</style>

<body>
    <header>
      <%@ include file="../include/header.jsp" %>
    </header>
    <div id = "wrapper">

        <div id="container">
            <section class="sct_wrap">
                <header>
                	<p style="font-size:15px; font-weight:bold;">
                    ${vo.title }
                    </p>
                    작성자(${vo.name })&nbsp;&nbsp; 
                    등록일(${vo.rdate })&nbsp;&nbsp;  
                    조회(${vo.hits }회)&nbsp;&nbsp;  
                    댓글(0건)
                </header>
                <hr style="background:#ccc;height:1px;border:0px;">
                <div class="board_content">
				${vo.content }
                </div>
            </section>

            <footer>
               	<%@ include file="../include/footer.jsp" %>
            </footer>
        </div>
    </div>
</body>
</html>