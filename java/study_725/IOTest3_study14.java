package study_725;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

public class IOTest3_study14 {

	public static void main(String[] args) throws Exception {
		String path = "c:/html_test/age2.txt";
		FileReader fr = new FileReader(path);
		BufferedReader br = new BufferedReader(fr);
		String rowData = "";
		String saveData = ""; // 데이터 보관
		String allData = "";
		
		while(true) {
			rowData = br.readLine();
			if(rowData != null) {
				
				if(rowData.indexOf("개강2")>-1) { // 못찾았을 경우 -1이기 때문에 이보다 크면 찾은 것
					// 개강2:2023/07/10
					String[] str = rowData.split(":");
					str[1] = "2023/07/15";
					saveData = str[0]+":"+str[1];
				} else {
					allData += rowData+"\n";
				}
			} else {
				break;
			}
		}
		allData += saveData; // 변경된 데이터까지 갖음
		
		File file = new File(path);
		FileWriter fw = new FileWriter(file,false); // false : 덮어씀
		fw.write(allData);
		fw.close();
		System.out.println("변경 완료~~");
	}
	
}
