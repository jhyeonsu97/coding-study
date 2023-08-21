package Study10;

import java.util.Calendar;
import java.util.Scanner;

class Test6 {

	public static void main(String[] args) {
//		랜덤으로 1 ~ 100 사이의 값 생성
//		시스템이 얻은 값을 메추는 문제
//		0.0000111 -> 0 , 0.99999*100 -> 99.9999
		int r = (int)(Math.random()*10)+1; // 0~1 사이의 값을 얻는 메소드
		Scanner scn = new Scanner(System.in);
		
		Calendar cal = Calendar.getInstance(); // 캘린더클래스 사용할 수 있는 상태 만들기
		long u1 = cal.getTimeInMillis();
		
		
		int cnt = 0;
		while(true) {
		System.out.println("숫자입력>>");
		int a = scn.nextInt();
		if(r==a) {
			System.out.println(a+"입력, 정답입니다~");
			break;
		} else {
			System.out.println(a+"입력, 오답입니다~");
			
		}
		cnt++;
		if(cnt == 20) break;
	}
		cal = Calendar.getInstance();
		long u2 = cal.getTimeInMillis();
		long result = (u2-u1);
		System.out.println("시간 : "+(result/1000)+"초 걸렸습니다~");
	}
}
