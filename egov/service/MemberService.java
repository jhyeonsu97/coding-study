package egov.mywork1.service;

import java.util.Map;

public interface MemberService {

   String insertMember(MemberVO vo) throws Exception;
   int selectMemberUserid(String userid) throws Exception;
   int selectMemberNickname(String nickname) throws Exception;
   String selectMemberLogin(MemberVO vo) throws Exception;
   MemberVO selectMemberDetail(String userid) throws Exception;
   int updateMember(MemberVO vo) throws Exception;
   String selectPreventName(int no) throws Exception;
   String selectMemberUseridReturn(MemberVO vo) throws Exception;
   int selectMemberExistCount(MemberVO vo) throws Exception;
   void updateMemberPass(MemberVO vo) throws Exception;
   int updateMemberPass(Map<String, String> map) throws Exception;
   String selectMemberState(String userid) throws Exception;;
   
   
}