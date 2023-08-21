package study7;

public class ScreenInfo {
	String movieTitle=""; // 인스턴스 변수
	int ticketPrice=10000;
	
	public ScreenInfo(String movieTitle) { // 매개변수 
		this.movieTitle = movieTitle;
	}
	
	public ScreenInfo(String movieTitle, int ticketPrice) {
		this.movieTitle = movieTitle;
		this.ticketPrice = ticketPrice;
		
	}

	public static void main(String[] args) {
		ScreenInfo Info1 = new ScreenInfo("미이라");
		ScreenInfo Info2 = new ScreenInfo("아마존",15000);
		System.out.println("screen 1 의 영화제목은"+Info1.movieTitle);
		System.out.println("screen 2 의 영화제목은"+Info2.movieTitle);
		System.out.println("screen 1 의 가격은"+Info1.ticketPrice);
		System.out.println("screen 2 의 가격은"+Info2.ticketPrice);
	}

}
