package emp;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConnect;

public class EmpInsert extends DbConnect {

	public static void main(String[] args) throws Exception {

		// DB연결 및 접속인스턴스 생성
		Statement stmt = Connection().createStatement();
		
		Scanner scn = new Scanner(System.in);
		System.out.println("[ 사원정보입력 ]");
		System.out.print("사원번호>>");
		String empno = scn.next();
		
		String sql1 = "select count(*) cnt from emp "
				    + " where empno='"+empno+"' ";
		ResultSet rs1 = stmt.executeQuery(sql1);
		
		int cnt = 0;
		if( rs1.next() ) {
			cnt = rs1.getInt("cnt");
		} else {  // sql 적용오류
			return; // 메소드 종료
		}
		if( cnt > 0 ) {
			System.out.println("이미 사용중인 사원번호입니다.");
			return;  // 메소드 종료
		} 
		
		System.out.print("사원이름>>");
		String ename = scn.next();
		
		System.out.print("업무>>");
		String job = scn.next();
		
		System.out.print("매니저번호>>");
		String mgr = scn.next();

		System.out.print("입사일(0000-00-00)>>");
		String hiredate = scn.next();
		
		System.out.print("급여>>");
		String sal = scn.next();
		
		System.out.print("커미션>>");
		String comm = scn.next();
		
		System.out.print("부서번호>>");
		String deptno = scn.next();

		String sql2 = "insert into emp"
				    + " (empno,ename,job,mgr,hiredate,sal,comm,deptno) "
				    + " values('"+empno+"','"+ename+"','"+job+"','"+mgr+"','"+hiredate+"','"+sal+"','"+comm+"','"+deptno+"')";
		// SQL적용
		int result = stmt.executeUpdate(sql2);
		if( result == 1 ) {
			System.out.println("저장완료");
		} else {
			System.out.println("저장실패");
		}
	}
}
