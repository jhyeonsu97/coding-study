package study3;

import java.util.Scanner;

public class Test4 {

	public static void main(String[] args) {
		int number = 12;
		
		if ((number%2==0) && (number%10==0)) {
			System.out.println("짝수이고 10의 배수입니다");
		}else if((number%2==0) && (number%10!=0)) {
			System.out.println("짝수이고 10의 배수가 아닙니다");
		}else if(number%2==1) {
			System.out.println("홀수입니다");
			
		}
		System.out.println("--------------------");
		
		Scanner scn = new Scanner(System.in);
		System.out.print("숫자 입력 : ");
		
		int nb = scn.nextInt();
		
		if (nb>=1 && nb<=10) {
			System.out.println("입력된 값은"+nb+"로 1페이지범위에 있습니다");
		} else if (nb>=11 && nb<=20) {
			System.out.println("입력된 값은"+nb+"로 2페이지범위에 있습니다");
		} else if (nb>=21 && nb<=30) {
			System.out.println("입력된 값은"+nb+"로 3페이지범위에 있습니다");
		} else {
			System.out.println("잘못된 숫자를 입력하셨습니다");
			
//		int n3 = 145;
//		int page = (n3/10)+1;
//		System.out.println("입력된 값은"+n3+"로"+page+"페이지 입니다.");
		
		}
		
	}
}
