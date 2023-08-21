package study6; //  혼자 푼 것(확인필요함) 

public class MyMath2_Test {

	public static void main(String[] args) {
		 int[] eng = {90,80,98,56};
		 System.out.println("영어 1등:"+MyMath2.arrayIntMax(eng));
		 System.out.println("영어 꼴등:"+MyMath2.arrayIntMin(eng));
		 

	}
	public static int arrayIntMax (int [] eng) {
		int max = eng[0];
		for (int n : eng) {
			max = Math.max(max,n);
		}
		return max;
	}
	public static int arrayIntMin (int [] eng) {
		int min = eng[0];
		for (int n : eng) {
			min = Math.min(min,n);
		}
		return min;
		}

}
