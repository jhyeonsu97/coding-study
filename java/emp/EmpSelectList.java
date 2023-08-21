package emp;

import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class EmpSelectList extends DbConnect {

	public static void main(String[] args) throws Exception {

		// 인스턴스(객체)처리 = 작업 위해서 메모리에 공간 발생
		Statement stmt = Connection().createStatement();
		String sql1 = "select count(*) as total from emp";
		// query 적용
		ResultSet rs1 = stmt.executeQuery(sql1);
		int total = 0;
		if( rs1.next() ) {
			// 컬럼명을 통해 해당 요소에 접근
			total = rs1.getInt("total");
		} else {
			return; // 메소드 종료
		}
		String sql2 = "select empno"
					+ "		 ,ename"
					+ "		 ,job"
					+ "		 ,mgr"
					+ "		 ,to_char(hiredate,'yyyy-mm-dd') hiredate "
					+ "		 ,sal"
					+ "		 ,comm"
					+ "		 ,deptno "
					+ " from emp "
					+ " order by empno asc";
		ResultSet rs2 = stmt.executeQuery(sql2);
		
		System.out.println("[ 사원목록 ]");
		System.out.println("총 : " + total+"개");
		System.out.println("----------------------------");
		int number = 0;
		while( rs2.next() ) {
			String empno    = rs2.getString("empno");
			String ename    = rs2.getString("ename");
			String job 	    = rs2.getString("job");
			String mgr      = rs2.getString("mgr");
			String hiredate = rs2.getString("hiredate");
			String sal 	    = rs2.getString("sal");
			String comm     = rs2.getString("comm");
			String deptno   = rs2.getString("deptno");
			
			number++;
			
			System.out.println( number+". "+empno+","+ename+","+job+","+mgr+","
							   +hiredate+","+sal+","+comm+","+deptno);
		}	
	}
}
