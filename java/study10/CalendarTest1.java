package Study10;

import java.util.Calendar;

public class CalendarTest1 {

	public static void main(String[] args) {
//		Calendar cal = new Calendar(); 와 같음
		Calendar cal = Calendar.getInstance(); // 인스턴스화
		int year = cal.get(1);
		int month = cal.get(2)+1;
		int date = cal.get(5);
		System.out.println(year+"/"+month+"/"+date);
		
		cal.add(Calendar.DATE,40);
		year = cal.get(1);
		month = cal.get(2)+1;
		date = cal.get(5);
		System.out.println(year+"/"+month+"/"+date);
		
		
		
		int h = cal.get(Calendar.HOUR_OF_DAY);
		int mi = cal.get(Calendar.MINUTE);
		int s = cal.get(Calendar.SECOND);
		System.out.println(h+":"+mi+":"+s);
		
		System.out.println("am/pm : "+cal.get(Calendar.AM_PM));
		System.out.println("요일 : "+cal.get(Calendar.DAY_OF_WEEK));
		System.out.println("몇번째 날 : "+cal.get(Calendar.DAY_OF_YEAR));
		System.out.println("몇번째 주 : "+cal.get(Calendar.WEEK_OF_YEAR));
		System.out.println("이번달의 몇번째주 : "+cal.get(Calendar.WEEK_OF_MONTH));
		System.out.println("이번달의 마지막날 : "+cal.getActualMaximum(Calendar.DATE));
		
		

	}

}
