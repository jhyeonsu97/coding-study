package study7;

public class Test7 {
	
	// 생성자, 다형성(오버로딩)
	
	public Test7(boolean a) { //  기본(작성하지 않아도 있는 것으로 봄)
		
	}
	
	public Test7(int b) {
		
	}
	
	public Test7(String c) {
		
	}

	public static void main(String[] args) {
		
		new Test7 (true);
		new Test7 (1);
		new Test7 ("java");
		

	}

}
