package egov.mywork1.service.impl;

import java.util.Map;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egov.mywork1.service.MemberVO;

@Repository("memberDAO")
public class MemberDAO extends EgovAbstractDAO {

   public String insertMember(MemberVO vo) {
      return (String) insert("memberDAO.insertMember",vo);
   }

   public int selectMemberUserid(String userid) {
      return (int) select("memberDAO.selectMemberUserid",userid);
   }

   public int selectMemberNickname(String nickname) {
      return (int) select("memberDAO.selectMemberNickname",nickname);
   }

   public String selectMemberLogin(MemberVO vo) {
      return (String) select("memberDAO.selectMemberLogin",vo);
   }

   public MemberVO selectMemberDetail(String userid) {
      return (MemberVO) select("memberDAO.selectMemberDetail",userid);
   }

   public int updateMember(MemberVO vo) {
      return update("memberDAO.updateMember",vo);
   }

   public String selectPreventName(int no) {
      return (String) select("memberDAO.selectPreventName",no);
   }

   public String selectMemberUseridReturn(MemberVO vo) {
      return (String) select("memberDAO.selectMemberUseridReturn",vo);
   }

   public int selectMemberExistCount(MemberVO vo) {
      return (int) select("memberDAO.selectMemberExistCount",vo);
   }

   public void updateMemberPass(MemberVO vo) {
      update("memberDAO.updateMemberPass",vo);
   }

   public int updateMemberPass(Map<String, String> map) {
      return update("memberDAO.updateMemberNewPass",map);
   }

   public String selectMemberState(String userid) {
	   return (String) select("memberDAO.selectMemberState",userid);
}

}


