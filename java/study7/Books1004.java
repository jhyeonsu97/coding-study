package study7;

public class Books1004 {
	int price = 10000;
	String bookName;
	
	public Books1004() {
	
	}
	
	// 생성자 오버로딩
	public Books1004(String a) { // a = "자바의 첫걸음";
	bookName = a;
	
	}
	
	//  생성자 오버로딩
	public Books1004(String a, int b) {
	bookName = a;
	price = b;
		
		
	}

	public static void main(String[] args) {
		Books1004 java = new Books1004("자바의 첫걸음");
		Books1004 linux = new Books1004("리눅스 마스터",35000);
		System.out.println("My Book : "+java.bookName+", 가격 : "+java.price);
		System.out.println("Your Book : "+linux.bookName+", 가격 : "+linux.price);
		

	}

}
