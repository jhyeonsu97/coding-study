package study12;

import java.util.ArrayList;
import java.util.List;

public class ArrayListTest1 {

	public static void main(String[] args) {
		String[] st = {"50","60","70"};
		
		List<String> list1 = new ArrayList<String>();
		list1.add("50");
		list1.add("60");
		list1.add("70");
		System.out.println(list1.get(0));
		System.out.println(list1.get(1));
		System.out.println(list1.get(2));
		System.out.println("list1 저장된 객체 수 : "+list1.size()); // 개수 출력
		
		List<String>list2 = new ArrayList<String>();
		list2.add("80");
		list2.add("90");
		System.out.println(list2.get(0));
		System.out.println(list2.get(1));
		list2.remove(0);
		System.out.println(list2.get(0));
		System.out.println("list2 저장된 객체 수 : "+list2.size()); // 개수 출력
		
		
		List<String>list3 = new ArrayList<String>();
//		list3.add(10,"10") // (x)
		list3.add(0,"10");
		list3.add(1,"20");
		list3.add(2,"30");
		System.out.println(list3.get(0)); // 초기 시작번호는 반드시 
		System.out.println(list3.get(1));
		System.out.println(list3.get(2));
		
		for (int i=0; i<list3.size(); i++) {
			System.out.println(i+":"+list3.get(i));
		}	
	}
}
