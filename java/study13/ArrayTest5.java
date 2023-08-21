package study13;

import java.util.ArrayList;
import java.util.List;

public class ArrayTest5 {

	public static void main(String[] args) {
		// 풀어보기 4
		List<String> list1 = new ArrayList<String>();
		list1.add("50");
		list1.add("60");
		list1.add("70");
		
		int hap = 0;
		for (int i=0; i<list1.size(); i++) {
			int value = Integer.parseInt(list1.get(i));
			hap += value;
		}
		int avg = hap/list1.size();
		System.out.println("합계 : "+hap);
		System.out.println("평균 : "+avg);
	}

}
