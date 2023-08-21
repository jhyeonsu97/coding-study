package study9;

public class StudentControl{

	public static void main(String[] args) {
		int avg = 0; // 지역변수
		
		StudentImpl s1 = new StudentImpl();
		s1.setName("홍길동");
		s1.setEng(100);
		s1.setKor(99);
		
		avg = s1.sum()/2;
		
		System.out.println("이름 : "+s1.getName());
		System.out.println("총합 : "+s1.sum());
		System.out.println("평균 : "+avg);
	}

}