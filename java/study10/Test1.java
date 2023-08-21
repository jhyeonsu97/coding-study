package Study10;

interface Test2{ // 추상화
	public int hap(); // 메소드의 명세화
}
class Test3 implements Test2 { // 상속
//	메소드 밖에 있는 변수 : 멤버변수 / 인스턴스(객체) 변수
	String name; // 캡슐화
	private int eng;
	private int kor;
//	맴버변수, 클래스 변수(전역변수)
//	ex) static String title;
	
	public int hap() { // 다형성 > 오버라이딩
		return eng+kor;
	}
	
	public int hap(int a, int b) { //다형성 > 오버로딩 : 매개변수 달리해서 표현
		return a+b;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}
	
}

public class Test1 extends Test3{

	public static void main(String[] args) {
// 	  참조클래스 참조변수 = new 생성자		
		Test1 test1 = new Test1(); // 인스턴스(객체)처리
		test1.setName("홍길동");
		test1.setEng(60);
		test1.setKor(100);
		
		System.out.println(test1.getName());
		System.out.println("합계 : "+test1.hap()+"평균 : "+test1.hap()/2);
		

	}

}
