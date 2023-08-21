package study9;

public class BankServiceImpl implements BankService {
	
	private int money;
	
	@Override
	public void moneyInput(int money) {
		this.money += money;
		System.out.println("입금액 : "+money);
		moneyPrint();
	}

	@Override
	public void moneyOutput(int money) {
		if(this.money < money) {
			System.out.println("잔액부족");
		} else {
		this.money -= money;
		System.out.println("출금액 : "+money);
		moneyPrint();
		}
	}
	@Override
	public void moneyPrint() {
		System.out.println("잔액 : "+money);
	}


}
