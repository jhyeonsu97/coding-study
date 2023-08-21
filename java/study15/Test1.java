package study15;

public class Test1 {

	public static void abc1() {
		int sum = 10+100;
		if(sum < 1000) {
		return; // 메소드 중지
		} 
		int sum2 = 10+100;
	}
	public static int abc2() {
		int sum = 10+100;
		return sum; // 메소드 중지 + 값을 던짐
		// int sum2 = 1000+10;
	}
	public static void main(String[] args) {
	
		int eng  = abc2(); // 0
	}

}
