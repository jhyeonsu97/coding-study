package study6;

public class MethodTest1 {
	
//	void 메소드는 해당칸에 직접 System.out.print 가능
//	int, string 메소드는 main칸에서 System.out.print 가능

	public static void main(String[] args) {
		roomSize(115);
		System.out.println("115평방미터는"+roomSize3(115)+"평입니다");
		System.out.println("115평방미터는"+roomSize2(115)+"평입니다");
	}
	public static int roomSize3(int size) {
		double result = size * 0.3025;
		return (int) result;
	}
	public static double roomSize2(int size) {
		double result = size * 0.3025;
		return result;
	}
	public static void roomSize(int size) { // 매개변수
		//  round(.5) / rint(.6)
		double result = size * 0.3025; //  실수이므로 일단 double로 받기
		double result1 = Math.rint(size * 0.3025);
		double result2 = Math.round(size * 0.3025);
		
		System.out.println("입력하신"+size+"평방미터는"+Math.round(result)+"평입니다");
		System.out.println("입력하신"+size+"평방미터는"+result1+"평입니다");
		System.out.println("입력하신"+size+"평방미터는"+result2+"평입니다");
		
	}

}
