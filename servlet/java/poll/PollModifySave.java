package poll;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DbConnect;

/**
 * Servlet implementation class PollWriteSave
 */
// 어노테이션 : 주석
@WebServlet("/PollModifySave")
public class PollModifySave extends HttpServlet {
       
	/**
	 * @see 설문저장
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
								throws ServletException, IOException {
		
		Connection con = DbConnect.oracleCon();
		
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("utf-8");
		
		String code = request.getParameter("mainCode");
		String title = request.getParameter("title");
		String[] item = request.getParameterValues("item"); // 배열형식
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String use = request.getParameter("use"); // null , N
		
		if( title == null || title.trim().equals("")) {
			out.print(" <script> "
					+ " alert('제목을 입력해주세요.');"
					+ " history.back(); "
					+ " </script> ");
			return;
		}
		if( use == null ) use = "Y";
		
		try {
		
		// UPDATE로 변경
		String sql1 = "UPDATE pollmain SET"
				+ " title='"+title+"'"
				+ " ,sdate='"+sdate+"'"
				+ " ,edate='"+edate+"'"
				+ " ,use='"+use+"' "
				+ " WHERE "
				+ " code='"+code+"' ";
			Statement stmt = con.createStatement();
			int result = stmt.executeUpdate(sql1);
			
			// SUB 테이블의 DELETE SQL, code like '1001%'
			String sql_del = "DELETE FROM pollsub "
							+ " WHERE code LIKE '"+code+"%' ";
			stmt.executeUpdate(sql_del);
			
			// SUB 테이블의 INSERT SQL
			int cnt = 0;
			if( result == 1 ) { // 메인저장 완료
				for(int i=0; i<item.length; i++) {
					String n = "";
					if(item[i] != null && !item[i].trim().equals("")) {     
						cnt++;
						n = ((cnt<10)?"0":"")+cnt;
						String sql2 = "INSERT INTO pollsub(code,item) "
								+ "VALUES("
								+ "'"+(code+n)+"',"
								+ "'"+item[i]+"'  )";
						stmt.executeUpdate(sql2);
					}
				}
			}
			if( result == 1 && cnt > 0 ) {
				out.print("<script>"
						+ "	alert('설문이 변경되었습니다.');"
						+ " location = 'poll/pollList.jsp'; "
						+ "</script>");
			}
			
		} catch (Exception e ) { }
	}
}


