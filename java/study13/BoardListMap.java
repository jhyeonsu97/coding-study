package study13;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class BoardListMap {
	
	public static void test1(List<Map> list) {
		int hap = 0;
		for(int i=0; i<list.size();i++) {
//			list.get(i);
//			System.out.println(list.get(i)); // 하나하나 나열
			String rdate = (String)list.get(i).get("rdate");
			String hit = (String)list.get(i).get("hit");
			
			rdate = rdate.replace("-", "");
			list.get(i).put("rdate", rdate);
			
			int hit2 = Integer.parseInt(hit)+100;
			list.get(i).put("hit", hit2);
			hap += hit2;
		}
		System.out.println(list);
		System.out.println("총 조회수 : "+hap+"건");
		System.out.println("총 조회수 : "+hap/list.size()+"건");
	}

	public static void main(String[] args) {
		
		List<Map> list = new ArrayList<Map>();
		Map<String,String> board = new HashMap<String,String>();
		board.put("no","1");
		board.put("hit","35");
		board.put("rdate","2021-05-01");
		board.put("name","홍길동");
		board.put("title","공지사항1");
		list.add(board);
		
		board = new HashMap<String,String>();
		board.put("no","2");
		board.put("hit","3");
		board.put("rdate","2021-05-05");
		board.put("name","제임스");
		board.put("title","공지사항2");
		list.add(board);
		
		System.out.println(list); // 전체 나열
		
		test1(list);
		
//		int hap = 0;
//		for(int i=0; i<list.size();i++) {
////			list.get(i);
////			System.out.println(list.get(i)); // 하나하나 나열
//			String rdate = (String)list.get(i).get("rdate");
//			String hit = (String)list.get(i).get("hit");
//			
//			rdate = rdate.replace("-", "");
//			list.get(i).put("rdate", rdate);
//			
//			int hit2 = Integer.parseInt(hit)+100;
//			list.get(i).put("hit", hit2);
//			hap += hit2;
//		}
//		System.out.println(list);
//		System.out.println("총 조회수 : "+hap+"건");
//		System.out.println("총 조회수 : "+hap/list.size()+"건");
		
	}
}