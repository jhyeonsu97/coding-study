package study5;

public class MathTest2 {

	public static void main(String[] args) {
		int n1 = 1000;
		int n2 = 1200;
		System.out.println("max :"+Math.max(n1,n2)+"/ min :"+Math.max(n1,n2));
		System.out.println("-----------------------");
		
		int[] a2 = {90,80,-40};
		System.out.println("총합 :"+(a2[0]+a2[1]+Math.abs(a2[2]))+"/ 평균 :"+(a2[0]+a2[1]+Math.abs(a2[2]))/3);
		int hap = 0;
		for(int i=0; i<a2.length; i++) {
			hap += Math.abs(a2[i]);
		}
		int avg = hap/a2.length;
		System.out.println("총합 :"+hap+"/ 평균 :"+avg);
		System.out.println("-----------------------");
		
		int[] a1 = {5,45,23,2,34,21};
		int max = a1[0]; // 일단 위의 변수중에 아무거나 설정
		int min = a1[0];
		for (int i=0; i<a2.length; i++) {
			max = Math.max(max,a1[i]);
			min = Math.min(min,a1[i]);	
		}
		System.out.println("최대값 :"+max+"/ 최소값 :"+min);
		
		System.out.println("최대값 :"+Math.max(a1[0],
									Math.max(a1[1],
									Math.max(a1[2],
									Math.max(a1[3],
									Math.max(a1[4],a1[5])))))
							+"/ 최소값 :"+Math.min(a1[0],
									+ Math.min(a1[1],
									+ Math.min(a1[2],
									+ Math.min(a1[3],
									+ Math.min(a1[4],a1[5]))))));
		System.out.println("-----------------------");
		
		for(int i=0; i<6; i++) {
			System.out.print((int)(Math.random()*45)+1);
			System.out.print(" ");
		}
		System.out.println();
		System.out.println("-----------------------");
			
//			연구 : 중복되지 않는 숫자들로 세팅한다.
//			난수 1 -> {난수1, 		}
//			난수 2 -> 이전값들과 비교 후 {난수1, 난수2}
//				  -> 동일한 값이 있는 경우 다시 새로운 난수 2발생
//			난수 3 -> 이전값들과 비교 후 {난수1, 난수2, 난수3}
//				  -> 동일한 값이 있는 경우 다시 새로운 난수3 발생
//			  :
//			난수 6 입력수 break;
			
			int[] lotto = new int[6];
		 // int [] lotto= {0,0,0,0,0,0};
			int idx = 0;
			while(true) {
				boolean b1 = false;
				int number = (int)(Math.random()*45)+1;
				for(int i=0; i<6; i++) {
					if(number == lotto[i]) b1 = true;
				}
				if (b1 == false) { // 동일한 값이 없는 경우
					lotto[idx] = number;
				}else {
					continue; // 하단 내려가지 말고 올라가서 반복문 다시 실행 (즉시)
				}
				idx++;
				if(idx==6) break;
			}
			for(int i : lotto) {
				System.out.print(i+" ");
			}
	}
}



