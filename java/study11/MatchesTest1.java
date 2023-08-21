package study11;

public class MatchesTest1 {

	public static void main(String[] args) {
		
		// 예제 1 (임의의 문자가 한개 이상 있는지 체크)
		String title = "a";
		String pattern = ".+";
		System.out.println(title.matches(pattern)); // true;
		System.out.println();
		
		// 예제 2 (특정 문자로 시작하는지 체크)
		String color1 = "red"; // true;
		String color2 = "ared"; // false;
		String color3= "redabc"; // true;
		String color4= "readabc"; // false;
		pattern = "^red.*";
		System.out.println(color1.matches(pattern));
		System.out.println(color2.matches(pattern));
		System.out.println(color3.matches(pattern));
		System.out.println(color4.matches(pattern));
		System.out.println();
		
		// 예제 3 (특정 문자로 시작하는지 체크)
		String color5 = "yeloow";
		String color6 = "green";
		pattern = "^(r|y|b).*"; // "r"시작 or "y"시작 or "b"로 시작해야함
		System.out.println(color5.matches(pattern)); // true;
		System.out.println(color6.matches(pattern)); // false;
		
		// 예제 4
		String gender = "M";
		pattern = "(M|F)";
		System.out.println(gender.matches(pattern)); // true;
		System.out.println();
		
		// 패턴 - 숫자만
		String eng = "100";
		String date= "2020 1225";
		pattern = "^[0-9]+$";
		System.out.println(eng.matches(pattern)); // true;
		System.out.println(date.matches(pattern)); // false;
		System.out.println();
		
		// 패턴 - 영문만
		String str = "abc";
		// 영문으로 시작하고, 영문1개 이상, 영문으로 끝나야함
		pattern = "^[a-zA-Z]+$";
		System.out.println(str.matches(pattern)); // true;
		System.out.println();
		
		// 회원 아이디 체크(영문, 숫자, 특수문자(_,-,$)를 포함한 6~12자)
		String userid = "test12";
		pattern = "^[a-zA-Z]{1}+([a-zA-Z0-9_-]+){5,11}";
		System.out.println("아이디 : "+userid.matches(pattern));
		System.out.println();
		
		// 회원명 체크(한글 또는 영문으로 2~50자)
		String name = "Hong길동";
		pattern = "^[a-zA-Z가-힣]{2,50}$";
		System.out.println("이름 : "+name.matches(pattern));
		System.out.println();

		// 학점 체크(A~D,F,+,-)
		// A|B|C|D|F가 1개 올 수 있고 +또는 -가 올 수도 있고 안 올 수도 있음
		String hakjum = "A+";
		pattern = "(A|B|C|D|F){1}(\\+|-)?";
		System.out.println("학점 : "+hakjum.matches(pattern));
		System.out.println();

		// 공백여부 체크
		String content = " a".trim();
//		pattern = "[[:space:]]"; // 공백이 아님
		pattern = ".+";
		System.out.println("content : "+content.matches(pattern));
		System.out.println();
		
		
		// 이메일 체크
		// 영문, 숫자, -, _ @ 영문, 숫자 . 영문, 숫자
		// (영문으로 시작)(영,숫,-,_)1개이상@(영문,숫자).(영문)
		String email1 = "a-@naver.com";
		String email2 = "#abc@korea.co.kr";
		String email3 = "abc@korea.1212";
		pattern = "^[a-zA-Z]+[a-zA-Z0-9_-]*@[a-zA-Z0-9_-]+\\.[a-zA-Z]+$"; // \하나만 쓰면 오류
		System.out.println("email1 : "+email1.matches(pattern));
		System.out.println("email2 : "+email2.matches(pattern));
		System.out.println("email3 : "+email3.matches(pattern));
		System.out.println();
		
		// 예제 1(생년월일 체크)
		String birthday = "1980-02-22";
		pattern = "[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}";
		if(birthday.matches(pattern)) {
		System.out.println("올바른 날짜");
		} else {
			System.out.println("올바른 날짜 아님");
		}
		System.out.println();
		
		// 예제 2 (특정 단어 검색)
		String str1 = "공지사항 게시판 이미지";
		if (str.matches(".*게시판.*")) {
			System.out.println("문자열 있음!");
		} else {
			System.out.println("문자열 없음!");
		}
		System.out.println();
		
		// 예제3 (숫자유무 체크
		String txt = "123a";
		if(txt.matches(".*[0-9].*")) {
			System.out.println("숫자 있음!");
		} else {
			System.out.println("숫자 없음!");
		}
		System.out.println();
		
		// 예제 4(핸드폰 번호 체크)
		String phone = "010-222-1234";
		pattern = "01(0|1|[6-9])-[0-9]{3,4}-[0-9]{4}";
		if (phone.matches(pattern)) {
			System.out.println("올바른 핸드폰 번호");
		} else {
			System.out.println("핸드폰 번호를 다시 확인해주세요");
		}
		System.out.println();

		// 예제 5(한글체크)
		String name1 = "홍길동";
		pattern = "[가-힣]+";
		boolean result = name.matches(pattern);
		System.out.println("이름체크 : "+result);				
		
				
		
	}

}
