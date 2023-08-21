package study3;

import java.util.Scanner;

public class Test8 {

	public static void main(String[] args) {

		System.out.println("---풀어보기3---");
		
		Scanner scn = new Scanner(System.in);
		
		System.out.print("단 입력>>");
		int dan = scn.nextInt();
		for(int i=1; i<=9; i++) {
			System.out.println(dan+"x"+i+"="+(dan*i));
		}
			
		System.out.println("---풀어보기4---");
		
		System.out.print("별개수 입력>>");
		int cnt = scn.nextInt();// nextInt() 메소드
		for(int i=0; i<cnt; i++) {
			System.out.println("*");
		
		}
	}
}
