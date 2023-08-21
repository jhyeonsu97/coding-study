package study13;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class ArrayTest3 {

	public static void main(String[] args) {
		// 풀어보기 2
		Map<String,Integer>map = new HashMap<String,Integer>();
		// key = 영어 , value = 100
		map.put("영어", 50);
		map.put("국어", 40);
		map.put("수학", 70);
			
		int hap = 0;
		String str = ""; // 낙제과목명 적재
		Iterator<String> keys = map.keySet().iterator();
		// keys = {"영어","국어","수학"}
		while(keys.hasNext()) { // 커서가 내려갈 공간(데이터)있는지 확인 -> 1개 이상있으면 true값 갖음
			String key = keys.next(); // 다음층으로 커서(포인터) 내림
			int value = map.get(key); // 점수 -> 낙제인지 아닌지 구별
			if (value<60) {
				str += key+","; // 누적해서 연결처리 / str = "영어,국어,";
			}
			hap += value; // hap 변수에 누적 , 실제 연산처리
		}
		int str_len = str.length();
		str = str.substring(0,str.length()-1);
							//str_len
		double avg = (double)hap/(double)map.size();
			
		String avg1 = avg+""; // 형변환 숫자 -> 문자
		String [] avg2 = avg1.split("\\.");
		// avg2[0] = "53"; avg2[1] = "3333333336";
		String avg3 = avg2[0]+"."+avg2[1].substring(0,1);
			
			
		System.out.println("총점 : "+hap);
		System.out.println("평군 : "+avg3);
		System.out.println("낙제과목 : "+str);
	}
}


