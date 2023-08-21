package egov.mywork1.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Test101 {

	public static void main(String[] args) {

		String pass1 = "1234";
		String pass2 = MyEncrypt.testMD5(pass1);
		
		System.out.println(pass2);
	
	}

}
