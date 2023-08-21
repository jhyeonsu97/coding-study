package study12;

public class Test4 { // 잘못된 배열 세팅 예방

	public static void main(String[] args) {
		String[] name = new String[2];
		try {
			name[0]="딸기";
			System.out.println("이름 : "+name[0]);
			name[1]="사과";
			System.out.println("이름 : "+name[1]);
			name[2]="오렌지";
			System.out.println("이름 : "+name[2]);
		}
		catch(ArrayIndexOutOfBoundsException e){
			System.out.println("배열 참조 에러 발생");
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
			System.out.println("시스템종료");
		}
	}

}
