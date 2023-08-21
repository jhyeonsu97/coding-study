package study14;

import java.io.BufferedWriter;
import java.io.File;

public class FileWriter {

	public static void main(String[] args) {
			String path = "C:/html_test/abc.txt";
			File file = new File(path);
			// exists() : 존재여부
			if(file.exists()) {
				if(file.delete()) { // 파일 및 폴더 삭제
//					file.mkdir(); // 파일 생성
					System.out.println("삭제o");
				} else {
					System.out.println("삭제x");
				}
			} else {
				System.out.println("파일존재x");
			}
		}

	}


