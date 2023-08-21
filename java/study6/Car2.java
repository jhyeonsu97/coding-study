package study6;

public class Car2 {
	static int speed; // 속도, 인스턴스변수
	static String carName; // 차이름, 인스턴스 메소드

	public static void speedUp() { 
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
		
		Car2 cl = new Car2();
		cl.carName = "소나타";
		cl.speed = 100;
		cl.speedUp();
		cl.speedUp();
		System.out.println("차이름:"+cl.carName+", 속도:"+cl.speed);
		
		cl.stop();
		System.out.println("차이름:"+cl.carName+", 속도:"+cl.speed);
		
		Car2 grandeur = new Car2();
		grandeur.carName="그랜저";
		grandeur.speed = 200;
		System.out.println("차이름:"+grandeur.carName+", 속도:"+grandeur.speed);
	}
}
