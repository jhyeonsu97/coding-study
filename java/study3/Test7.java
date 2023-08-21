package study3;

import java.util.Calendar;
import java.util.Scanner;

public class Test7 {

	public static void main(String[] args) {
		System.out.println("---풀어보기 1---");
		for(int i=1; i<4; i++) {
			if (i==3) {
				System.out.println("문항"+i+"오답");
			}else { 
				System.out.println("문항"+i+"정답");
			}
		}
		
		System.out.println("---풀어보기 2---");
		Calendar cal = Calendar.getInstance();
		int yy = cal.get(Calendar.YEAR);
		for (int i=2021; i<=2025; i++) {
			if (i==2023) {
			System.out.print("("+i+")년");
		}else {
			System.out.print(i+"년");
		}
	}

	}
}
