<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>
<%
String sche_date = request.getParameter("sche_date");
String title     = request.getParameter("title");
String view1     = request.getParameter("view1");
String content   = request.getParameter("content");
String gubun     = request.getParameter("gubun");  // I or U

if( sche_date == null || title == null ){
	// 널값 체크
}

String userid = (String)session.getAttribute("SessionUserId");

String sql = " merge \n"
		   + "  into sche_mgr s \n"
		   + "  using  dual   on   \n"
  	       + "       ( s.userid='"+userid+"'  \n"
		   + "   and to_char(s.sche_date,'yyyy-mm-dd')='"+sche_date+"' ) \n"
		   + " when matched then \n"
		   + "   update set \n"
		   + "        title='"+title+"' \n"
		   + "       ,view1='"+view1+"' \n"
		   + "       ,content='"+content+"'  \n"
		   + " when not matched then   \n"
		   + "    insert (unq,userid,sche_date,title,view1,content)  \n"
		   + "     values(sche_mgr_seq.nextval,   \n"
		   + "         '"+userid+"',  \n" 	   
		   + "         '"+sche_date+"',  \n"
		   + "         '"+title+"',  \n"
		   + "         '"+view1+"',  \n"
		   + "         '"+content+"')";

/*
if( gubun.equals("I")) {
	sql = "insert into sche_mgr(unq,userid,sche_date,title,view1,content)"
		   + " values(sche_mgr_seq.nextval,"
		   + " '"+userid+"',"	   
		   + " '"+sche_date+"',"
		   + " '"+title+"',"
		   + " '"+view1+"',"
		   + " '"+content+"')";
	
} else if( gubun.equals("U") ) {
	sql = " UPDATE sche_mgr SET "
	    + "    title='"+title+"' "
	    + "   ,view1='"+view1+"' "
	    + "   ,content='"+content+"' "
	    + " WHERE "
	    + "       userid='"+userid+"' "
	    + "   AND to_char(sche_date,'yyyy-mm-dd')='"+sche_date+"'";
}
*/


Statement stmt = con.createStatement();
int result = stmt.executeUpdate(sql);
if( result == 1 ) {
%>
		<script>
		alert("일정등록완료!");
		location="planMain.jsp";
		</script>
<%
}
%>


