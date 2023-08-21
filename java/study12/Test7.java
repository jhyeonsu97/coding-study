package study12;

public class Test7 {

	// 메소드 이름 뒤의 throws Exception은 호출한 곳에 강제의무를 건냄
	static void methodTest1() throws Exception {
		System.out.println("test"); // test
	}
	public static void main(String[] args) {
		try {
			methodTest1();
		} catch (Exception e) {
//			e.printStackTrace();
		}

	}

}
