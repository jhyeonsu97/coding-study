package post;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Scanner;

import comm.DbConnect;

public class PostImportService extends DbConnect {

    public static void main(String[] args) throws Exception {

           Scanner scn = new Scanner(System.in);
           System.out.println("\n※(우편번호/주소)데이터 임포트 진행을 하시겠습니까?");
           System.out.println("1.예 2.아니오 \n");
           System.out.print("번호입력>>");
           int number = scn.nextInt();
           
           if( number == 1 ) {
                String path = "c:/temp100/post1.csv";
                postImport(path);
           } else {
                System.out.println("\n*** 진행없이 종료 했습니다.***");
          }
    }

    public static void postImport(String file_path) throws Exception {
          // DB 연결+작업공간생성1
    	
          Statement stmt = Connection().createStatement();
          
          Calendar cal = Calendar.getInstance();
          long t1 = cal.getTimeInMillis();

          // 경로의 인식
          FileReader file = new FileReader(file_path);
          BufferedReader buffer = new BufferedReader(file);
          // 내용읽기
          String rowData = "";
           int cnt = 0;
           while( true ) {
                   if( (rowData=buffer.readLine()) != null ) {
                         /* INSERT SQL문장 데이터에 홑따옴표(')가 섞여 있으면 오류
                          * 이런 오류의 방지로 홑따옴표 앞에 홑따옴표를 설정하여 오류를 방지
                          * SQL에서 홑따옴표는 이스케이프문자로 활용됨
                          * */
                           // replace()를 이용해 문장의 모든 홑다옴표 앞에 홑따옴표를 붙임
                            rowData = rowData.replace("'", "''");//replace(old,new);
                           String[] datas = rowData.split(",");
                           // //210762,강원도,강릉시,연곡면,영진리, ,연곡부영사랑으로2'단지아파트
                           String sql = "insert into post2 values"
                                     + "( '"+datas[0]+"'"
                                     + " ,'"+datas[1]+"'"
                                     + " ,'"+datas[2]+"'"
                                     + " ,'"+datas[3]+"'"
                                     + " ,'"+datas[4]+"'"
                                     + " ,'"+datas[5]+"'"
                                     + " ,'"+datas[6]+"' )";
                          int result = stmt.executeUpdate(sql);
                          if( result == 1 )  cnt++;

                     } else break;
              }  // while close
              cal = Calendar.getInstance();
              long t2 = cal.getTimeInMillis();
              long t3 = t2 - t1;
              System.out.println( t3 + " 밀리 초");
              System.out.println( t3/1000 +" 초");
              System.out.println( "총 " + cnt + "건 입력완료" );
              
       }  // Method close
}
