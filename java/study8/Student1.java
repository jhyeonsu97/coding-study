package study8;

public class Student1 {

	public static void main(String[] args) {
		// 참조클래스 참조변수 = new 생성자;
		Person1 s1 = new Person1(); // 인스턴스 처리
		s1.name="홍길동";
		s1.age=30;
		s1.height=170;
//		s1.weight=70;
		s1.setWeight(70);
		System.out.println(s1.name);
		System.out.println(s1.getAge());
		System.out.println(s1.getHeight());
//		System.out.println(s1.weight); (X)
		System.out.println(s1.getWeight());
		
		

	}

}
