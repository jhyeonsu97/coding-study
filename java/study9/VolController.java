package study9;

public class VolController {

	public static void main(String[] args) {
		VolMake tv = new VolMake(); // 인스턴스화
		VolMake radio = new VolMake(); // 인스턴스화
		
		System.out.println(tv.getVolLevel()); // 1
		System.out.println(radio.getVolLevel()); // 1
		tv.volUp(10);
		radio.volUp(30);
		System.out.println(tv.getVolLevel()); // 11
		System.out.println(radio.getVolLevel()); // 31 
		tv.volDown(5);
		radio.volDown(20);
		System.out.println(tv.getVolLevel()); // 6
		System.out.println(radio.getVolLevel()); // 11

	}

}
