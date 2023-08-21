package study2;

public class Test3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 문자열 타입의 배열, 숫자 타입의 배열
		String[] colors= {"blue", "yellow", "green"};
		
		byte[] a1 = {50, 60, 70};
		short[] a2 = {60, 90, 100};
		int[] a3 = {98, 88, 92};
		long[] a4 = {1000L, 3000L, 5000L};
		
		System.out.println(a1); // 정상출력 x
		System.out.println(a1[0]+","+a1[1]+","+a2[2]);
		System.out.println("long : "+a4[0]); // 1000
		
		float[] f1 = {70.7f, 44.7f, 100.0f};
		System.out.println("float : "+f1[0]); // 70.7
		double[] d1 = {77.7, 33.12, 99.5};
		double d2 = 12;
		System.out.println("double : "+d2); // 12.0
		
		System.out.println(colors[0]);
		System.out.println(colors[1]);
		System.out.println(colors[2]);
		
		int[] score = {90,80,88,10,30,80,76};
		int sum = score[0]+score[1]+score[3]+score[4]+score[5]+score[6];
		int avg = sum/score.length;
		System.out.println("합계 :"+sum);
		System.out.println("평균 :"+avg);
		
	}

}
