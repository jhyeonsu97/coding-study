package study12;

public class Test3 { // 잘못된 연산 예방

	public void myRun(int a) { // 매개변수
		System.out.println("연산결과 : "+a);
	}
	public static void main(String[] args) {
		Test3 t = new Test3(); // 인스턴스화
		int result; // int result = 0; (x)
		for(int i=4; i>=-4; i--) { // 4 3 2 1 0 -1 -2 -3 -4
			try {
				result = 100/i;
				t.myRun(result);
			}catch(ArithmeticException e) {
				t.myRun(-1);
			}
		}	
	}
}
