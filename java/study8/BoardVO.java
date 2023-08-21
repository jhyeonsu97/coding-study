package study8;

// 일반게시판 : 제목 / 암호/ 이름 / 내용/ 이메일

public class BoardVO {
	private String title;
	private String pass;
	private String name;
	private String content;
	private String email;
	
//	get/set처리
//	title/name/content 앞뒤공백제거
//	pass는 모든 공백제거
//	email은 @의 존재여부 -> 존재하지 않으면 공백 처리
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		title = title.trim();
		this.title = title;
	}
	
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		pass = pass.replace(" ","");
		this.pass = pass;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		name = name.trim();
		this.name = name;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		content = content.trim();
		this.content = content;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		if(email.indexOf("@")<0) {
			email = "";
		}
		this.email = email;
	}
	
}