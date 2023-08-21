package study1;

public class Test11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int a = 1;
		++a;	// 2
		++a;	// 3
		a++;	// 4
		System.out.println("a = " + a);	// 4
		System.out.println("--------");
		
		int b = 1;
		++b;	// 2
		// int c = ++b;	// int c = 3;
		int c = b++; // int c = 2; 2++;
		System.out.println("b = " + b);	// 3
		System.out.println("c = " + c); // 2
		
		int num = 1;
		// 1증가
		num++;
		++num;
		num = num+1;
		num += 1;
		// 2증가
		num = num+2;
		num += 2;
		// 2곱셈
		num = num*2;
		num *= 2;
		// 2나누기
		num = num/2;
		num /= 2;
		

	}

}
