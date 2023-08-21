package study9;

public class StudentInfo extends StudentVO {
	
	public int sum() {
		return getEng() + getKor();
	}
	public int avg() {
		return sum()/2;
	}

	public static void main(String[] args) {
		StudentInfo a = new StudentInfo(); // 인스턴스 객체화
		a.setName("김철수");
		a.setYear(1);
		a.setEng(90);
		a.setKor(80);
		
		int hap = a.sum();
		int avg = a.avg();
		
		System.out.println("이름 : "+a.getName());
		System.out.println("학년 : "+a.getYear());
	
		System.out.println("총합 : "+hap);
		System.out.println("평균 : "+avg);
		

	}

}
