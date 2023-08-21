package study_725;

import java.util.Scanner;

public class Test2_study10 {

	public static void main(String[] args) {
		// p98	
		String name = "감자바";
		int age = 25;
		String tel1="010", tel2="123", tel3="4567";
//		String tel1="010";
//		String tel2="123";
//		String tel3="4567";
		
		System.out.println(name);
		System.out.println(age);
		System.out.println(tel1+"-"+tel2+"-"+tel3);
		
		// p99
//		Scanner scn = new Scanner(System.in);
//		System.out.print("이름:");
//		String name1 = scn.next();
//		
//		System.out.print("나이:");
//		int age1 = scn.nextInt();
//		
//		System.out.println("이름 : "+name1)        
//		System.out.println("나이 : "+age1);
		
		// p121
		int v2 = 1;
		double v3 = 1.0;
		System.out.println(v2 == v3); // true;
		if(v2 == (int)v3) {
			// 위와 같은 방식으로 확인 하면 더 정확함
		}
		double v4 = 0.1;
		float v5 = 0.1f;
		System.out.println(v4 == v5); // false;
		System.out.println((float)v4 == v5); // true;
		System.out.println();
		
		// 여기서잠깐
//		==  : 메모리가 놓인 위치 정보의 비교
//		.equals : 실제 데이터 값의 비교
		String str1 = "홍길동";
		String str2 = "홍길동";
		String str3 = new String("홍길동");
		System.out.println(str1 == str2); // true;
		System.out.println(str1.equals(str2)); // true;
		System.out.println(str2 == str3); // false;
		System.out.println(str2.equals(str3)); // true;
		
		// p126
		int score = 85;
//		char grade = 'A'; // A or B or C
		char grade1 = (score>90)?'A':'B';
		char grade2 = (score>90)?'A':(score>80)?'B':'C';
		System.out.println(score+":"+grade2);

		
	}

}
