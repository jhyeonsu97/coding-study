package study4;

import java.util.Scanner;

public class Test5 {

	public static void main(String[] args) {
		int[] scores = {90,70,88};
		int sum = 0;
		for (int i =0;i<scores.length; i++ ) {
			sum = sum +scores[i];
		}
		System.out.println("총합"+sum);
		System.out.println("평균"+sum/scores.length);
		System.out.println("--------------------------");
	
		String[] subject = {"java","javascript","linux"};
		
		for(int i=0; i<subject.length; i++) {
			System.out.println(subject[i]);	
		}
		System.out.println("--------------------------");
		
		// 풀어보기 1(1~17 출력 후 5의 배수 뒤에 **붙히기)
		for (int i=1; i<=17; i++) {
			if (i%5==0) {
			System.out.println(i+"**");
			}else {
			System.out.println(i);
			}
//			System.out.println(i);
//			System.out.println((i%5==0)?"**":" "); >> 방법2 : 삼항연산
		}System.out.println("--------------------------");
		
		// 풀어보기 2(사계절 범위 출력)
		int[]months= {1,3,10};
		String season = "";
		for(int i=0; i<months.length; i++) {
			int m = months[i];
			
			if (m>=3 && m<=5) {season="봄";}
			else if(m>=6 && m<=8) {season="여름";}
			else if(m>=9 && m<=11) {season="가을";}
			else {season="겨울";}
			
			System.out.println(((m<10)?"0":"")+m+"월 : "+season);
			
	} System.out.println("--------------------------");
	
		// 풀어보기 3(구구단 출력)
	 for  (int a=2; a<=4; a++) {
		 for  (int i=1; i<=3; i++) {
			 System.out.println(a+"*"+i+"="+a*i); 
		 } System.out.println();
	}System.out.println("--------------------------");
	
	// 풀어보기 4(커피 주문)
	Scanner scn = new Scanner(System.in);
	String[] coffee= {"아메리카노","카푸치노","카페라떼","오늘의커피"};
	int[] price = {3500,4500,4300,3500};

	System.out.println("*커피번호를 선택해주세요.");
	System.out.println("1.아메리카노 2.카푸치노 3. 카페라떼 4.오늘의커피 5.주문취소");
	System.out.println("번호>>");
	int n = scn.nextInt();
	if (n<=4) {
		System.out.println(coffee[n-1]+"을 선택하셨습니다");
		System.out.println(price[n-1]+"결제를 부탁드립니다");
	} else {
		System.out.println("주문을 취소했습니다.(종료)");
	}
	System.out.println("--------------------------");
	
	// 풀어보기 5(별 찍기)
	for (int i=1; i<=5; i++) {		// 행
		for (int j=1; j<=i; j++) {	// 열
			System.out.print("*");
		}
		System.out.println();
	}
	System.out.println("");
	for (int i=5; i>=1; i--) {
		for (int j=1; j<=i; j++) {	// 열
			System.out.print("*");
		}
		System.out.println();	
	}
	System.out.println();
	
	// 풀어보기 6()
	int[][] classA = {{90,80,70},{50,100,100}};
//	classA[0][0] ->90
//	classA[0][1] ->80
//	classA[0][2] ->70
//	classA[1][0] ->50
//	classA[1][1] ->100
//	classA[1][2] ->100
	
	int[] hap = new int[2]; // int[] hap = {0,0}
	// for(int i=0; i<2; i++) -> 0,1
	for(int i=0; i<classA.length; i++) { // classA.length=2 
		// classA[0].length; 첫번째 그룹의 길이, classA[1].length; 두번째 그룹의 길이
		for (int j=0; j<classA[i].length; j++) { // 0,1,2
			System.out.println(classA[i][j]);
			hap[i] += classA[i][j];
		}
	}
	// hap = {240,250}
	int len1 = classA[0].length;
	int len2 = classA[1].length;
	
	System.out.println("1반 총점:"+hap[0]+"점/평균:"+(hap[0]/len1)+"점");
	System.out.println("2반 총점:"+hap[1]+"점/평균:"+(hap[1]/len2)+"점");
	System.out.println("전체평균:"+(hap[0]+hap[1])/(len1+len2)+"점");
	
	System.out.println();
	for(int i=0; i<classA.length; i++) {
		for (int j=0; j<classA[i].length; j++) { // 0,1,2
			System.out.println(classA[i][j]);
		}}
	}
}