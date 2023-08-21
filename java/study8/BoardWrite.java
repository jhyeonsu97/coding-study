package study8;

public class BoardWrite {

	public static void main(String[] args) {
		BoardVO vo = new BoardVO();
		vo.setTitle("첫 글 입니다");
		vo.setPass("1234  56");
		vo.setName("홍길동");
		vo.setContent("ㅎㅇㅎㅇ");
		vo.setEmail("abc@naver.com");
		
		System.out.println("제목 : "+vo.getTitle());
		System.out.println("암호 : "+vo.getPass());
		System.out.println("이름 : "+vo.getName());
		System.out.println("내용 : "+vo.getContent());
		System.out.println("메일 : "+vo.getEmail());
		

	}

}
