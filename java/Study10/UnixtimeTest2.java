package Study10;

import java.util.Calendar;

public class UnixtimeTest2 {
	// 모든 클래스에서 접근할 수 있고 클래스명으로 접근하는 메소드
	public static int doomDay(String date) {
		// 3번 예제
		Calendar cal_1 = Calendar.getInstance();
		
		// 지금 시간의 유닉스 시간(초단위)
		long u1 = cal_1.getTimeInMillis()/1000;
		
		// date = "2023-12-25";
		String[] str = date.split("-");
		// str[0]="2023"; str[1]="12"; str[2]="25";
		// String -> int 변환
		int yy = Integer.parseInt(str[0]);
		int mm = Integer.parseInt(str[1]);
		int dd = Integer.parseInt(str[2]);
		cal_1.set(yy,mm-1,dd);
		// 사용자가 보내준 시점의 유닉스 시간(초단위)
		long u2 = cal_1.getTimeInMillis()/1000;
		
		int r1 = (int)((u2-u1)/(60*60*24));
		
		return r1;
	}


	public static void main(String[] args) {
		
/*		1. 크리스마스 D-day
 		1000/1000 -> 1
 		a = (지금 시점의 유닉스 시간)/1000
 		b = (크리스마스 시점의 유닉스 시간)/1000
 		
 		b-a / 하루(초)=60*60*24 => 답	
*/
		// 1번 예제
		Calendar cal_1 = Calendar.getInstance();
		long u1 = cal_1.getTimeInMillis()/1000;
		
		cal_1.set(2023,11,25);
		long u2 = cal_1.getTimeInMillis()/1000;
		int r1 = (int)((u2-u1)/(60*60*24));
		
		System.out.println("크리스마스는"+r1+"일 남았습니다"); // 1번 예제
		
		System.out.println("크리스마스는"+doomDay("2023-12-25")+"일 남았습니다"); // 3번 예제
		
	}

}
