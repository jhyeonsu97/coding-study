package study5;

public class Test1 {

	public static void main(String[] args) {
		// 풀어보기 3
		String jumsu = "eng:70,kor:90,math:88";
//		String [] jj = {"eng:70,kor:90,math:88"};
		String [] jj = jumsu.split(",");
		for(int i=0; i<jj.length; i++) {
			System.out.println(jj[i]);
		}
		System.out.println("--------------------------");
		
		// 풀어보기 4
		for(int i=0; i<jj.length; i++) {
			// math : 88 -> {"math","88"}
			System.out.print(jj[i].split(":")[1]+" ");
		}
		System.out.println();
		System.out.println("--------------------------");
		
		// 풀어보기 5
		String birthday = "1990/05/27";
		// 90년 5월 27일 생
		// String[] bb = {"1990","05","27"};
		String[] bb = birthday.split("/"); 
		String yy = bb[0].substring(2); // 1950
//		String mm = bb[1].substring(0); // 05
		String mm = bb[1].charAt(1)+""; // 문자 1개 
//		char 타입 string 타입으로 변환하고자 할 때 + "" 붙이면 됨
//		char a1 = 'a'; // 문자타입이지만 string과는 구별됨
//		char a2 = 's';
		String dd = bb[2];
		System.out.println(yy+"년 "+mm+"월 "+dd+"일 생");
		System.out.println("--------------------------");
		
		// 풀어보기 6
		String str = "java";
		System.out.println(" "+str.substring(0,1)); // 0~0
		System.out.println("  "+str.substring(1,2)); // 1~1
		System.out.println("   "+str.substring(2,3)); // 2~2
		System.out.println("    "+str.substring(3,4)); // 3~3
		
		for(int i=0; i<str.length(); i++) { // 0~3, 4자리 반복
			for(int j=0; j<i; j++) {
				System.out.print(" ");
			}
			System.out.println(str.substring(i,i+1));			
		}
		System.out.println("--------------------------");
	}
}
