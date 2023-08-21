package study13;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class ArrayTest2 {
	
	public static void main(String[] args) {
		// 풀어보기 1
		Map<String,Integer> map = new HashMap<String,Integer>();
		
		// key = 영어 , value = 100
		map.put("영어", 100);
		map.put("국어", 80);
		map.put("수학", 90);
		
		int hap = 0;
		Iterator<String> keys = map.keySet().iterator();
		// keys = {"영어","국어","수학"}
		while(keys.hasNext()) { // 커서가 내려갈 공간(데이터)있는지 확인 -> 1개 이상있으면 true값 갖음
			String key = keys.next(); // 다음층으로 커서(포인터) 내림
			int value = map.get(key); // 점수
			hap += value; // hap 변수에 누적
//			System.out.println(map.get(key));
		}
		System.out.println("총점 : "+hap);
		System.out.println("평군 : "+(hap/map.size()));
		
	}
}