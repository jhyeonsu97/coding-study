package study12;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class HashMapTest1 {

	public static void main(String[] args) {
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("a", "11"); // put(key, value); put(column,value);
		map1.put("b", "22");
		map1.put("c", "33");
		
		System.out.println(map1);
		System.out.println(map1.get("a"));
		System.out.println(map1.get("b"));
		System.out.println(map1.get("c"));
		
		Map<String, Integer> map2 = new HashMap<String,Integer>();
		map2.put("a", 11);
		map2.put("b", 22);
		map2.put("c", 33);
		
		System.out.println(map2);
		System.out.println(map2.get("a"));
		System.out.println(map2.get("b"));
		System.out.println(map2.get("c"));
		
		Map<Integer, String> map3 = new HashMap<Integer,String>();
		map3.put(5, "11");
		map3.put(11, "22");
		map3.put(17, "33");
		
		System.out.println(map3);
		System.out.println(map3.get(5));
		System.out.println(map3.get(11));
		System.out.println(map3.get(17));
		
		String key="";
		String value="";
		
//		iterator : 반복적인 내용의 값을 담을 때 사용
//		key 정보 반환 (포인터가 데이터 보다 위)
		Iterator<String>keys = map1.keySet().iterator();
		while(keys.hasNext()) { // 다음출력할 내용의 존재유무
			key=keys.next(); // 출력할 내용 추출
			value=map1.get(key);
			System.out.println(key+":"+value);
//			System.out.println(map1.get(key));
		}

	}

}
