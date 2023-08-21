package study9;

public class Product {

	private String name = "생산품명";
	private int price;
	private String maker = "한국";
	
	public int discount() { // 다형성 > 오버라이딩(상속관게에서의 기법)
		int result = getPrice() - (getPrice()/5);
		return result;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	
	
}
