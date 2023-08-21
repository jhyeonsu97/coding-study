package study6;

public class MyTv {

	public static void main(String[] args) {
		
		TvControl tv = new TvControl();
		
		tv.power();
		
		tv.channel = 11;
		
		tv.channelDown(); // 10
		
		System.out.println("전원: "+tv.power);
		System.out.println("채널: "+tv.channel);
		
		tv.channelUp(); // 11
		tv.channelUp(); // 12
		
		System.out.println("전원: "+tv.power);
		System.out.println("채널: "+tv.channel);
		
		tv.power();
	
		System.out.println("전원: "+tv.power);
		System.out.println("전원: "+tv.channel);
		
		
		
	}

}
