package study_725;

import java.io.BufferedReader;
import java.io.FileReader;

public class IOTest1_study14 {

	public static void main(String[] args) throws Exception {
		
		String path = "c:/html_test/age1.txt";
		// 물리적인 파일의 위치를 자바에서 인식
		FileReader fr = new FileReader(path);
		// FileReader에는 읽기 기능이 없기 때문에 BufferedReader 사용
		BufferedReader br = new BufferedReader(fr);
		String rowData = "";
		while(true) {
			if((rowData=br.readLine())!=null) { // 끝이 아니라면 한 줄 읽어들임
				int year = Integer.parseInt(rowData.substring(0,4)); // 0~3
				int age = 2023 - year;
				System.out.println(age);
		} else { // 값이 null인 경우
			break;
			}
		}
	}
}
