package Study10;

import java.util.Calendar;

public class UnixtimeTest1 {

	public static void main(String[] args) {
		Calendar cal = Calendar.getInstance();
		long unix = cal.getTimeInMillis();
		
		System.out.println(unix);

		long unix2 = 1183772828546L;
		cal.setTimeInMillis(unix2);
		
		int yy = cal.get(Calendar.YEAR);
		int mm = cal.get(Calendar.MONTH)+1;
		int dd = cal.get(Calendar.DATE);
		System.out.println(yy+"/"+mm+"/"+dd);
	}

}
