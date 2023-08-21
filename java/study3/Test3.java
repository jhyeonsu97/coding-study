package study3;

public class Test3 {

	public static void main(String[] args) {
		int kor = 45;
		int eng = 70;
		if (kor >= 60 && eng >=60)
			System.out.println("축합격");{
		}if ((kor >=60 && eng<60) ||
				   (kor <60 && eng >=60)) {
			System.out.println("재시험");
		}
		System.out.println("--------------------");
		
		int math = 77;
		
		String grade = "";
		
		if(math>=90) {
			grade = "A";
		}else if(math>=80) {
			grade = "B";
		}else if(math>=70) {
			grade = "C";
		}else if(math>=60) {
			grade = "D";
		}else {
			grade = "F";
		}
		System.out.println(grade +"학점입니다");
		}

	}

