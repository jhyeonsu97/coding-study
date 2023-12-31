package study7;

public class Test1 {
	
	// 숫자 3개를 받아서 결과 출력
	// void : return 값이 없는 메소드
	public static void hap1(int a, int b, int c) { // 매개변수 3개 설정
		int result1 = a+b+c;
		int result2 = 0; // 방법2
		    result2 +=a;
			result2 +=b;
			result2 +=c;
		System.out.println("합계:"+result1);
		
	}
	
	// 숫자 3개를 받아서 결를 return 처리
	public static int hap2(int a, int b, int c) {
		int result = a+b+c;
		return result;
	}
	
	// 실수타입 숫자 3개 받아서 결과를 return 처리
	public static double hap3(double a, double b, double c) {
		double result = a+b+c;
		return result;
	}
	
	// 문자열 리턴
	public static String message(String name) {
		//  지역변수
		String result = name+"님 안녕하세요";
		return result;
	}
	
	
	public static void main(String[] args) {
		// 특정 메소드의 매개변수 개수와 타입이 일치해야 함
		hap1(10,20,30);
		System.out.println("결과:"+hap2(20,30,40));
		 
		// 지역변수
		int avg = hap2(20,30,40)/3;
		System.out.println("평균:"+avg);
		
		// 실수타입 출력
		System.out.println("결과:"+hap3(20,30,40));
		
		// 메세지 출력
		System.out.println("인사말:"+message("홍길동"));
		

	

	}

}
