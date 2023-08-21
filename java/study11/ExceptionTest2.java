package study11;

public class ExceptionTest2 {
	
	public static void main(String[] args) {
		
		// 예제 4 (ArithmeticException)
		int n1 = 10;
		int n2 = 0;
		int[] n3 = {11,22};
		try {
			int result = n1/n2; // error
			System.out.println(n3[10]);
		} catch(ArithmeticException e) {
			System.out.println("zero error");
		}
		System.out.println();
		
		// 예제 5 (ArrayIndexOutOfBoundsException)
		String[] pgName = {"JAVA","PHP","ASP"};
		int i = 0;
		while(i<5) { // 0 ~ 4
			try {
				if(i==4) System.out.println(i/0);
				else 	 System.out.println(pgName[i]);
			} catch (ArrayIndexOutOfBoundsException e) {
				System.out.println("array exception");
			} catch (Exception e) {
				System.out.println("zero error");
			} finally {
				System.out.println("finally");
			}
			i++;
		}

	}

}
