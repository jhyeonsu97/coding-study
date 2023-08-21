package study12;

public class LstNmChk {
	// 멤버변수, 클래스, 상수변수(재정의 불가)
	public static final String[] LastNmArr = {"김","이","박"};
	
	// return 없는 메소드, 호출된 곳에 예외처리의 강제의무 부과
	void checkLastNm(String lastName) throws InvalidNmException {
		if(!IsLastNm(lastName)) { // false가 왔을 때 예외처리 하겠음
			throw new InvalidNmException();
		}
	}
	// 접근지정자 리턴타입 메소드명(매개변수)
	private boolean IsLastNm(String str) { // String str = "최";
		boolean tf = false;
		for(int i=0; i<LastNmArr.length;i++) {
			if(LastNmArr[i].equals(str)) {
				tf = true;
				// 같은 성이 존재하는 경우, false를 던지고 메소드 종료
			}
		}
		// 같은 성이 존재하지 않는 경우
		return tf;
	}	
}
