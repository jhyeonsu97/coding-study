package test;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Scanner;

import comm.DbConnect;

public class studnet_Search extends DbConnect{
   //마해빈
   public static void main(String[] args) throws Exception{
      
      Scanner scn =new Scanner(System.in);
      
      System.out.println("====학생정보 프로그램====");
      System.out.println("1.학생목록 관련 ");
      System.out.println("2.성적조회 ");
      System.out.println("3.학생데이터 임포트 ");
      System.out.println("4.전체 학생 정보 출력 ");
      
      System.out.println("번호를 선택해주세요>>");
      int number = scn.nextInt();
      switch(number) {
         //학생목록관련
         case 1: 
            
            System.out.println("====학생목록 관련====");
            System.out.println("1.정보입력 2.정보변경 3.정보삭제 4.정보출력");
            System.out.println("번호를 선택해주세요>>");
            number = scn.nextInt();
            switch(number) {
               case 1:
                  sutudentInsert();
                  break;
               case 2:
                  sutudentUpdate();
                  break;
               case 3:
                  studentDelete();
                  break;
               case 4:
                  studentSelect();
                  break;
               default : System.out.println("값이 잘못되었습니다");
                  break;
               }
            break;
         //학생목록관련 끝
            
         //성적조회
         case 2: 
            studentScore();
            break;
         //성적조회 끝
         
         //학생 데이터 임포트
         case 3:
            System.out.println("===3.학생 데이터 임포트==");
            System.out.println("1.학생정보 2.학생점수");
            System.out.println("임포트할 정보를 입력해주세요>>");
            number =scn.nextInt();
            switch(number) {
               case 1:
                     System.out.println("학생정보 임포트");
                     String Info_path = "C:/temp100/StudentInfo.txt";
                     studentImport(Info_path);
                  break;
               case 2:
                     System.out.println("학생점수 임포트");
                     String Score_path = "C:/temp100/Studentscore.txt";
                     studentImport(Score_path);
                  break;
               default : System.out.println("값이 잘못되었습니다.");
               }
            break;
         //학생 데이터 임포트 끝
         
         //학생 전체 출력
         case 4:
            studentAllInfo();
            break;
         default : System.out.println("값이 잘못되었습니다");
         break;
      }
      
      
   }

     //조현수
     public static void sutudentInsert() throws Exception {
         Statement stmt = Connection().createStatement();
         Scanner scn = new Scanner(System.in);
            System.out.println("[학생정보 입력]");
            System.out.println("1.아이디>>");
            String userid = scn.next();
            
            String sql2 = "select count(*) cnt from student_info"
                        +" where userid='"+userid+"'";
            ResultSet rs2 = stmt.executeQuery(sql2); //
            rs2.next();   //존재유무 + 커서(포인트)를 아래로 내림
            
            int cnt = rs2.getInt("cnt");
            if(cnt>0) {
               System.out.println("이미 사용중인 아이디입니다.");
               System.out.println("종료합니다.");
               return;
            }
            System.out.println("2.이름>>");
            String name = scn.next();
            System.out.println("3.학교명>>");
            String school = scn.next();
            System.out.println("4.생년월일>>");
            String birthday = scn.next();
            System.out.println("5.성별>>");
            String gender = scn.next();
            if (gender.equals("M") || gender.equals("F")) {
              } else {
                  System.out.println("잘못된 값입니다.");
                  return;
              }

            
            String sql= "insert into student_info(userid,name,school,birthday,gender)"
                        +"values ('"+userid+"','"+name+"','"+school+"','"+birthday+"','"+gender+"')"; //데이터 삽입
            int result = stmt.executeUpdate(sql);   //executeUpdate : 데이터 입력,업데이트,제거
            if(result>0) {
               System.out.println("저장완료");
            }
               else {
                System.out.println("저장실패");   
               }
            }

