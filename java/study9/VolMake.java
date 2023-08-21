package study9;

// 구현하는 클래스
public class VolMake implements VolService{
	private int volLevel; // volLevel = 0;
	
	public int getVolLevel() {
		return volLevel;
	}
//	public void setVolLevel(int volLevel) {
//		this.volLevel = volLevel;
//	}
	public VolMake( ) { // class명과 같은 메소드는 없다 > 생성자
		volLevel=1;
	}
	public void volUp(int level) {
		volLevel += level;	
	}
	public void volDown(int level) {
		volLevel -= level;
	}
	
}
