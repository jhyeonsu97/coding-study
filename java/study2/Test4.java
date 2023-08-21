package study2;

public class Test4 {

	public static void main(String[] args) {
		
		int[][]engs = {{30,80,90},{60,70,90}};
		System.out.println(engs[0][0]); // 30
		System.out.println(engs[0][1]); // 80
		System.out.println(engs[0][2]); // 90
		
		System.out.println(engs[1][0]); // 60
		System.out.println(engs[1][1]); // 70
		System.out.println(engs[1][2]); // 90
		
		System.out.println("------------");
		
		int [][] kors = {{30,80,90},{60,70,90},{50,20,70,50}};
		int [][][] scores = {{{70,90,50}},{{50,20,70}}};
		System.out.println();
		
//		3차원 배열
//		예) 전교 -> 1학년 2개반, 		2학년 3개반 세팅
//					{{{},{}}	, 	{{},{},{}}}
		int [][][] school =  {{{30,80,90},{50,20,70}},
							  {{70,90,50},{80,90,40},{70,90,80}}};
//		2학년 2반 1번 학생 점수
		System.out.println(school[1][1][0]); // 80
		
//		1학년 1반 3번 학생 점수
		System.out.println(school[0][0][2]); // 90
		
//		2학년 3반 2번 학생 점수
		System.out.println(school[1][2][1]); // 90
		
		
		}
	}

