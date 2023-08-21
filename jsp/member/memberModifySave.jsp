<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>
<!-- 파라메터 값 설정 -->
<%
String userid = (String) session.getAttribute("SessionUserId");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String p1 = request.getParameter("p1");
String p2 = request.getParameter("p2");
String p3 = request.getParameter("p3");
String zipcode = request.getParameter("zipcode");
String addr = request.getParameter("addr");
String[] hobby = request.getParameterValues("hobby");
String email = request.getParameter("email");
String homepage = request.getParameter("homepage");

String birthday = year+"-"+month+"-"+day;
String phone = p1+"-"+p2+"-"+p3;
String hobby1 = "";
for(int i=0; i<hobby.length;i++){
   hobby1 += hobby[i]+",";
}
hobby1 =hobby1.substring(0,hobby1.length()-1);
%>

<!-- 중요 데이터 값의 널값 체크 아이디/암호/이름 -->
<%
   if (userid == null || name == null){
%>
   <script>
      alert("잘못된 경로로의 접근입니다.");
      self.close();
   </script>   
<%
}
%>

<!-- 데이터 저장 -->
<%
   String sql2 ="UPDATE memberinfo SET  "
            +"  name = '"+name+"'"
            +" ,gender = '"+gender+"'"
            +" ,birthday = '"+birthday+"' " 
            +" ,phone = '"+phone+"' "
            +" ,zipcode = '"+zipcode+"' "
            +" ,addr = '"+addr+"' "
            +" ,hobby = '"+hobby1+"' "
            +" ,email = '"+email+"' "
            +" ,homepage = '"+homepage+"' "
            +" WHERE userid='"+userid+"'";


Statement stmt = con.createStatement();
int result = stmt.executeUpdate(sql2);
if(result == 1){
%>
   <Script>
      alert("수정 완료");
      location="../main/main.jsp"
   </Script>
<%
   }else{
%>
   <Script>
      alert("수정 실패");
      history.back();
   </Script>
<%
   return;
   }
%>
