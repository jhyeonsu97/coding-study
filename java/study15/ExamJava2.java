package study15; // 확인필요

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.Scanner;

public class ExamJava2 {
	public static void main(String[] args) throws Exception {
		
		String file1 = "C:/html_test/member.txt";
		
		try {
			FileReader fr1 = new FileReader(file1);
			BufferedReader br1 = new BufferedReader(fr1);
			
			String a = ""; 
		
			int cnt = 0; 
			while (true) {
				if(((a= br1.readLine())!= null)) {
					String[] info = a.split("/");
					String id2 = info[0];
					
					System.out.print("[상세정보]\n");
					System.out.println();
					Scanner scn = new Scanner(System.in);
					System.out.print("아이디>> ");
					String id1 = scn.next();
					if (id2.equals(id1)) {
					String id = info[0];
					String birth = info[1];
					String number = info[2];	

					
					System.out.println();
					System.out.println("아이디 : "+id);
					System.out.println("출생일 : "+birth);
					System.out.println("핸드폰 : "+number);
					return;
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
