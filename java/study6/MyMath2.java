package study6;

import java.util.Arrays;

public class MyMath2 {

	public static void main(String[] args) {
		int[] a1 = {57,11,33,55,77,17};
		
		System.out.println("a1배열의 최대값:"+arrayIntMax(a1));
		System.out.println("a1배열의 최소값:"+arrayIntMin(a1));
		System.out.println("a1배열의 중앙값:"+arrayIntCenter(a1));
	
//		int max = a1[0];
//		int min = a1[0];
//		for (int n : a1) {
//			max = Math.max(max, n);
//			min = Math.min(min, n);
//		}
	}
	public static int arrayIntMax (int [] n1) {
		int max = n1[0];
		for (int n : n1) {
			max = Math.max(max,n);
		}
		return max;
	}
	public static int arrayIntMin (int [] n1) {
		int min = n1[0];
		for (int n : n1) {
			min = Math.min(min,n);
		}
		return min;
		}
	public static int arrayIntCenter(int[] n1) {
		Arrays.sort(n1);		// 순차적정렬
		int len  = n1.length; 	// 배열개수
		int center = len/2; 	// 중앙번호
		int result = 0;
		if (len %2 == 0) { 		// 배열개수가 짝수일 경우
			result = (n1[center-1]+n1[center])/2;
		} else {
			result = (n1[center]);
		} 
		return result;
		
//		 짝수일 경우
//		 n1 = {11,17,33,55,55,77}
//		 6/2->3
//		 int result = (n1[2]+n1[3])/2;
//		 result result;
//		 홀수일 경우
//		 n2 = {11,17,33,55,55,77}
//		 5/2->2
//		 int result = n1[2];
//		 result result;
		 
	}
}

