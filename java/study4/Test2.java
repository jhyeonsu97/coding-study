                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                package study4;

import java.util.Scanner;

public class Test2 {

	public static void main(String[] args) {

		// Scanner scn = new Scanner(System.in); 위에 입력해도 무관
		
		while (true) { //  조건없는 반복문
			Scanner scn = new Scanner(System.in);
			System.out.print("양수를 입력해 주세요.(종료:-1>>");
			int number = scn.nextInt(); // 엔터치면 라인에 대한 종료 
			if(number==-1) {
				System.out.print("반복문을 종료합니다.");
				break;
			} else if(number>=0) {
				System.out.print(number +"을 입력했습니다");
			}	
		}
	}
}