package study6; // MyMath에 비슷한 예제 있음

public class MethodTest4 {

	public static void main(String[] args) {
		

//		System.out.println(ResultExam.arraySum(aa));
		
		
		int[]aa = {10,20,30,100,80};
		int max = aa[0]; 
		int min = aa[0];
		for (int i=0; i<aa.length; i++) {
			max = Math.max(max,aa[i]);
			min = Math.min(min,aa[i]);	
		} 
		System.out.println("가장 큰 값 : "+max);
		System.out.println("가장 작은 값 : "+min);
//		System.out.println("중앙 값 : "+);
		
	}
}

