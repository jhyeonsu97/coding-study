package study14;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.Scanner;

public class BankTest {
	
	public static void bankPlus() throws Exception{
		Scanner scn = new Scanner(System.in);
		String path = "c:/html_test/money.txt"; // 저장파일
		
		// 물리적인 위치로의 전환(인식) 관련 클래스
		FileReader fr = new FileReader(path);
		// 물리적인 파일 내용 확인 클래스
		BufferedReader br = new BufferedReader(fr);	
		
		System.out.println("==============");
		System.out.println("\n\n[입금화면] \n");
		System.out.println("아이디 >>");
		String id = scn.next();
		System.out.println("입금액 >>");
		int money = scn.nextInt();
		
		String rowData = ""; // 읽어들인 한줄을 저장
		String otherData = ""; // 관련없는 데이터들의 저장
		String myData = ""; // 사용자가 입력한 ID와 Money의 세팅
		int sumMoney = 0; // 사용자가 입력한 금액과 저장된 금액의 합
		
		while(true) {
			if ((rowData = br.readLine())!=null) {
		
				if(rowData.indexOf(id+":")>-1) { // true
					String[] str = rowData.split(":"); // 분리
					sumMoney += Integer.parseInt(str[1]); // 계산
					myData = id+":"+money;
			} else {
				otherData += rowData+"\n";
			}
		} else {
			break; // while문 종료
		}
	}
		
	if(myData.equals("")) {
		myData = id+":"+money;
	}

	File file = new File(path);
	// 덮어쓰기 용도로 클래스를 사용가능 상태로 만듬
	FileWriter fw = new FileWriter(file,false); // false : 덮어쓰기, true : 이어쓰기
	fw.write(otherData+myData);
	fw.close();
	
	System.out.println(id+"님의 계좌에 "+money+"원이 입금되었습니다");
}
	
	public static void bankMinus() throws Exception{
		Scanner scn = new Scanner(System.in);
		String path = "c:/html_test/money.txt"; // 저장파일
		
		// 물리적인 위치로의 전환(인식) 관련 클래스
		FileReader fr = new FileReader(path);
		// 물리적인 파일 내용 확인 클래스
		BufferedReader br = new BufferedReader(fr);	
		
		System.out.println("==============");
		System.out.println("\n\n[출금화면] \n");
		System.out.println("아이디 >>");
		String id = scn.next();
		System.out.println("출금액 >>");
		int money = scn.nextInt();
		
		String rowData = ""; // 읽어들인 한줄을 저장
		String otherData = ""; // 관련없는 데이터들의 저장
		String myData = ""; // 사용자가 입력한 ID와 Money의 세팅
		int sumMoney = 0; // 사용자가 입력한 금액과 저장된 금액의 합
		
		while(true) {
			if ((rowData = br.readLine())!=null) {
		
				if(rowData.indexOf(id+":")>-1) { // true
					String[] str = rowData.split(":"); // 분리
					sumMoney = Integer.parseInt(str[1]) - money; // 계산
					if(sumMoney<0) {
						System.out.println(id+"님의 잔액이 부족합니다");
						return; // 실행중인 메소드 종료
					}
					myData = id+":"+sumMoney;
			} else {
				otherData += rowData+"\n";
			}
		} else {
			break; // while문 종료
		}
	}
		
	if(myData.equals("")) { // 등록되어있지 않은 사용자인 경우
		System.out.println("미등록 사용자 입니다");
		return;
	}

	File file = new File(path);
	// 덮어쓰기 용도로 클래스를 사용가능 상태로 만듬
	FileWriter fw = new FileWriter(file,false); // false : 덮어쓰기, true : 이어쓰기
	fw.write(otherData+myData);
	fw.close();
	
	System.out.println(id+"님의 계좌에 "+money+"원이 출금되었습니다");
}
	
	public static void bankOutput() throws Exception{
		Scanner scn = new Scanner(System.in);
		String path = "c:/html_test/money.txt"; // 저장파일
		
		// 물리적인 위치로의 전환(인식) 관련 클래스
		FileReader fr = new FileReader(path);
		// 물리적인 파일 내용 확인 클래스
		BufferedReader br = new BufferedReader(fr);	
		
		System.out.println("==============");
		System.out.println("\n\n[잔액화면] \n");
		System.out.println("아이디 >>");
		String id = scn.next();
	
		
		String rowData = ""; // 읽어들인 한줄을 저장
		String otherData = ""; // 관련없는 데이터들의 저장
		String myData = ""; // 사용자가 입력한 ID와 Money의 세팅
		int sumMoney = 0; // 사용자가 입력한 금액과 저장된 금액의 합
		
		while(true) {
			if ((rowData = br.readLine())!=null) {
				if(rowData.indexOf(id+":")>-1) { // true
					String[] str = rowData.split(":"); // 분리
					myData = id+"님의 잔액은 "+str[1]+"입니다";
					System.out.println(myData);
					return;
				}
		} else {
			break; // while문 종료
		}
	}
		
	if(myData.equals("")) { // 등록되지 않은 사용자인 경우
		System.out.println("미등록 사용자 입니다.");
		return;
	}

}
	
	public static void main(String[] args) throws Exception {
	
		Scanner scn = new Scanner(System.in);
		System.out.println("1. 입급 2. 출금 3. 잔액");
		System.out.println("번호선택 >>");
		int nn = scn.nextInt();
		
		if(nn==1) {
			bankPlus();
		} else if (nn==2) {
			bankMinus();
		} else if(nn==3) {
			bankOutput();
		}
	}
}
