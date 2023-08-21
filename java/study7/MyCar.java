package study7;

public class MyCar {
	int maxSpeed;
	String carName;
	String carColor;

	public MyCar(String carName, int maxSpeed) {
		this.carName = carName;
		this.maxSpeed = maxSpeed;
	}
	
	public MyCar(String carName, int maxSpeed, String carColor) {
		this.carName = carName;
		this.maxSpeed = maxSpeed;
		this.carColor = carColor;
	}
	
	public void maxSpeedUpdate(int speed) {
		// speed = -20;
		this.maxSpeed += speed;
	}
	
	public static void main(String[] args) {
		MyCar car1 = new MyCar("소나타",230);
		MyCar car2 = new MyCar("그랜저",300,"white");
		System.out.println(car1.carName+":"+car1.maxSpeed);
		System.out.println(car2.carName+":"+car2.maxSpeed+":"+car2.carColor);
		car1.maxSpeedUpdate(-20);
		System.out.println(car1.carName+":"+car1.maxSpeed);
	}
}                                                                                                                                                                                                                                                                       
