package study_725;

public class Test1_study10 {

	public static void main(String[] args) {
		int hour = 3;
		int minute = 5;
		System.out.println(hour+"시간 "+minute+"분");
		
		int totalMinute = (hour*60) + minute;
		System.out.println("총 "+totalMinute+"분");
		
		// p55
		int v1 = 15;
		int v2 = 0;
		if(v1>10) {
//			int v2;
			v2 = v1 - 10; // v2 = 5;
			int v7 = 1000;// (O)
		}
		int v3 = v1 + v2 + 5;
		System.out.println("v3값은"+v3+"입니다.");
		
		// p58
		int sum; // int sum = null;
		int score1 = 0;
		int score2; // score2 = null; (무존재, 재정의는 가능)
//		sum=score1+score2; // score2는 null값이기 때문에 
		sum = score1+100;
		
		// p66
		System.out.println("번호\t이름\t직업"); // \t : tap
		System.out.print("행 단위 출력\n\n"); //\n:개행
		System.out.print("행 단위 출력\n\n");
		
		System.out.println("우리는 \"개발자\" 입니다.");
		// 네스케이프 문자 활용
		System.out.println("봄\\여름\\가을\\겨울"); // \는 뒤에오는 문자 무력화
	}
}
