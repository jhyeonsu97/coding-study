package Study10;

import java.util.Calendar;

public class UnixtimeTest3 {

	public static void main(String[] args) {
		// 풀어보기 4
		String d1 = "2023-05-01";
		String d2 = "2023-06-23";
		
		String[] ar1 = d1.split("-");
		int yy1 = Integer.parseInt(ar1[0]);
		int mm1 = Integer.parseInt(ar1[0]);
		int dd1 = Integer.parseInt(ar1[0]);
		
		String[] ar2 = d1.split("-");
		int yy2 = Integer.parseInt(ar1[0]);
		int mm2 = Integer.parseInt(ar1[0]);
		int dd2 = Integer.parseInt(ar1[0]);
		
		Calendar cal = Calendar.getInstance();
		cal.set(yy1,mm1-1,dd1); // d1
		long u1 = cal.getTimeInMillis()/1000;
		
		cal.set(yy2, mm2, dd2); // d2
		long u2 = cal.getTimeInMillis()/1000;
//							long타입 - long타입 이므로 int타입으로 변환
		int result = (int)((u2 - u1)/(60*60*24)); // 하루에 해당하는 초로 나눠줌
		System.out.println(d1+"과"+d2+"의 차이는 "+result+"일 입니다");
		
		
		
		
	}

}
