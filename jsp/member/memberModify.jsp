<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/oracleCon.jsp" %>

<%
String memberId = (String) session.getAttribute("SessionUserId");
if(memberId == null) {
%>
	<script>
	alert("로그인 해주세요.");
	location="../member/loginWrite.jsp";
	</script>
<%
}
String sql = "select name,gender,to_char(birthday,'yyyy-mm-dd') birthday ,phone,zipcode,addr, "
			+ " hobby,email,homepage,rdate "
			+ " from memberinfo "
			+ " where userid = '"+memberId+"' ";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);

if(rs.next() == false ) {
	session.removeAttribute("SessionUserId");
%>
	<script>
	alert("다시 로그인 해주세요.");
	location="../member/loginWrite.jsp";
	</script>
<%
	return;
}

String name		= rs.getString("name");
String gender	= rs.getString("gender");
String birthday	= rs.getString("birthday");
String phone 	= rs.getString("phone");
String zipcode 	= rs.getString("zipcode");
String addr 	= rs.getString("addr");
String hobby 	= rs.getString("hobby");
String email 	= rs.getString("email");
String homepage = rs.getString("homepage");

// b_array[0] = "2021"; b_array[1] = "5"; b_array[2] = "2"; 
String[] b_array = birthday.split("-");
int b_year	 = Integer.parseInt(b_array[0]);
int b_month	 = Integer.parseInt(b_array[1]);
int b_day 	 = Integer.parseInt(b_array[2]);

String[] p_array = phone.split("-");
// 010-1111-2222;; p_array[0]="010";p_array[1]="1111";p_array[2]="2222";
String pp[] = new String[3];
for(int i=0; i<p_array.length; i++) {
	pp[i] = p_array[i];
}

/*취미세팅*/


%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>회원정보수정화면</title>
<link rel="stylesheet" href="../css/layout.css">
</head>

<style>
td{text-align:left;}
.input1{width:98%;}
.input2{width:150px;}
</style>
<script>
function fn_passChange() {
	var url = "passChange.jsp";
	window.open(url,"passChange","width=400,height=300");
}


function fn_popup() {
	var url = "post1.jsp";
	window.open(url,"post1","width=500, height=200");
	
}

function fn_submit() {
	var f = document.frm;
	if(f.userpw.value.length < 6 || 
	   f.userpw.value.length > 20) {
	   alert("암호는 6자리 ~ 20자리 사이로 작성해주세요.");
	   f.userpw.focus();
	   return false;
	}
	if(f.name.value == ""){
	   alert("이름을 작성해주세요.");
	   f.name.focus();
	   return false;
	}
	if(f.p2.value == "" || f.p3.value == "") {
		alert("핸드폰번호를 입력해주세요.")
	}
	var hobby = document.getElementsByName("hobby");
	var len = hobby.length;
	
	var cnt = 0;
	for(var i=0; i<len; i++) {
		if(hobby[i].checked == true){
			cnt++;
		}
	}
	if(cnt == 0) {
		alert("취미를 체크해주세요.");
		return false;
	}
	f.submit();
}
</script>

<body>
<div class="wrap">
    <header>
      <div class="top_header">

      </div>
    </header>
    <nav>
       <div class="nav_left_space">&nbsp;</div>
      <div class="nav_center_space"> 
      <!--  nav menu S -->
      <%@include file = "../include/navmenu.jsp" %>
      <!--  nav menu E -->
      </div>
      <div class="nav_right_space">&nbsp;</div>
    </nav>
   <aside>
      <!--  aside area S -->
      <%@include file = "../include/aside.jsp" %>
      <!--  aside area E -->
   </aside>
    <section>
       <article>
      <!-- 본문 S -->
<form name="frm" method="post" action="memberModifySave.jsp">
<table>
   <tr>
      <th>*아이디</th>
      <td>
      	<%=memberId %>
      </td>
   </tr>
   <tr>
      <th>*암호</th>
      <td><button type="button" onclick="fn_passChange()">암호번경</button></td>
   </tr>
    <tr>
      <th>*이름</th>
      <td><input type="text" name="name" value="<%=name %>" class="input1"></td>
   </tr>
   <tr>
      <th>*성별</th>
      <td>
         <select name = "gender">
            <option value="M" <%if(gender.equals("M")){out.print("selected");} %>>남성</option>
            <option value="F" <%if(gender.equals("F")){out.print("selected");} %>>여성</option>
         </select>
      </td>
   </tr>
   <tr>
      <th>*생일</th>
      <td>
         <select name="year">
         <%
         for(int yy=1940; yy<=2022; yy++) {
         %>
            <option value="<%=yy%>" <%if(yy==b_year){%>selected<%}%>><%=yy %></option>
         <%
         }
         %>
         </select>년
         <select name="month">
         <%
         for(int mm=1; mm<=12; mm++) {
         %>
            <option value="<%=mm%>" <%if(mm==b_month){%>selected<%}%>><%=mm %></option>
         <%
         }
         %>
         </select>월
         <select name="day">
         <%
         for(int dd=1; dd<=31; dd++) {
         %>
            <option value="<%=dd%>" <%if(dd==b_day){%>selected<%}%>><%=dd %></option>
         <%
         }
         %>
         </select>일
      </td>
   </tr>
   <tr>
      <th>*핸드폰</th>
      <td>
         <select name="p1">
            <option value="010" 
            <%if(pp[0].equals("010")){out.print("selected");} %>>010</option>
            <option value="011"
            <%if(pp[0].equals("011")){out.print("selected");} %>>011</option>
            <option value="016"
            <%if(pp[0].equals("016")){out.print("selected");} %>>016</option>
         </select>
         <input type="number" name="p2" class="input2" value="<%=pp[1] %>">
         <input type="number" name="p3" class="input2" value="<%=((pp[2]==null)?"":pp[2]) %>">
      </td>
   </tr>
   <tr>
      <th>주소</th>
      <td>
      <div style="line-height:2.0;">
      <input type="number" name="zipcode" value="<%=zipcode %>" class="input2">
      <button type="button" onclick="fn_popup()">우편번호찾기</button>
      <br>
      <input type="text" name="addr" value="<%=addr %>" class="input1">
      </div>
      </td>
   </tr>
   <tr>
      <th>취미</th>
      <td>
         <input type="checkbox"  name="hobby" value="바둑" 
         <%if(hobby.indexOf("바둑")>-1) {out.print("checked");} %>>바둑
         <input type="checkbox"  name="hobby" value="장기"
         <%if(hobby.indexOf("장기")>-1) {out.print("checked");} %>>장기
         <input type="checkbox"  name="hobby" value="체스" 
         <%if(hobby.indexOf("체스")>-1) {out.print("checked");} %>>체스
      </td>
   </tr>
   <tr>
      <th>이메일</th>
      <td><input type="email" name="email" value="<%=email %>" class="input1"></td>
   </tr>
   <tr>
      <th>홈페이지</th>
      <td><input type="url" name="homepage" value="<%=homepage %>" class="input1"></td>
   </tr>
</table>
<div style="width:600px; 
	 text-align:center;
	 margin-top:10px;">
	<button type="submit" onclick="fn_submit(); return false;">저장</button>
	<button type="reset">취소</button>
</div>
</form>
      <!-- 본문 E -->
       </article>
    </section>
    <footer>
       <!--  footer area S -->
      <%@include file = "../include/footer.jsp" %>
      <!--  footer area E -->
    </footer>
</div>
</body>
</html>