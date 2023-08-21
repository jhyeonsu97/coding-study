package study15;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

public class PostTest {

	public static void main(String[] args )  throws Exception {
		
		String path="C:/html_test/post.csv";
		String savePath = "C:/html_test/post_guri.csv";
		FileReader fr = new FileReader(path);
		BufferedReader br = new BufferedReader(fr);
		String rowData = "";
		String saveData = "";
		String word = "구리시";
		
//		try {
//		while(true) {
//			if((rowData=br.readLine())!=null) { 
//				if (rowData.contains(word)) {
		
		
		
//				System.out.println(rowData);
//				}
//			} else { 
//				break;
//			}
//		} // try
//		} catch(Exception e) {}
		
		
			while(true) {
				rowData = br.readLine();
				if(rowData !=null) { 
					if (rowData.indexOf(word)>-1) {
						saveData += rowData+"\n";
					}
				} else { 
					break;
				}
				
			} 
			File file = new File(savePath);
			FileWriter fw = new FileWriter(file,false);
			fw.write(saveData);
			fw.close();
			System.out.println("데이터 저장 성공");
	}

}