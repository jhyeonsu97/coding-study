package study6;

class Score {
	// 멤버변수, 인스턴스(객체)변수
	int kor;
	int eng;
}

public class VariableExam {

	public static void main(String[] args) {
		
		Score a = new Score();
		a.kor = 80;
		a.eng = 90;

		System.out.println("국어:"+a.kor+",영어:"+a.eng+",평균:"+(a.kor+a.eng)/2);
	}

}
