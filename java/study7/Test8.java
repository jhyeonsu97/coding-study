package study7;

import java.util.Calendar;

public class Test8 {

	public static void main(String[] args) {
		my_sum(10,20,30);
		System.out.println("합계2 : "+my_sum2(10,20,30));
		String str1="우리 모두의 백과 사전";
		String str2= remove_space(str1);
		System.out.println("공백제거 : "+str2);
		split_number(97.123); // 직접출력(내부출력
		split_jumin("981225-1234567");
	}
	// 1번 메소드
	public static void my_sum(int a, int b, int c) {
		System.out.println("합계1 : "+(a+b+c));
	}
	//2번 메소드
	public static int my_sum2(int a, int b, int c) {
		return (a+b+c);
	}
	//3번 메소드
	public static String remove_space(String str) {
		// str = "우리 모두의 백과사전"
		String result = str.replace(" ", ""); // (old,new)
		return result;
	}
	//4번 메소드
	public static void split_number(double a) {
		//a = 97.123
		String b = a+""; // 형변환 : 숫자 > 문자 / b = "97.123";
		String[] ar1 = b.split("\\.");
		System.out.println("정수 : "+ar1[0]+"/ 실수 : 0."+ar1[1]);
	}
	//5번 메소드
	public static void split_jumin(String str) {
		//str = "981225-1234567";
		String a1 = str.substring(0,2); // 98
		String a2 = str.substring(2,4); // 12
		String a3 = str.substring(4,6); // 25
		String a4 = str.substring(7,8); // 1
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int age = year - Integer.parseInt("19"+a1);
		
		System.out.println("나이:"+age);
		System.out.println("성별:"+((a4.equals("1")||a4.equals("3"))?"남성":"여성")); // 숫자이지만 String이기 때문에 ""사용
		System.out.println("생일:"+a2+"월"+a3+"일");

	}
}
