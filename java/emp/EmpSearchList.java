package emp;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConnect;

public class EmpSearchList extends DbConnect {


	public static void main(String[] args) throws Exception {
		System.out.println("[사원검색 시스템]");
		System.out.println("1.사원명\n2.부서별\n3.업무별\n4.매니저별\n5.급여별");
		Scanner scn = new Scanner (System.in);
		System.out.println("메뉴번호>>");
		int menu = scn.nextInt();
		System.out.println();
		
		
		switch(menu) {
		case 1 : empNameSearch();
		break;
		case 2 : empDeptSearch();
		break;
		case 3 : empJobSearch();
		break;
		case 4 : empMgrSearch();
		break;
		case 5 : empSalSearch();
		break;
		default : System.out.println("없는번호");
		
		}		
	}
     


public static void empNameSearch() throws Exception {
	// DB연결 + 객체화(메모리 공간확보)
	Statement stmt = Connection().createStatement();
	Scanner scn = new Scanner(System.in);
	System.out.println("사원명>>");
	String ename = scn.next();
	
//	String sql = "select empno \n"
//				+"      ,job \n"
//				+"      ,sal \n"
//				+"      ,mgr \n"
//				+"      ,deptno \n"
//				+"      ,(select ename from emp where empno=e.mgr)mgr_name \n"
//				+"      ,(select dname from dept where deptno=e.deptno) dname \n"
//				+" from emp e \n"
//				+" where \n"
//				+"        e.ename=UPPER('"+ename+"')";
	// System.out.println(sql); sql 확인하는 용도
	
	String sql = "select e1.empno as empno"
			+ "	,e1.ename as ename"
			+ "	,e1.job as job"
			+ "	,e1.sal as sal"
			+ "	,e1.mgr as mgr"
			+ "	,e1.deptno as deptno"
			+ "	,e2.ename as mgr_name " // 매니저이름
			+ "	,d.dname as danme " // 부서이름
			+ "from emp e1, dept d, emp e2"
			+ "where"
			+ "	e1.mgr = e2.empno"
			+ "and"
			+ "	e1.deptno=d.deptno"
			+ "and"
			+ "	e1.ename = upper('"+ename+"')";
	
	// SQL을 DB에 적용
	ResultSet rs = stmt.executeQuery(sql);
	int cnt = 0;
	while(rs.next()) { // 한 행씩 가져옴
		cnt++; // 증가
		String empno = rs.getString("empno");
		String job = rs.getString("job");
		String sal = rs.getString("sal");
		String mgr = rs.getString("mgr");
		String deptno = rs.getString("deptno");
		String mgr_name = rs.getString("mgr_name");
		String dname = rs.getString("dname");
		
		System.out.println("1.사원명:" + ename + "("+empno+")");
		System.out.println("2.업무:" + job);
		System.out.println("3.급여:" + sal);
		System.out.println("4.매니저:"+mgr_name);
		System.out.println("5.부서:" + dname);
	}
	if(cnt == 0) {
		System.out.println("검색 결과가 없습니다.");
	}
}

public static void empDeptSearch() throws Exception {
	Statement stmt = Connection().createStatement();
	Scanner scn = new Scanner(System.in);
	System.out.print("부서명>>");
	String dname = scn.next();

	String sql = "select"
			+ "  e.empno"
			+ ", e.ename"
			+ ", e.job"
			+ ", d.dname"
			+ "	from emp e, dept d "
			+ "where "
			+ "	e.deptno = d.deptno "
			+ "and"
			+ "	d.dname =upper('"+dname+"')";
                                                          
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()) {
		String empno = rs.getString("empno");
		String ename = rs.getString("ename");
		String job	 = rs.getString("job");
		dname		 = rs.getString("dname");
		System.out.println(empno+","+ename+","+job+","+dname);
	}
}

public static void empJobSearch() throws Exception {
	Statement stmt = Connection().createStatement();
	Scanner scn = new Scanner(System.in);
	System.out.print("업무명>>");
	String job = scn.next();
	
	String sql = "select"
			+ "  e.empno"
			+ ", e.ename"
			+ ", e.job"
			+ ", d.dname"
			+ "	from emp e, dept d "
			+ "where "
			+ "	e.deptno = d.deptno "
			+ "and"
			+ "	e.job =upper('"+job+"')";
	
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()) { // 출력내용의 존재여부
		String empno = rs.getString("empno");
		String ename = rs.getString("ename");
		job		 	 = rs.getString("job"); // 선언 지우고 재사용
		String dname = rs.getString("dname");
		
		System.out.println(empno+","+ename+","+job+","+dname);
	}
}

public static void empMgrSearch() throws Exception {
	Statement stmt = Connection().createStatement();
	Scanner scn = new Scanner(System.in);
	System.out.print("매니저명>>");
	String mgr_name = scn.next();
	
	String sql = "select"
			+ "  e1.empno empno" // as 생략
			+ ", e1.ename ename"
			+ ", e1.job   job"
			+ ", e1.mgr   mgr"
			+ ", e2.ename mgr_name"
			+ "	from emp e1, emp e2 " // 매니저 이름이 e2에만 있음
			+ "where "
			+ "	e1.mgr = e2.empno " // join
			+ "and"
			+ "	e2.ename =upper('"+mgr_name+"')";
	
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()) { // 출력내용의 존재여부
		String empno = rs.getString("empno");
		String ename = rs.getString("ename");
		String job	 = rs.getString("job"); // 선언 지우고 재사용
		String mgr   = rs.getString("mgr");
		mgr_name	 = rs.getString("mgr_name");
		
		System.out.println(empno+","+ename+","+job+","+mgr+","+mgr_name);
		
	}
}


public static void empSalSearch() throws Exception {
	
}
}

