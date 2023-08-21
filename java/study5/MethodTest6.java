package study5;

public class MethodTest6 {
	
	public static void main(String[] args) {
		int eng = 90;
		int kor = 88;
		mySum(eng,kor);
		myAvg(eng,kor);
	}
	public static void mySum(int eng,int kor) {
		int hap = eng + kor;
		System.out.println(hap);
	}
	public static void myAvg(int eng,int kor) {
	int avg = (eng + kor)/2;
	System.out.println(avg);
	}
}

