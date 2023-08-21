package study14;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

public class DirList {
	
	public static void main(String[] args) {
		
		// 파일 및 폴더를 인지하는 클래스
		File dir = new File("C:\\html_test");
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		// 특정 디렉토리(폴더)의 정보들을 가져옴
		File[] names = dir.listFiles();
		for(int i=0; i<names.length;i++) {
			// 디렉토리 여부
			if(names[i].isDirectory()) { // 디렉토리가 있다면,
				System.out.print("<폴더>\t");
			}
			else {
				System.out.print("<파일>\t");
			}
			System.out.print(names[i].getName() +"\t");
			System.out.print(names[i].length() +"\t");
			System.out.println(df.format(names[i].lastModified()));
		}
	}
}
