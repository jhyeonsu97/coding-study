
package study13;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class JumsuArray {
	public static void main(String[] args) {
		// ArrayList에 Map넣기
		List<Map>list1 = new ArrayList<Map>();
		
		Map<String, String> map1 = new HashMap<String,String>();
		map1.put("id", "test1");
		map1.put("eng", "90");
		map1.put("kor", "80");
		map1.put("math", "84");
		list1.add(map1);
	
		map1 = new HashMap<String,String>();
		map1.put("id", "test2");
		map1.put("eng", "80");
		map1.put("kor", "82");
		map1.put("math", "90");
		list1.add(map1);
		
		System.out.println("list 전체 : "+list1);
		System.out.println("list 행길이 : "+list1.size()); // 2
		System.out.println("list 1행 : "+list1.get(0)); // Map데이터
		System.out.println("list 2행 : "+list1.get(1));
		System.out.println("list 1행 길이 : "+list1.get(0).size()); // 4
		System.out.println("list 2행 길이 : "+list1.get(1).size());
		System.out.println();
		
		// 풀어보기 1
		for (int i=0; i<list1.size(); i++ ) {
			Map<String,String> map = new HashMap<String,String>();
			map = list1.get(i); //  각 맵을 추출
			System.out.println(list1.get(i));
			
		// 풀어보기 2
		Iterator<String> keys = map1.keySet().iterator();
		while(keys.hasNext()) {
			String key = keys.next(); // id, eng, math
			String value = map.get(key);
			System.out.println(key+":"+map.get(key));
		}
		System.out.println();	
		}
	}
}