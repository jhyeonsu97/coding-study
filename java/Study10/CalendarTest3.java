package Study10;

import java.util.Calendar;

public class CalendarTest3 {
	
	public static void calView(String ym) {
		
		// ym = "2023-12";
		
		

		// 인스턴스(객체)화
		Calendar cal = Calendar.getInstance();
		
		
		String[] ym2 = ym.split("-");
		// ym2[0]= "2023"; ym[1] = "12";
		int yy = Integer.parseInt(ym2[0]);
		int mm = Integer.parseInt(ym2[1]);
		
		// 출력날짜 세팅
		cal.set(yy,mm-1,1); // 2023-03-01
	
		// 세팅된 날짜의 요일을 얻음
		int week = cal.get(Calendar.DAY_OF_WEEK); // 4(수)
		// 세팅된 달의 마지막 날짜를 얻음
		int lastDay = cal.getActualMaximum(Calendar.DATE); // 31 
		// 날짜 출력시 한줄에 7칸을 맞추는 용도
		int ln = 0;
		
		System.out.println("("+yy+"년"+mm+"월"+")");
		
		// 달력의 첫날(1일) 출력전의 공백발생
		for(int w=1; w<week; w++) {
			System.out.print("\t");
			ln++;
		}
		// ln = 3 까지 실행
		
		for(int d= 1; d<=lastDay; d++) {
		
			if (d<10) {
				 System.out.print(" ");
			} 
			System.out.print(d+"일\t");
			ln++; // d=1 , ln=1, d=2, ln=2
			 
			if(ln==7) {
			 System.out.println(); // 개행
			 ln = 0;
			}
		}
	}

	public static void main(String[] args)  {
		 
		calView("2023-12");
		
	}	
}
