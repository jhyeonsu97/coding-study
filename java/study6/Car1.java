package study6;

public class Car1 {
	static int speed; // 속도, 클래스변수
	static String carName; // 차이름

	public static void speedUp() { // 클래스메소드
		speed++;
	}
	public static void speedDown() {
		speed--;
		if(speed < 0) {
			stop();	
		}
	}
	public static void stop () {
		speed = 0;
	}
	public static void main(String args[]) {
		carName = "소나타";
		speed = 100;
		speedUp(); // 101
		speedUp(); // 102
		System.out.println("차이름:"+carName+",속도"+speed);
		stop();
		System.out.println("차이름:"+carName+",속도"+speed);
		
		carName = "그랜저";
		
	}
}
