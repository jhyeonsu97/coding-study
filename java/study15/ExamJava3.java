package study15; // 확인필요

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Scanner;

public class ExamJava3 {

	public static void main(String[] args) throws Exception {
		
		String file1 = "C:/html_test/member.txt";
		
		try {
			FileReader fr1 = new FileReader(file1);
			BufferedReader br1 = new BufferedReader(fr1);
			
			String a = ""; 
	
			while (true) {
				if(((a= br1.readLine())!= null)) {
					String[] info = a.split("/");
					System.out.print("[상세정보]\n");
					System.out.println();
					Scanner scn = new Scanner(System.in);
					System.out.print("아이디>> ");
					String id1 = scn.next();
					if (a.contains(id1)) {
						System.out.println(a.replaceAll("\\s+", "")); 
					}
				}
				 else {
					 System.out.println("미등록 아이디 입니다");
					 break;
				 }
			} 
		} catch(Exception e) {}
	}
}
