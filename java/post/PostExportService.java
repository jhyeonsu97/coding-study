package post;

import java.io.File;
import java.io.FileWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Scanner;

import comm.DbConnect;

public class PostExportService extends DbConnect{

	public static void main(String[] args) throws Exception {
		System.out.println("<익스포트할 자료 선택>");
		System.out.println("1.우편번호자료\n2.사원정보자료");
		Scanner scn = new Scanner(System.in);
		System.out.println("번호선택>>");
		int number = scn.nextInt();
		switch(number) {
			case 1 : postExport();
			break;
			case 2 : empExport();
			break;
			default : System.out.println("없는번호입니다");
		}
	}	
	public static void postExport()  throws Exception  {
		System.out.println("*** 우편번호정보 다운받는 중 ***");
		// DB연결+작업공간생성
		Statement stmt = Connection().createStatement();
		
		Calendar cal = Calendar.getInstance();
		long t1 = cal.getTimeInMillis();
		
//		String t1 = "123456789";
//		String t2 = t1.substring(0,5); // 0 ~ 4
//		String t3 = t1.substring(5); // 5 ~ 끝까지
		
		String t1_str = t1+""; // 숫자타입 값을 문자타입 값으로 받음
		// 파일명 제작
		String filename = "post_"+t1_str.substring(t1_str.length()-5)+".txt";
		
		// 생성파일 경로 
		String downFilePath = "c:/post/"+filename;
		
		String dir = "c:/post/";
		File fileDir = new File(dir);
		if(!fileDir.exists()) {
			fileDir.mkdir(); // make directory 메소드
		}
		
		/*
		 1. 출력 sql제작
		 2. 반복문을 이용하여 입력 내용을 특정 변수에 적재
		 3. 적재된 변수를 이용하여 파일 생성
		 */
		
		String sql = "SELECT a1, (a2||' '||a3||' '|| a4||' '||a5||' '||a6||' '||a7) addr"
				+ " FROM POST2";
		ResultSet rs = stmt.executeQuery(sql);
		String content = "";
		int cnt = 0;
		while(rs.next()) {
			String a1 = rs.getString("a1");
			String addr = rs.getString("addr");
			content += a1+","+addr+"\n";
			cnt++;
//			System.out.println(a1+","+addr);
		}
		
		File file = new File(downFilePath);
		FileWriter fw = new FileWriter(file,false);
		fw.write(content);
		fw.close();
		
		// 유닉스 시간 세팅
		cal = Calendar.getInstance();
		long t2 = cal.getTimeInMillis();
		
		System.out.println(cnt+"행");	
		System.out.println((t2-t1)/1000+"초");	
		System.out.println(downFilePath+"로 다운받았습니다.");
		
	}
	
	public static void empExport() throws Exception {
		System.out.println("*** 사원정보 다운받는 중 ***");
		// DB연결+작업공간생성
		Statement stmt = Connection().createStatement();
		
		Calendar cal = Calendar.getInstance();
		long t1 = cal.getTimeInMillis();
		
		String t1_str = t1+"";
		// 파일명 제작
		String filename = "emp_"+t1_str.substring(t1_str.length()-5)+".txt";
		
		// 생성파일 경로 
		String downFilePath = "c:/temp100/"+filename;
		
		String sql = "select e1.empno empno"
				+ "			,e1.ename ename"
				+ "			,e1.job job"
				+ "			,e2.ename mgr_name"
				+ "			,d.dname  dname"
				+ "			,e1.hiredate hiredate"
				+ "			,(to_char(sysdate,'yyyy') - to_char(e1.hiredate,'yyyy')) as year1"
				+ " from"
				+ "			emp e1, emp e2, dept d"
				+ " where"
				+ "			e1.mgr = e2.empno"
				+ " and"
				+ "			e1.deptno = d.deptno";
		
		ResultSet rs = stmt.executeQuery(sql);
		String content = "";
		int cnt = 0;
		while(rs.next()) {
			String empno = rs.getString("empno");
			String ename = rs.getString("ename");
			String job = rs.getString("job");
			String mgr_name = rs.getString("mgr_name");
			String dname = rs.getString("dname");
			String addr = rs.getString("hiredate");
			String year1 = rs.getString("year1");
			
			content += empno+","+ename+","+job+","+addr+","+mgr_name+","+dname+","+year1+"\n";
			cnt++;
//			System.out.println(a1+","+addr);
		}
		
		File file = new File(downFilePath);
		FileWriter fw = new FileWriter(file,false);
		fw.write(content);
		fw.close();
		
		// 유닉스 시간 세팅
		cal = Calendar.getInstance();
		long t2 = cal.getTimeInMillis();
		
		System.out.println(cnt+"행");	
		System.out.println((t2-t1)/1000+"초");	
		System.out.println(downFilePath+"로 다운받았습니다.");
		
	}
}
