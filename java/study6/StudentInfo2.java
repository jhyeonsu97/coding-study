package study6;

public class StudentInfo2 {

	public static void main(String[] args) {
	 
	//  참조클래스 참조변수 = new 생성자; 
		Calc calc = new Calc();
		calc.score1 = 70;
		calc.score2 = 80;
		System.out.println("score1="+calc.score1);
		System.out.println("score2="+calc.score2);
		System.out.println("합계="+calc.hap());
		

	}

}
