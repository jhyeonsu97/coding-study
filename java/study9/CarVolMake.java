package study9;

public class CarVolMake implements CarVolService {
	
	private int volLevel = 0;
	private int volLevelTemp = 0;
	
	public int getvolLevel() {
		return volLevel;
	}
	
	@Override
	public void volUp(int level) {
		volLevel += level;
	}

	@Override
	public void volDown(int level) {
		volLevel -= level;
	}

	@Override
	public void volOff() {
		volLevel = 0;
	}

	@Override
	public void volPause() {
		volLevelTemp = volLevel;
		volLevel = 0;
	}

	@Override
	public void volResume() {
		volLevel = volLevelTemp;
		volLevelTemp = 0;
		
	}

}
