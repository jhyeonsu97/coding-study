package study2;

import java.util.Scanner;

public class Test1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		byte a = 100; // -128~127
		short b = 100; // -32000~32000
		int c = 100;
		long d =  3000000000L;
		float f1 = 3.14f;
		float f2 = 3.121212121121211f;
		double d1 = 3.12121212121212;
		System.out.println(f2);
		System.out.println(d1);
		
		char c1 = 'a'; // o
		c1++;
		c1++;
		System.out.println("char c1:" + c1);
		//char c2 = 'ab'; // x
		//char c3 = "a"; // x
		char c4 = '가'; // o
		c4++;
		System.out.println("char c4:" + c4);
		String s1 = "a";
		//s1++;
		System.out.println("String s1:" + s1);
		
		char c3 = 'a';
		char c5 = 97;
		System.out.println("c5: "+ c5);	
	}
}
