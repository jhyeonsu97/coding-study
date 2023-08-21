package study6;

public class MyMath1 {

	public static void main(String[] args) {
		double a1 = 12.12345712;
		double result1 = myPoint(a1,2); // 12.12 둘째자리까지 표현
		double result2 = myPoint(a1,3); // 12.123
		double result3 = myPoint(a1,4); // 12.1234
		System.out.println(result1);
		System.out.println(result2);
		System.out.println(result3);
		
		// 2자리 -> a1*100; 1212.345712
		// 		-> 1212/100 -> 12.12
		// 3자리 -> a1*1000; -> 12123.45712
		//		-> 12123/1000 -> 12.123
		// 4자리 -> a1*10000;
		//		-> 12123/10000 -> 12.1234
		
		int a2 = (int)(a1*1000);
		double a3 = a2/(double)1000; 
		System.out.println(a3);
		
		System.out.println(Math.pow(10, 3)); // 10^3
	}		
					 //	 myPoint(a1,2) -> 2자리값
	public static double myPoint(double a1, int p1) {
//		p1 = 1 ->100, p1 = 3 ->1000
//		int a2 = (int)(a1*100);
//		double a3 = a2/(double)100;
		
		int a2 = (int)(a1*Math.pow(10, p1));
		double a3 = a2/(double)Math.pow(10, p1);
		
		return a3;
		
	}
}
