package Study10;

import java.util.Calendar;

public class CalendarTest2 {

	public static void main(String[] args) {
		
		Calendar cal = Calendar.getInstance();
		
		cal.set(2021, 11, 25);
		int yy = cal.get(Calendar.YEAR);
		int mm = cal.get(Calendar.MONTH)+1;
		int dd = cal.get(Calendar.DATE);
		
		// 1(일) ~ 7(토)
		int ww = cal.get(Calendar.DAY_OF_WEEK);
		String str = "";
		switch(ww){
			case 1 : str = "일";
			break;
			case 2 : str = "일";
			break;
			case 3 : str = "일";
			break;
			case 4 : str = "일";
			break;
			case 5 : str = "일";
			break;
			case 6 : str = "일";
			break;
			case 7 : str = "일";
			break;

		}
		
		System.out.println("날짜 : "+yy+"/"+mm+"/"+dd);
		System.out.println("요일 : "+ww);

	}

}
