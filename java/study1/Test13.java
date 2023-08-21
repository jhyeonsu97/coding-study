package study1;

public class Test13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int eng = 80;
		String result = (eng>=80)?"우수":"양호";
		System.out.println("영어점수는 " + eng + "점으로 " + result + "입니다.");
		System.out.println("--------------");
		
		int apple = 88;
		String result2 = (apple>=80)?"A등급":(apple>=60)?"B등급":"C등급";
		System.out.println("사과의 당도는 " + apple + "으로 " + result2 + "입니다.");
		System.out.println("--------------");
		
		int gender = 1;
		String result3 = (gender==1)?"남성":"여성";
		System.out.println(gender + "은 " + result3 + "입니다.");
		System.out.println("--------------");
		
		int number = 10;
		String result4 = (number>0)?"양수":(number<0)?"음수":"0";
		System.out.println(number + "은 " + result4 + "입니다.");
		System.out.println("--------------");
		
		int score = 92;
		String result5 = (score>=90)?"A학점":(score>=80)?"B학점":(score>=70)?"C학점":(score>=60)?"D학점":"F학점";
		System.out.println("당신은 " + result5 + "입니다.");

	}

}
