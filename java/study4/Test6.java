package study4;

public class Test6 {

	public static void main(String[] args) {
		String str= "	java	script	";
		// length() 메소드
		System.out.println(str.length());
		
		// replace(old, new) 메소드 : 치환
		System.out.println(str.replace("java","oracle"));
		System.out.println(str.replace("	",""));
		
		// trim() : 앞 뒤 공백 제거
		str = str.trim();
		System.out.println(str);
		
		// str = "javascript"
		// substring(시작번호, 끝번호) : 범위설정 메소드
		System.out.println(str.substring(0,4)); // java ;  마지막번호 +1
		System.out.println(str.substring(4,11)); // script
		System.out.println(str.substring(4)); //  끝가지 가져오는 경우 끝번호 생략 가능
		// System.out.println(str.substring(-1)); (x

		System.out.println(str.charAt(5)); // s
		
		// indexOf -> search
		System.out.println(str.indexOf("script")); // 5
		System.out.println(str.indexOf("oracle")); // -1
		
		// contains -> search
		System.out.println(str.contains("script")); // true
		System.out.println(str.contains("oracle")); // false
		
		// startsWith, endWidth
		System.out.println(str.startsWith("script")); // false
		System.out.println(str.startsWith("java")); // true
		System.out.println(str.endsWith("java")); // false

		str = "java,html";
		String[] array = str.split(","); // 문자열 분리 메소드
		System.out.println(array[0]);
		System.out.println(array[1]);
		
		String s1 = "java";
		String s2 = "java";
		String s3 = new String("java"); // java
		System.out.println(s1==s2); // true
		System.out.println(s1==s3); // false
		System.out.println(s1.equals(s3)); // true
		System.out.println(s1.equals(s3)); // true
	}

}
