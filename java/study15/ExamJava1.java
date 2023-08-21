package study15; // 확인필요

import java.io.BufferedReader; 
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Scanner;

public class ExamJava1 {
	
	public static void main(String[] args) throws Exception {
		
		String file1 = "C:/html_test/member.txt";
		String rowData = "";
		String saveData = "";
		
		try {
			FileReader fr1 = new FileReader(file1);
			BufferedReader br1 = new BufferedReader(fr1);
			
			String a = ""; 
			
			int cnt = 0; 
			while (true) {
				if(((a= br1.readLine())!= null)) {
					saveData += rowData+"\n";
					cnt++;
					String[] info = a.split("/");
			
					String id = info[0];
					String birth = info[1];
					String number = info[2];
					String birth1 = info[1].substring(0,4);
					int age = 2023-Integer.parseInt(birth1)+1;

					System.out.println("-----------------------------------------------");
					System.out.print("[회원목록]\n");
					System.out.println("-----------------------------------------------");
					System.out.println("아이디"+"\t\t"+"출생년도(나이)"+"\t"+"핸드폰");
					System.out.print(id+"\t");
					System.out.print(birth1+"("+age+")"+"\t");
					System.out.print(number+"\t");
					break;
					}
				 else break;
			} 
		} catch(Exception e) {}
	}
}
