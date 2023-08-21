package study12;

public class LstNameChkTest {

	public static void main(String[] args) {
		String str = "팽";
		LstNmChk lstNm = new LstNmChk();
		try {
			lstNm.checkLastNm(str); // 체크담당
			System.out.println("올바른 성입니다");		
		}catch(InvalidNmException e) {
			System.out.println(e.toString());
			}
	}
}
