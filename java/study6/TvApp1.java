package study6;

class TvInfo {
	String model;
	String color;
	int size;
	int price;
}

public class TvApp1 {

	public static void main(String[] args) {
		TvInfo tvInfo1 = new TvInfo();
		TvInfo tvInfo2 = new TvInfo();
		
		tvInfo1.model = "M01TV";
		tvInfo1.color = "Red";
		tvInfo1.size = 50;
		tvInfo1.price = 150;
		
		tvInfo2.model = "M02TV";
		tvInfo2.color = "Blue";
		tvInfo2.size = 55;
		tvInfo2.price = 200;
		
		System.out.print("모델명:"+tvInfo1.model+" 가격:"+tvInfo1.price+" 사이즈:"+tvInfo1.size);
	}

}
