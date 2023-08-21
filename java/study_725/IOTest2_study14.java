package study_725;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

public class IOTest2_study14 {

	public static void main(String[] args) throws Exception{
		
		String path = "c:/html_test/age2.txt";
		FileReader fr = new FileReader(path);
		BufferedReader br = new BufferedReader(fr);
		String rowData = "";
		String saveData = ""; // 데이터 보관
		while(true) {
			rowData = br.readLine();
			if(rowData != null) {
				rowData = rowData.replace("-", "/");
				saveData += rowData+"\n";
			} else {
				break;
			}
		}
		File file = new File(path);
		FileWriter fw = new FileWriter(file,false); // false : 덮어씀
		fw.write(saveData);
		fw.close();
		System.out.println("변경 완료~~");
	}
	
}
