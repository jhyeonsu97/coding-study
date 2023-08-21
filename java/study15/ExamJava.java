package study15; // 2차 평가

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.Scanner;

public class ExamJava {
	
	static String path = "c:/html_test/member.txt"; // static붙이면 어느 메소드에서나 인지 가능
	
	public static boolean errorCheck(String value, int n) {
		String pattern = "";
		if(n==1) { // 아이디 유효성 체크
			pattern = "^[0-9a-zA-Z_]{4,12}$";
		} else if(n==2) { // 생년월일 유효성 체크
			pattern = "[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}";
		}  else if(n==3) { // 휴대폰번호 유효성 체크
			pattern = "^01(0|1|5)-[0-9]{3,4}-[0-9]{4}";
		}
		return value.matches(pattern);
	}
	
	public static boolean memberCheck(String id) throws Exception {
		
		FileReader fr = new FileReader(path);
		BufferedReader br = new BufferedReader(fr);
		String rowData = "";
		while(true) {
			rowData = br.readLine();
			if(rowData != null) {
				if(rowData.indexOf(id+"/")>-1) { // 데이터가 있다면,
					return false; // 아이디 중복됨
				}
			} else {
				break;
			}
		}
		return true; // 사용 가능 아이디
	}
	
	
	public static void memberRegist() throws Exception{
		Scanner scn = new Scanner(System.in);
		System.out.println("----------------------------");
		System.out.println("[회원등록]");
		System.out.println("----------------------------");
		
		String id = "";
		String birth = "";
		String phone = "";
		
		while(true) {
		System.out.println("아이디 >> ");
		id = scn.next(); // while문 안에 변수선언 안됨 -> while문 위에서 선언
		if(errorCheck(id,1) == false) {
			System.out.println("아이디는 (영문+숫자) 4~12자 사이로 입력해주세요.");
			continue; // 반복문의 초기화
		}
		if(memberCheck(id) == false) {
			System.out.println("이미 사용중인 아이디입니다.");
			continue; // 하단으로 내려가지 말고 반복문을 다시 실행 -> 반복문의 초기화
			}
			break;
		}
		
		while(true) {
		System.out.println("생년월일 >> ");
		birth = scn.next();
		if(errorCheck(birth,2) == false) {
			System.out.println("날짜를 다시 입력해주세요.");
			continue; // 반복문의 초기화
			}
			break;
		}
		
		while(true) {
		System.out.println("휴대폰번호 >> ");
		phone = scn.next();
		if(errorCheck(phone,3) == false) {
			System.out.println("휴대폰번호를 다시 입력해주세요.");
			continue; // 반복문의 초기화
			} 
			break;
		}
		
		String info = id+"/"+birth+"/"+phone;
	
		File file = new File(path);
		FileWriter fw = new FileWriter(file,true); // 있으면 유지, 없으면 생성
		fw.write(info+"\n");
		fw.close();
		System.out.println("등록이 완료 되었습니다.");
	}
	
	public static void memberList() throws Exception{

	}
	
	public static void memberDetail() throws Exception{

	}
	
	public static void membreDelete() throws Exception{
		
	}
	
	public static void main(String[] args) throws Exception {
		Scanner scn = new Scanner(System.in);

		System.out.println("1.등록 2.목록 3.상세 4.삭제");
		System.out.println("번호선택 >>");
		int nn = scn.nextInt();
		
			if(nn==1) {
				memberRegist();
			} else if (nn==2) {
				memberList();
			} else if(nn==3) {
				memberDetail();
			} else if(nn==4) {
				membreDelete();
			} else {
				System.out.println("잘못된 번호입니다. 다시 입력해주세요. >>");	
			}
		}
	}
//}