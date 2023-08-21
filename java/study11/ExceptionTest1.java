package study11;

public class ExceptionTest1 {

	public static void main(String[] args) {
		
		// 예제 1 (연산관련)
		int a = 10;
		int b = 20;
		System.out.println(a/b); // 0
		
		int c = 10;
		int d = 0;
		try {
		System.out.println(c/d); // 0
		} catch (Exception e) {
			System.out.println("잘못된 연산");
		}
		System.out.println("111111111");
		System.out.println();
		
		// 예제 2 (배열관련)
		int[] array1 = {11,22,33,44,55};
		try {
			System.out.println(array1[10]); // 11
		} catch (Exception e) {
			System.out.println("잘못된 배열");
		}
		System.out.println(array1[1]); // 22
		System.out.println();
		
		// 예제 3 (익셉션 에러 뒤의 실행문제)
		try {
			System.out.println(array1[0]); // 11
			System.out.println(array1[10]);
			System.out.println(array1[1]);
			
		} catch (Exception e) {
			System.out.println("잘못된 배열22");
		}
		System.out.println(array1[2]); // 33			
	}
}
