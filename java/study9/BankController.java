package study9;

public class BankController {

	public static void main(String[] args) {
		BankServiceImpl bank = new BankServiceImpl();
		
		bank.moneyPrint();
		bank.moneyInput(300);
//		bank.moneyPrint();
		bank.moneyInput(50);
//		bank.moneyPrint();
		bank.moneyOutput(350);
//		bank.moneyPrint();
	}

}
