package study8;

// 아이디 / 암호 / 이름 / 성별 / 생년월일
// Userid / pass / name / gender / birthday
// userid 	-> 6 ~ 12자 아닌경우 -> 아이디오류
// pass	  	-> 4 ~20자 아닌경우 -> 암호입력 오휴
// gender 	-> M/F 아닌경우 -> 성별입력 오류
// birthday -> 2020-12-25 10자리가 아닌경우 -> 날짜입력 오류

public class MemberVO {
	
	private String userid;
	private String pass;
	private String name;
	private String gender;
	private String birthday;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		userid = userid.trim();
		if (userid.length() < 6 || userid.length() > 12) {
			userid = "아이디 오류";
		}
		this.userid = userid;
	}
	
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		pass = pass.trim();
		if (pass.length() < 4 || pass.length() > 20) {
			pass= "암호 오류";
		}
		this.pass = pass;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		name = name.trim();
		this.name = name;
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		if (!gender.equals("M") && !gender.equals("F")) {
			gender= "성별입력 오류";
		}
		this.gender = gender;
	}
	
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		if (birthday.length()!= 10) {
			birthday= "날짜입력오류";
		}
		this.birthday = birthday;
	}
	
}


