package study14;


import java.io.BufferedReader;
import java.io.FileReader;

public class FileReaderExample {

	public static void main(String[] args) throws Exception {
		// 특정 파일을 인지핳는 클래스
		FileReader file = new FileReader("C:/html_test/1th/font.html");
		// 파일 안의 내용을 읽어들이는 클래스
		BufferedReader buffer = new BufferedReader(file);
		String rowData = "";
		while(true) {
			if((rowData = buffer.readLine())!= null) {
				System.out.println(rowData);
			} else {
				break;
			}			
		}
		file.close();
	}
}