     //조현수   
     public static void sutudentUpdate() throws Exception{
         Statement stmt = Connection().createStatement();
         
          Scanner scn= new Scanner(System.in);
            System.out.println("[학생정보 변경]");
          
            System.out.println("1.아이디>>");
            String userid = scn.next();
           
            String sql2 ="select count(*) cnt from student_info "
                        +"where userid ='"+userid+"'";
            ResultSet rs2 = stmt.executeQuery(sql2);
            int cnt = 0;
            if(rs2.next()) {
               cnt = rs2.getInt("cnt");
            }else {
               return;
            }  
            
            if(cnt==0) {
               System.out.println("동일한 아이디가 없습니다.");
               System.out.println("종료합니다.");
               return;
            } 
            
            System.out.println("2.이름>>");
            String name = scn.next();
            
            
            System.out.println("3.학교명>>");
            String school = scn.next();
            
            System.out.println("4.생년월일>>");
            String birthday = scn.next();
            
            System.out.println("5.성별>>");
            String gender = scn.next();
            if (gender.equals("M") || gender.equals("F")) {
              } else {
                  System.out.println("잘못된 값입니다.");
                  return;
              }
            
            String sql= " update student_info set name='"+name+"',school='"+school+"',birthday='"+birthday+"',gender='"+gender+"' "
                        +" where userid ='"+userid+"' "; //데이터 삽입
            int result = stmt.executeUpdate(sql);   //executeUpdate : 데이터 입력,업데이트,제거
            if(result>0) {
               System.out.println("변경 완료");
            }
               else {
                System.out.println("변경 실패");   
               }
         }

     //윤소정
     public static void studentDelete() throws Exception {
       Statement stmt = Connection().createStatement();

       System.out.println("---------정보삭제---------");
       Scanner scn = new Scanner(System.in);
       System.out.println("삭제할 학생아이디를 입력해주세요");
       System.out.print("아이디>>");
       String userid = scn.next();
       String sql = "select count(*) cnt from student_info where userid='"+userid+"'";
      ResultSet rs1 = stmt.executeQuery(sql);
      int cnt= 0;
      if (rs1.next() ) {
         cnt = rs1.getInt("cnt");
      }else {
         return;
      }
      if(cnt==0) {
         System.out.println("삭제할 학생아이디가 존재하지 않습니다.");
         return;
      }
       System.out.println("정말 삭제하시겠습니까 네/아니요");
       String okay = scn.next();
       if( okay.equals("네") ) {
          String sql2 = "delete from Student_Info " + " where userid ='" + userid +"' ";
          String sql3 = "delete from Student_Score " + " where userid ='" + userid +"' ";
          int result =stmt.executeUpdate(sql2);
          result =stmt.executeUpdate(sql3);
             System.out.println("삭제완료");
             
       }else{
          System.out.println("삭제 중지");
          }
          
     }
     
     //윤소정
     public static void studentSelect() throws Exception {
            Statement stmt = Connection().createStatement();
            Scanner scn = new Scanner(System.in);
            System.out.println("---------정보출력---------");
            System.out.println("출력할 학생아이디를 입력해주세요");
            System.out.print("아이디>>");
            String userid = scn.next();

            String sql = "Select * from Student_Info where userid='"+userid+"' order by birthday asc";
            ResultSet rs = stmt.executeQuery(sql);
           
            
            while(rs.next()) { // 데이터가 없으면  false
               userid = rs.getString("userid");
               String name = rs.getString("name");
               String school = rs.getString("school");   
               String birthday = rs.getString("birthday");   
               String gender = rs.getString("gender");   
               System.out.println("아이디,이름,학교,생일,성별");
               System.out.println(userid+","+name+","+school+","+birthday+","+gender);
            }
     }

