package study8;

public class SeasonView1 extends Season1{
	// 여름의 설정을 바꾼다. (이름 : Summer, 시작월 : 6, 마지막월 : 8, 평균온도 : 32)
	// 다형성 > 오버라이딩 (상위클래스의 메소드를 같은 이름으로 재구성)
	
	public void summer() {
		name = "Summer";
		firstMonth = 6;
		lastMonth = 8;
		avgTemp = 42;
	}

	public static void main(String[] args) {
		SeasonView1 ss = new SeasonView1();
		ss.summer();
		ss.seasionPrint();

	}

}     
