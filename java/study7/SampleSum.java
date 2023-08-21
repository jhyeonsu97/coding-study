package study7;

public class SampleSum {

	// 다형성 > 오버로딩 : 같은 이름의 메소드를 매개변수의 개수와 타입으로 달리하여 생성하는 기법 
	
	public void sum() {
		System.out.println(10+10);
	}
	
	public void sum(int a) {
		System.out.println(a+10);
	}
	
	public void sum(String a) {
		System.out.println(a+10);
	}
	
//	public void sum(int b) {		>> 변수명 달라도 타입 같으면 사용못함
//		System.out.println(b+10);
//	}
	
	public void sum(int a, int b) {
		System.out.println(a+b);
	}
	
	public void sum(int a, int b, int c) {
		System.out.println(a+b+c);
	}
	
	public void sum(String str, int a, int b) {
		System.out.println(str);
		System.out.println(a+b);
	}

	public static void main(String[] args) {
		
		SampleSum s = new SampleSum();
		s.sum();
		s.sum(10,20);
		s.sum(30,50,100);

	}

}
