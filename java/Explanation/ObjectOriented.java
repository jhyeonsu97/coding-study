package Explanation;

/*
  
 {객체지향의 4대 요소} 캡슐화, 상속화, 다형성, 추상화


1. 캡슐화(메소드 및 변수에 타 클래스로부터의 접근권한 설정)
	- 접근지정자 : public > protected > (생략) > private
	
2. 다형성 (동일한 이름의 메소드를 만드는 방법)
	- 오버로딩 : 한 클래스 내에서 매개변수의 종류와 개수를 달리해서 동일한 이름의 메소드를 만드는 기법
	- 오버라이딩 : 상속관계에서 상위(부모)클래스의 메소드를 동일한 이름으로 재정의 하는 기법
	
3. 상속(타 클래스와의 관계를 설정하는 기법)
	- extends나 implements 키워드를 통해 상속 관계를 설정하는 기법
	- 자식 레벨에서 부모 레벨의 요소(클래스)를지정할 수 있음
	- 클래스를 상속 받는 경우 extends
	- 인터페이스를 상속 받는 경우 implements
	
4. 추상화(명세처리하는 형식, 메소드명을 목록처리하여 타 클래스에서 구현하는 기법)
	(1) 추상클래스 -> 생성 abstract abc {} / abstract 키워드를 통해 생성
	 		    -> 구현 extends abc 상속 후 구성 / extends 키워드를 통해 상속 및 구현
	(2) 인터페이스 -> 생성 interface abc {} / interface 키워드를 통해 생성
				-> 구현 inplements abc 상속 후 구성 / inplements 키워드를 통해 상속 및 구현
				
*/