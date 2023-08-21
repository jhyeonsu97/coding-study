/*

post
1. PostImpotrService
 텍스트파일(post.csv) -> DB테이블(post) :: 저장
2. PostExpotrService
 (1)DB테이블(post) -> 텍스트파일(post_2323.txt)
 (2)DB테이블(emp) -> 텍스트파일(emp_1212.txt)
3. PostSearchSearvice
String sql = "select (a1||' '||a2||' '||a3||' '||a4||' '||a5||' '||a6||' '||a7) as address"
				+ " from post 1"
				+ " where a1 = '123456'";
String sql = "select (a1||' '||a2||' '||a3||' '||a4||' '||a5||' '||a6||' '||a7) as address"
				+ " from post 1"
				+ " where a2 like '%대구%'";
		
		String sql = "select (a1||' '||a2||' '||a3||' '||a4||' '||a5||' '||a6||' '||a7) as address"
				+ " from post 1"
				+ " where a3 like '%강남구%'";

*/