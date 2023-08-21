package study1;

import study8.Person1;

public class Study8_Student1 {

	public static void main(String[] args) {
		Person1 s1 = new Person1(); // 인스턴스 처리
		s1.name="홍길동"; // public
//		s1.age=30;		// 생략
//		s1.height=170;	// protected
//		s1.weight=70;	// private
		s1.setWeight(70);
		
	}

}
