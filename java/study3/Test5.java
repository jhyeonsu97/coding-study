package study3;

import java.util.Scanner;

public class Test5 {

	public static void main(String[] args) {
		
		Scanner scn = new Scanner(System.in);
		
		int a = 10;
		int b = 20;
		int result = 0;
		System.out.print("연산자 입력>>");
		String s= scn.next(); // 콘솔 화면에 문자열 입력가능 상태
		switch(s) {
		case "+" : result = a + b ;
		break;
		case "-" : result = a - b ;
		break;
		case "*" : result = a * b ;
		break;
		case "/" : result = a / b ;
		break;
		default : 
		}
		System.out.print(a+s+b+"="+result);
		
		}	
	}



