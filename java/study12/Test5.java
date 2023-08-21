package study12;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Test5 { // 숫자 맞추기 게임

	public static void main(String[] args) {
		
		int answer = (int)(Math.random()*100)+1;
		int input = 0; // 사용자 값
		int count = 0; // 회수 계산 값
		Scanner scn;
		while(true) { // 조건없이 무한반복
			try {
				count++;
				scn = new Scanner(System.in);
				System.out.println("1~100 insert");
				
				input = scn.nextInt();
				// if (시스템값 > 사용자 값)
				if(answer>input) {
					System.out.println("more big");
				} else if(answer<input) {
					System.out.println("more small");
				} else {
					System.out.println("ok~~");
					System.out.println(count+"회에 맞춤");
					break; // 반복문 종료
				}
			} catch(InputMismatchException e) { // 정수 입력 체크 예외처리
				System.out.println("숫자만 입력해 주세요");
			}
		}

	}

}
