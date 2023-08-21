package study1;

public class Test12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println((100>100)?"참":"거짓");
		System.out.println("--------------");
		
		String result = (10%2==0)?"참":"거짓";
		System.out.println("result : " + result);
		System.out.println("--------------");
		
		int apple = 88;
	    String result2 = (apple>80)?"A등급":"B등급";
		// int result2 = (apple>80)? 1 : 0;
		System.out.println("사과의 당도는 " + apple + "으로 " + result2 + "입니다.");

	}

}
