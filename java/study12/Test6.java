package study12;

public class Test6 {

	public static void methodTest1() {
		
		try {
		// new : 일부러 Exception 발생시킬 때의 키워드
			throw new Exception("헐~~");
//			System.out.println(Integer.parseInt("aa"));
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public static void main(String[] args) {
		methodTest1();

	}

}
