/*

드라이버 - java+oracle=>ojdbc6.jar
토드 toad

(패키지생성)
detp - DeptSelectList.java
	 - DeptInsert.java
	 - DeptUpdate.java
	 - DeptDelete.java

c:/app/hi_guri/product/21c/homes/oradb21home1/network/admin --> tnsnames.ora

EMP (1) EmpSelectList.java
	 - 총 데이터 개수 출력
	 - 전체 목록 출력(사원번호 기준, 순차)
	(2) EmpInsert.java
	 - 사원번호 중복체크
	 - 모든 항목 사용자에게 받고 저장 
	(3) EmpUpdate.java
	 - 사원번호 일치 검사
	 - 사원번호를 조건으로 변경
	(4) EmpDelete.java
	 - 사원번호 일치 검사
	 - 삭제확인(1번 입력 시 삭제)
	 - 사원번호를 조건으로 삭제
	 
comm - DbConnect.java
	 - connection
	 
[부서정보관리] - DeptAdmin.java
0. 메인메소드 - main()
1. 부서목록 - deptList()
2. 부서입력 - deptInsert()
3. 부서변경 - deptUpdate()
4. 부서삭제 - deptDelete()

번호>>4 

*/