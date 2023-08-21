package study4;

public class Test7 {

	public static void main(String[] args) {
		String subject=" Html,mysql,java"	;
		
		System.out.println(subject); //  Html,mysql,java
		
		System.out.println(subject.replace("mysql", "oracle")); //  Html,oracle,java
		
		System.out.println(subject.length()); // 16
		
		System.out.println(subject.trim()); //  Html,oracle,java
		
		String subject2=subject.trim();
		System.out.println(subject2); //  //  Html,oracle,java
		
		System.out.println(subject2.substring(11,15)); // java
		int a1 = subject2.indexOf("java");
		System.out.println(subject2.substring(a1,a1+4)); //  java
		
		System.out.println(subject.indexOf(",")); // 5
		
		int n1 = subject2.indexOf(",");
		System.out.println(subject2.charAt(n1+1)); // m
		
		if (subject2.indexOf("javascript")>-1) {
			System.out.println("존재함");
		} else {
			System.out.println("존재안함"); //  존재안함
		}
		
		String[] a = subject.split(",");
		System.out.println(a[2]); // java
		
		System.out.println("--------------------");
		
		String title="자바프로그래밍 입문";
		String content = "자바를 이용하여 기초부터 중급까지 완성한다.";
		
//		int r1 = title.indexOf("자바");
//		int r2 = title.indexOf("자바");
//		if ((r1>-1) && (r2>-1)){
//			System.out.println("자바라는 단어가 모두 포함 되었습니다.");
//		} else if ((r1>-1) || (r2>-1)) {
//			System.out.println("자바라는 단어가 하나 포함 되었습니다.");
//		} else {
//			System.out.println("자바라는 단어가 모두 포함되지 않았습니다.");
//		}
		
		if(title.contains("자바")==true && content.contains("자바")==true) {
			System.out.println("자바라는 단어가 모두 포함되었습니다.");
		}
		System.out.println("--------------------");
		
		String Jumsu = "eng:70,kor:90,math:88";
		
		System.out.println(Jumsu.substring(0,6));
		System.out.println(Jumsu.substring(7,13));
		System.out.println(Jumsu.substring(14));
		
		System.out.println("--------------------");
	}
}
