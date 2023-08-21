package study13;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class ArrayTest4 {

	public static void main(String[] args) {
		// 풀어보기 3
		Map<String,String>map = new HashMap<String,String>();
		
		map.put("이름", "홍길동"); // (key, value)
		map.put("영어", "90");
		map.put("국어", "10");
		map.put("수학", "70");
		// 덮어쓰기
		map.put("국어", "80");

		int hap = 0;
		Iterator<String> keys = map.keySet().iterator();
		while(keys.hasNext()) { // 커서가 내려갈 공간(데이터)있는지 확인 -> 1개 이상있으면 true값 갖음
			String key = keys.next(); // 다음층으로 커서(포인터) 내림
			String value = map.get(key); // 점수 -> 낙제인지 아닌지 구별
			if(!key.equals("이름")) {
				hap += Integer.parseInt(value); // 연산
			}
		}
		int avg = hap/map.size()-1;
		System.out.println("총점 : "+hap);
		System.out.println("평균 : "+avg);
	}

}
