package study14;

import java.io.File;
import java.io.FileWriter;
import java.util.Scanner;

public class FileDelete {

	public static void main(String[] args) {
		
		Scanner scn = new Scanner(System.in);
		System.out.print("UserId : ");
		String Id = scn.next();
		System.out.print("UserPass : ");
		String Pass = scn.next();
		
		
		String txt = Id+"/"+Pass+"♡\n";
		String fileName = "C:/html_test/member_info2.txt";
		try {
			// 파일 및 폴더를 인지하는 클래스
			File file = new File(fileName);
			// 파일 생성(input) 클래스
			FileWriter fw = new FileWriter(file,true); // true : 이어쓰기, false : 덮어쓰기
			// input 
			fw.write(txt);
			System.out.println("input 성공");
			fw.close();
		} catch (Exception e) {
			System.out.println("생성실패");
		}

	}

}