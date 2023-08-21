package study8;

public class MembeWrite {

	public static void main(String[] args) {
		MemberVO vo = new MemberVO();
		vo.setUserid("jhyeonsu97");
		vo.setPass("gustn4878@");
		vo.setName("조현수");
		vo.setGender("M");
		vo.setBirthday("1999-07-25");

		System.out.println("아이디 : "+vo.getUserid());
		System.out.println("비밀번호 : "+vo.getPass());
		System.out.println("이름 : "+vo.getName());
		System.out.println("성별 : "+vo.getGender());
		System.out.println("생년월일 : "+vo.getBirthday());
	}

}
