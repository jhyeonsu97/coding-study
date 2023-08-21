package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConnect;

public class DeptAdmin extends DbConnect {

	public static void main(String[] args) throws Exception {
		System.out.println("[ 부서정보관리 시스템 ]");
		System.out.println(" 1.부서목록\n 2.부서입력\n 3.부서변경\n 4.부서삭제");
		Scanner scn = new Scanner(System.in);
		System.out.print(" 메뉴번호>>");
		int menu = scn.nextInt();
		
		System.out.println();
		
		switch(menu) {
			case 1 : deptList();
			break;
			case 2 : deptInsert();
			break;
			case 3 : deptUpdate();
			break;
			case 4 : deptDelete();
			break;
			default : System.out.println("없는번호입니다.");
		}
	}
	public static void deptList() throws Exception {
		
		// 접속내용의 인스턴스(객체)화 = 작업공간생성
		Statement stmt = Connection().createStatement(); // 접속정보 공통 처리
		
		String sql2 = "select count(*) total from dept";
		// SQL 적용
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();  // 존재유무 + 커서를 아래로 내림
		int total = rs2.getInt("total"); //컬럼명

		String sql = "select deptno,dname,loc from dept "
				   + " order by deptno asc";
		ResultSet rs = stmt.executeQuery(sql);
		
		System.out.println("[ 부서목록 ] 총:"+total+"개");
		System.out.println("-----------------------");
		while( rs.next() ) {
			String deptno = rs.getString("deptno");
			String dname  = rs.getString("dname");
			String loc    = rs.getString("loc");
			System.out.println( deptno+","+dname+","+loc );
		}

	}
	public static void deptInsert() throws Exception {
		
		String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		String username = "c##java";
		String userpass = "1234";
		
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection(url,username,userpass);
		Statement stmt = con.createStatement();
		
		Scanner scn = new Scanner(System.in);
		System.out.println("-- 부서정보입력 --");
		
		System.out.print("1.부서번호>>");
		String deptno = scn.next();
		
		String sql2 = "select count(*) cnt from dept "
				    + " where deptno='"+deptno+"'";
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();
		int cnt = rs2.getInt("cnt");
		if( cnt > 0 ) {
			System.out.println("이미 사용중인 번호입니다.");
			System.out.println("종료합니다.");
			return; // 메소드의 종료
		}
		
		System.out.print("2.부서이름>>");
		String dname = scn.next();
		
		System.out.print("3.부서위치>>");
		String loc = scn.next();
		
		String sql = "insert into dept(deptno,dname,loc) "
				   + "values('"+deptno+"','"+dname+"','"+loc+"')";
		int result = stmt.executeUpdate(sql);
		if(result > 0) {
			System.out.println("저장완료");
		} else {
			System.out.println("저장실패");
		}
	}
	public static void deptUpdate() throws Exception {
		String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		String username = "c##java";
		String userpass = "1234";
		
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection(url,username,userpass);
		Statement stmt = con.createStatement();
		
		Scanner scn = new Scanner(System.in);
		System.out.println("-- 부서정보입력(수정) --");
		
		System.out.print("1.부서번호>>");
		String deptno = scn.next();
		
		String sql2 = "select count(*) cnt from dept "
				    + " where deptno='"+deptno+"' ";
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();
		int cnt = rs2.getInt("cnt");
		if( cnt == 0 ) {
			System.out.println("동일한 부서번호가 없습니다.");
			System.out.println("종료합니다.");
			return;
		}
		
		System.out.print("2.부서이름>>");
		String dname = scn.next();
		
		System.out.print("3.부서위치>>");
		String loc = scn.next();
		
		String sql = "update dept set dname='"+dname+"',loc='' "
				   + " where deptno='"+deptno+"' ";
		int result = stmt.executeUpdate(sql);
		if(result > 0) {
			System.out.println("변경완료");
		} else {
			System.out.println("변경실패");
		}
	
	}
	public static void deptDelete() throws Exception {
		String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		String username = "c##java";
		String userpass = "1234";
		
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection(url,username,userpass);
		Statement stmt = con.createStatement();
		
		Scanner scn = new Scanner(System.in);
		System.out.println("-- 부서정보입력(삭제) --");
		
		System.out.print("1.부서번호>>");
		String deptno = scn.next();
		
		String sql2 = "select count(*) cnt from dept "
			    + " where deptno='"+deptno+"' ";
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();
		int cnt = rs2.getInt("cnt");
		if( cnt == 0 ) {
			System.out.println("동일한 부서번호가 없습니다.");
			System.out.println("종료합니다.");
			return;
		}

		String sql = "delete from dept where deptno='"+deptno+"'";
		int result = stmt.executeUpdate(sql);
		if(result > 0) {
			System.out.println("삭제완료");
		} else {
			System.out.println("삭제실패");
		}
	}

}
