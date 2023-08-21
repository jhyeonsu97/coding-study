package study1;

public class Study8_Student3 {
// 캡슐화 : 접근지정자
// 접근지정자는 내부 접근일 경우는 의미 없음, 철저히 외부 접근에 대한 제어	
	public String name;		// 같은 패키지(o), 다른 패키지(o); 전체허용 (o)
	protected int height;	// 같은 패키지(o), 다른 패키지(x); 전체허용 (o)
	int age;				// 같은 패키지(o), 다른 패키지(x); 전체허용 (x)
	private int weight;		// 같은 패키지(x), 다른 패키지(x); 전체허용 (x)
	void abc() {
		name = "호돌이";  // 내부접근(o)
		height = 300;	// 내부접근(o)
		age = 15;		// 내부접근(o)
		weight = 200;	// 내부접근(o)
	}
}
