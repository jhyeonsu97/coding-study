<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8" />
   <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
   <title>등록</title>
   <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
   <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
   <meta name="description" content="" />
   <meta name="author" content="THINKER" />
   <meta name="viewport" content="width=device-width; initial-scale=1.0" />
   <link rel="shortcut icon" href="/favicon.ico" />
   <link rel="apple-touch-icon" href="/apple-touch-icon.png" />
   <link rel="stylesheet" href="style/list2.css"/>   
</head>

<script>
 $(function(){    
    $("#button1").click(function(){ 
      
        var form = $("#frm").serialize();
        $.ajax({
          
          type : "POST",
          data :  form,
          url  : "/mobileWriteSave.do",
          
         
          datatype : "text",
          success : function(data) {
             if(data === "ok") {
               alert("저장완료!");
               location = "/mobileList.do";
             } else {
                alert("저장실패!");
             }
          },
          error : function() {
             alert("전송실패");
          }
       });
    }); 
 });

</script>

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
<form name="frm" id="frm">
<table class="table1" align="center">
   <caption style="padding-bottom:5px;">비품등록</caption>
   <tr>
      <th width="30%" >비품번호</th>
      <td><input type="text" name="unq" ></td>
   </tr>
   <tr>
      <th>비품이름</th>
      <td><input type="text" name="name"></td>
   </tr>
   <tr>
      <th>비품분류</th>
      <td>
         <input type="radio" name="type" value="기계류" checked>기계류
         <input type="radio" name="type" value="집기류">집기류
      </td>
   </tr>
   <tr>
      <th>등록일자</th>
      <td><input type="date" name="equ_date"></td>
   </tr>
   <tr>
      <th>비품상태</th>
      <td><input type="radio" name="statement" value="사용" checked>사용
         <input type="radio" name="statement" value="미사용">미사용
      </td>
   </tr>
   <tr>
      <th>비품금액</th>
      <td><input type="text" name="price"></td>
   </tr>
</table>

<div style="text-align:center; width:100%; margin-top:20px;">
   <button type="button" id="button1">저장</button>
   <button type="reset">취소</button>
</div>
</form>
</div>

</body>
</html>
