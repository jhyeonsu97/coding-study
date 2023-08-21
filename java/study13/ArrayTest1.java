package study13;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class ArrayTest1 {

	public static void main(String[] args) {

		// 배열
		// ArrayList, HashMap
		List<String> list1 = new ArrayList<String>(); // 인스턴스 생성
		list1.add("100"); // index : 0
		list1.add("90"); // index : 1
		System.out.println(list1.get(0));
		System.out.println();
	
		List<Integer> list2 = new ArrayList<Integer>(); 
		list2.add(20);
		list2.add(80);
		System.out.println();
		
		List<Double> list3 = new ArrayList<Double>(); 
		list3.add(20.3);
		list3.add(80.77);
		System.out.println(list3); // 전체 타입, 값 출력
		System.out.println(list3.get(1));
		System.out.println(list3.size()); // 요소개수
		System.out.println();
		
		String[] a1 = {"aa","bb","cc"};
		System.out.println(a1); // 전체 타입, 값 출력
		System.out.println(a1[0]);
		System.out.println(a1.length); // 요소개수
		System.out.println();
		
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("0","abc");
		map1.put("1", "bb");
		map1.put("2", "cc");
		System.out.println(map1);
		System.out.println(map1.get("1"));
		System.out.println(map1.size());
		System.out.println();
		
		Map<String,String> map2 = new HashMap<String,String>();
		map2.put("userid","test123");
		map2.put("pass", "123456");
		map2.put("birthday", "2020-12-25");
		System.out.println(map2);
		System.out.println(map2.get("pass"));
		System.out.println(map2.size());  
		System.out.println();
		
		// ArrayList (반복문)출력
		// 인덱스번호를 이용한 출력
		for(int i=0; i<list1.size();i++) {
			System.out.println("list["+i+"] : "+list1.get(i));
		}
		System.out.println();
		
		// 배열 (반복문) 출력
		// 인덱스번호를 이용한 출력
		for(int i=0; i<a1.length;i++) {
			System.out.println("배열["+i+"] : "+a1[i]);
		}
		System.out.println();
		
		// Map (반복문) 출력
		Iterator<String> keys = map2.keySet().iterator();
		// keys = {"userid","pass","birthday"};
		while(keys.hasNext()) { // 다음 존재유무
//			keys.next(); // 키값을 하나하나 가져옴
			String key = keys.next();
			System.out.println(key+":"+map2.get(key));
			
		}	
	}
}


