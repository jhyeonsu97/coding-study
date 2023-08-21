package study8;

class Person2 {
	int age;
	public String name;
	protected int height;
	private int weight;

	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
	this.weight=weight;
	}
}
public class Student2 extends Person2{
	public void dataSet() {
		age = 30;
		name = "홍길동";
		height = 175;
		setWeight(70);
	}

	public static void main(String[] args) {
		Student2 s1 = new Student2();
		s1.dataSet(); // 변수 값 부여
		// \n : 줄바꿈 (개행)
		System.out.println("나이 : "+s1.age+"\n이름 : "+s1.name+"\n키 : "+s1.height+"\n몸무게 : "+s1.getWeight());
	}

}
