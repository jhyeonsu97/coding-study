package study5;

public class MathTest1 {

	public static void main(String[] args) {
		
		// ceil() : 올림메소드(소수점아래)
		System.out.println(Math.ceil(98.2)); // 99.0
		System.out.println(Math.ceil(98.7)); // 99.0
		
		// floor() : 내림메소드(소수점아래)
		System.out.println(Math.floor(98.2)); // 98.0
		System.out.println(Math.floor(98.7)); // 98.0
		
		// round() : 반올림메소드(소수점아래) >> 0.5기준
		System.out.println(Math.round(98.2)); // 98
		System.out.println(Math.round(98.4)); // 98
		System.out.println(Math.round(98.5)); // 99
		System.out.println(Math.round(98.7)); // 99
		
		// rint(() : 반올림메소드(소수점아래) >> 0.6기준
		System.out.println(Math.rint(98.2)); // 98.0
		System.out.println(Math.rint(98.4)); // 98.0
		System.out.println(Math.rint(98.5)); // 98.0
		System.out.println(Math.rint(98.2)); // 98.0
		System.out.println(Math.rint(98.6)); // 99.0
		System.out.println(Math.rint(98.7)); // 99.0
		
		// abs() 메소드 : 절대값 변환, 음수 부호 없애줌
		System.out.println(Math.abs(-98)); // 98
		System.out.println(Math.abs(98)); // 98

		// pow() 메소드 : 제곱(승)수
		System.out.println(Math.pow(10,2)); // 10 x 10
		System.out.println(Math.pow(10,3)); // 10 x 10 x 10
		
		// sqrt() 메소스 : 제곱급(루트)
		System.out.println(Math.sqrt(100)); // 10.0
		System.out.println(Math.sqrt(25)); // 5.0
		
		// max(), min() : 최대값, 최소값
		System.out.println(Math.max(10,20)); // 20
		System.out.println(Math.min(10,20)); // 10
		System.out.println(Math.max(10,
						   Math.max(20,
						   Math.max(30,40)))); 
		
		// 난수발생 (임의의 수 발생) : 0초과~1미만
		System.out.println(Math.random()); 
		System.out.println(Math.random()*100); 
		System.out.println((int)(Math.random()*100)); 
		
		int n1 = (int)(Math.random()*100); // 정수타입 변수 = 실수타입 값(x)
		System.out.println(n1);
		// 0.0000000000121 * 100 -> 0
		// 0.0000002323322 * 100 -> 0
		// 0.9999999999999 * 100 -> 99
		// 0.4512121212121 * 100 -> 45
		
		// 1 ~ 100
		int n2 = (int)(Math.random()*100)+1;
		System.out.println(n2);
		
		// 1 ~ 45
		// 0.9999999999999 * 45 -> 44.xxxx
		int n3 = (int)(Math.random()*45)+1;
		System.out.println(n3);		
		
	}
}
