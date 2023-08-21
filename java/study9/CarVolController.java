package study9;

public class CarVolController {

	public static void main(String[] args) {
		CarVolMake carAudio = new CarVolMake();
		System.out.println(carAudio.getvolLevel());
		carAudio.volUp(30); // 30
		System.out.println(carAudio.getvolLevel());
		carAudio.volDown(5); // 25
		System.out.println(carAudio.getvolLevel());
		carAudio.volPause(); // 0
		System.out.println(carAudio.getvolLevel());
		carAudio.volResume(); // 25
		System.out.println(carAudio.getvolLevel());
		carAudio.volOff(); // 0
		System.out.println(carAudio.getvolLevel());
		

	}

}
