package study2;

import java.util.Scanner;

public class Test8 {

	public static void main(String[] args) {
		Scanner scn = new Scanner(System.in);
		System.out.println("= 드시려는 커피번호를 입력해주세요. =");
		System.out.println("1.아메리카노");
		System.out.println("2.다방커피");
		System.out.print("* 커피번호 >> ");
		int n1 = scn.nextInt();
		if( n1 == 1) {
		     System.out.println("= 아메를 선택했습니다. =");
		     System.out.println("1.설탕넣기");
		     System.out.println("2.설탕없음");
		     System.out.print("*설탕번호>>");
		     n1 = scn.nextInt();
		     if(n1 == 1) System.out.println("단맛의 아메를 선택했습니다.");
		     else if(n1 == 2) System.out.println("설탕없는 아메를 선택했습니다.");
		     else System.out.println("없는 번호입니다.");		 
		     
		} else if( n1 == 2) {
		     System.out.println("= 다방을 선택했습니다. =");
		     System.out.println("1.프림1+설탕1(연한맛");
		     System.out.println("2.프림2+설탕2(단맛)");
		     System.out.println("3.프림3+설탕3(아주단맛)");
		     System.out.print("*번호선택>>");
		     n1 = scn.nextInt();
		     if(n1 == 1) System.out.println("연한맛의 커피를 선택했습니다.");
		     else if(n1 == 2) System.out.println("단맛의 커피를 선택했습니다.");
		     else if(n1 == 3) System.out.println("아주단맛의 커피를 선택했습니다.");
		     else System.out.println("없는 번호입니다.");
		     
		} else {
		     System.out.println("없는 번호입니다.");
		}
	}
}