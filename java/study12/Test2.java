package study12;

public class Test2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a = 100;
		int b = 0;
		int[] c = {10,20,30};
		String d = "abc";
		System.out.println(c[1]); // 정상출력
		
//		ArithmeticException
//		ArrayIndexOutOfBoundsException
//		NumberFormatException
//		StringIndexOutOfBoundsException
		
		try {
//		System.out.println(a/b); // zero error
//		System.out.println(c[7]); // 자리번호 error
//		
		System.out.println(c[0]);
		System.out.println(Integer.parseInt(d)); // 형변환 error
		System.out.println(c[2]); // 출력안됨
		
		System.out.println(d.charAt(5)); // 문자열 자리번호 error
		} catch(ArithmeticException e) {
			System.out.println("zero 오류가 발생했습니다");
		} catch(ArrayIndexOutOfBoundsException e) {
			System.out.println(" 자리번호 오류가 발생했습니다");
		} catch(NumberFormatException e) {
			System.out.println("형변환 오류가 발생했습니다");
		} catch(StringIndexOutOfBoundsException e) {
			System.out.println("문자열 자리번호 오류가 발생했습니다");
		} catch(Exception e) {
			System.out.println("오류가 발생했습니다");
			
			
		}
		System.out.println(d.charAt(0)); // 정상출력
	}
}