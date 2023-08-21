package study7;

public class Test2 {
	
	// 인스턴스 변수
	int a = 0;
	int b = 0;
	int c = 0;
	// 클래스(공유, 전역) 변수
	static int d = 0;
	
	// 인스턴스 메소드
	public int sum1() {
		int result = a+b+c;
		return result;
	}
	// 클래스(공유, 전역) 메소드
	public static int sum2() {
		int result = d+100;
		return result;
	}
	
	public static void main(String[] args) {
		// 김철수(90,80,70), 홍길동(70,78,88)
		
		Test2 kim = new Test2(); // 인스턴스화(객체화)
		Test2 hong = new Test2();
		
		kim.a = 90;
		kim.b = 80;
		kim.c = 70;
		
		hong.a = 70;
		hong.b = 78;
		hong.c = 88;
		
		System.out.println("김의 합계 : "+kim.sum1());
		System.out.println("홍의 합게 : "+hong.sum1());
		
//		int hap = Test1.hap2(90,80,70);
//		int avg = Test1.hap2(90,80,70)/3;
//		System.out.println("김의 합계 : "+hap);
//		System.out.println("김의 평균 : "+avg);
//		
//		hap = Test1.hap2(70,78,88);
//		avg = Test1.hap2(70,78,88)/3;
//		System.out.println("홍의 합계 : "+hap);
//		System.out.println("홍의 평균 : "+avg);
	}

}
