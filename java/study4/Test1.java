package study4;

public class Test1 {

	public static void main(String[] args) {
		
		int a = 1;
		while(a<=5) {
			System.out.print(a+"");
			a++;
		} 
	System.out.println("----------------------");	
	
	int a1 = 10;
	while(a1>=1) {
		System.out.print(a1+"");
		a1--;
		}
	System.out.println("----------------------");
	
	int[] month = {1,3,5,10,12};
	
	for (int i=0; i<month.length;i++) {
		System.out.println(month[i]+"월");
	}
	System.out.println("----------------------");
	
	int idx = 0;
	while(idx<month.length) {
		System.out.println(month[idx]+"월");
		idx++;
		}
	System.out.println("----------------------");
	
	// 배열출력관련 특별 설정 : for(변수명 : 배열명){}
	for (int m:month) {
		System.out.println(m+"월");
		}
	System.out.println("----------------------");
	
	String[] str = {"aa","bb","cc"};
	for(String s : str) {
		System.out.println(s+"월");	
		}
	}
}