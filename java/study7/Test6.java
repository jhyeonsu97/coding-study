package study7;

public class Test6 {
	
	int a = 10; // 멤버변수, 인스턴스변수
	
	// 생성자 : 이름의 첫글자가 반드시 대문자
	// 		  호출불가(일반 메소드처럼 사용불가) ex)t2.Test6("abc"); (x)
	
	public Test6() { // 생성자의 기본
		System.out.println("=Test6 클래스의 객체화=");
	}
	// 생성자 다형성 > 오버로딩
	public Test6(String a) { // 매개변수
		System.out.println("=Test6 클래스의 인스턴스화=");
	}

	public static void main(String[] args) {
//		Test6 t1 = new Test6();
		Test6 t2 = new Test6("abc"); // 인스턴스화
		
		
//		System.out.println(t1.a); // 10
	}

}