     //허철호
     public static void studentScore()   throws Exception {
        Statement stmt = Connection().createStatement();
        Scanner scn =new Scanner(System.in);
        System.out.println("===2. 성적 조회===");
          System.out.println("검색할 아이디를 입력해주세요");
          String userid = scn.next();
          String sql = "select count(*) cnt from student_info where userid='"+userid+"'";
         ResultSet rs1 = stmt.executeQuery(sql);
         int cnt= 0;
         if (rs1.next() ) {
            cnt = rs1.getInt("cnt");
         }else {
            return;
         }
         if(cnt==0) {
            System.out.println("조회할 학생아이디가 존재하지 않습니다.");
            return;
         }
          System.out.println("확인할 학년을 입력해주세요");
          int grade  = scn.nextInt();
         System.out.println("학기를 입력해주세요");
          int hakgi = scn.nextInt();
          
          String sql2 = "           select c.*from"
                  + "               (select b.*,rank()over (order by avg desc) classrank "
                  + "                from (select a.*,rank()over (order by avg desc) schoolrank "
                  + "                from(select i.userid userid,i.name name,i.school school,s.grade grade,s.hakgi hakgi,s.ban ban,round((s.eng+s.kor+s.math)/3) avg,eng,kor,math,(eng+kor+math) hap"
                  + "                    from student_info i,student_score s"
                  + "                    where i.userid=s.userid "
                  + "                            and s.grade='"+grade+"'"
                  + "                            and s.hakgi='"+hakgi+"'"
                  + "                            order by avg desc)a)b"
                  + "                            where ban = (select ban from student_score where userid='"+userid+"' and grade='"+grade+"' and hakgi='"+hakgi+"'))c"
                  + "                            where userid ='"+userid+"'";
          
         ResultSet rs = stmt.executeQuery(sql2);
         while(rs.next()) {
            String name=rs.getString("name");
            String school=rs.getString("school");
            String eng=rs.getString("eng");
            String kor=rs.getString("kor");
            String math=rs.getString("math");
            String hap =rs.getString("hap");
            String avg =rs.getString("avg");
            String classrank = rs.getString("classrank");
             String schoolrank = rs.getString("schoolrank");
            
             System.out.println("[성적조회 결과]");
             System.out.println("학생ID: "+userid);
             System.out.println("학생명: "+name);
             System.out.println("소속학교: "+school);
             System.out.println("학년: "+grade+"학년");
             System.out.println("학기: "+hakgi+"학기");
             System.out.println("영어\s 국어\s 수학\s 합계\s 평균\s (반)석차\s (전교)석차");
             System.out.println(eng+"\s   "+kor+"\s "+math+"\s  "+hap+"\s "+avg+"\s   ("+classrank+"/5)\s   ("+schoolrank+"/10)");
          }         

     }

     //마해빈       
     public static void studentImport(String file_path) throws Exception {
      
      Statement stmt =Connection().createStatement();
      Calendar cal = Calendar.getInstance();
      long t1 =cal.getTimeInMillis();
      
      FileReader file = new FileReader(file_path);
      BufferedReader buffer =new BufferedReader(file);
      String rowData ="";
      int cnt = 0;
         String Info_path = "C:/temp100/StudentInfo.txt";
         String Score_path = "C:/temp100/Studentscore.txt";
         if(file_path.equals(Info_path)) {
            while(true) {
               if ((rowData =buffer.readLine()) != null) {
                  String[] datas = rowData.split(",");
                  String sql = "Insert into  Student_Info "
                        + "values( '"+datas[0]
                        +"','"+datas[1]
                        +"','"+datas[2]
                        +"','"+datas[3]
                        +"','"+datas[4]+"')";
                  int result= stmt.executeUpdate(sql);
                  if(result ==1) cnt++;
                  System.out.println(sql);
               }else break;
            }
         }else if(file_path.equals(Score_path)) {
            
            while(true) {
               if ((rowData =buffer.readLine()) != null) {
                  String[] datas = rowData.split(",");
                  String sql = "Insert into Student_Score "
                        + "values ('"+datas[0]
                        +"','"+datas[1]
                        +"','"+datas[2]
                        +"','"+datas[3]
                        +" ',"+datas[4]
                        +"  ,"+datas[5]
                        +"  ,"+datas[6]+")";
                        
                  int result= stmt.executeUpdate(sql);
                  if(result ==1) cnt++;
                  System.out.println(sql);
               }else break;
            }//while close   
         }

      cal= Calendar.getInstance();
      long t2 = cal.getTimeInMillis();
      long t3 = t2 -t1;
      System.out.println(t3 + " 밀리 초");
      System.out.println( "총" + cnt + "건 입력완료" );
   }
     
     //허철호
     public static void studentAllInfo() throws Exception{
         Statement stmt = Connection().createStatement();
         System.out.println("====전체 학생 정보====");
         
            String sql="Select userid,name,"
                  + "school,"
                  + "to_char(birthday,'yyyy-mm-dd') birthday"
                  + ",gender "
                  + "from Student_info ";
            ResultSet rs2= stmt.executeQuery(sql);
            while(rs2.next()) {
               String userid = rs2.getString("userid");
               String name = rs2.getString("name");
               String school = rs2.getString("school");
               String birthday = rs2.getString("birthday");
               String gender = rs2.getString("gender");
               System.out.println("아이디\t 학생명\t  소속학교\t 생년월일\t  \t성별");
            
            System.out.println(userid+"\t"+name+"\t"+school+"\t"+birthday+"\t"+gender);
         }
      }
   
}
	