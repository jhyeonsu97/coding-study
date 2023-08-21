package study6;

class BookInfo {
	int price = 10000;
	String title = "자바기초";
	
}

public class ObjectTest1 {
	int a = 10;
	int b = 20;

	public static void main(String[] args) {
		
		// Scanner scn = new Scanner(System.in);
		// 참조클래스 참조변수 = new 생성자
		ObjectTest1 t1 = new ObjectTest1();
		System.out.println(t1.a + t1.b);
		
		BookInfo info = new BookInfo(); // 인스턴스(객체)화
		System.out.println(info.title+":"+info.price);
		
		
		

	}

}
