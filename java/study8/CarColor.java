package study8;

class CarInfo{
	
	String carName;
	int velocity;
	String carColor;
	
}


public class CarColor extends CarInfo{
	// 생성자
	public CarColor(String color, String name, int speed) {
		carName = name;
		velocity = speed;
		carColor = color;
	}
	
	public static void main(String[] args) {
		CarColor cc = new CarColor("White", "Sonata",100);
		System.out.println(cc.carName+":"+cc.velocity+":"+cc.carColor);

	}

}
