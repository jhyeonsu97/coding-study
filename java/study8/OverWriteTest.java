package study8;

class JavaView{
	public void viewName() {
		System.out.println("자바프로젝트");
	}
	String viewSeoul() { // void 없기 때문에 return 키워드 반드시 필요
		return "강남";
	}
}

class OracleView extends JavaView {
	// 오버라이딩(상속관계에서 상위 클래스의 메소드를 다시 정의하는 기법)
	public void viewName() { // 상위 클래스의 메소드를 덮어씀
		System.out.println("오라클프로젝트");
	}
	// 오버로딩(같은 이름의 메소드를 매개변수를 달리하여 작성하는 기법)
	public void viewName(String a) { 
		System.out.println("오라클프로젝트");
	}
	String viewBusan() {
		return "부산";
	}
}
public class OverWriteTest {
	public static void main(String[] args) {
//		JavaView a = new JavaView();
		OracleView oracle = new OracleView();
		oracle.viewName(); // 오라클프로젝트
		System.out.println(oracle.viewSeoul());
		System.out.println(oracle.viewBusan());
		
}
}
