package study9;

class Program1{ // 부모
	public void pgName() {
		System.out.println("JAVA");
	}
}
class Program2 extends Program1{ // 상속, 자식
	public void pgName() { // 오버라이딩
		System.out.println("JSP");
	}
	public void programAll() {
		super.pgName(); // super : 상속 관계일 경우 부모클래스를 지명
		this.pgName();
		
	}
}

public class SuperThisExam {

	public static void main(String[] args) {
//		참조클래스 참조변수 = new 생성자
//		Program1 a = new Program1();
		Program2 p2 = new Program2(); // 인스턴스처리
//		a.pgName();
		p2.pgName(); // JSP
		p2.programAll(); // JAVA, JSP
	}

}
