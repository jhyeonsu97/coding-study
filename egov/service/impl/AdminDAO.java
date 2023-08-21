package egov.mywork1.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egov.mywork1.service.DefaultVO;
import egov.mywork1.service.MemberVO;
import egov.mywork1.service.MenuVO;
import egov.mywork1.service.NoticeVO;

@Repository("adminDAO")
public class AdminDAO  extends EgovAbstractDAO {

	public String insertNotice(NoticeVO vo) {
		return (String) insert("adminDAO.insertNotice",vo);
	}

	public List<?> selectNoticeList(DefaultVO vo) {
		return list("adminDAO.selectNoticeList",vo);
	}

	public int selectNoticeTotal(DefaultVO vo) {
		return (int) select("adminDAO.selectNoticeTotal",vo);
	}

	public NoticeVO selectNoticeDetail(String unq) {
		return (NoticeVO) select("adminDAO.selectNoticeDetail",unq);
	}

	public int deleteNotice(String unq) {
		return delete("adminDAO.deleteNotice",unq);
	}

	public int updateNotice(NoticeVO vo) {
		return update("adminDAO.updateNotice",vo);
	}

	public List<?> selectMemberList(DefaultVO vo) {
		return list("adminDAO.selectMemberList",vo);
	}

	public int selectMemberTotal(DefaultVO vo) {
		return (int) select("adminDAO.selectMemberTotal",vo);
	}

	public MemberVO selectMemberDetail(String userid) {
		return (MemberVO) select("adminDAO.selectMemberDetail",userid);
	}

	public int updateMemberSave(MemberVO vo) {
		return update("adminDAO.updateMemberSave",vo);
	}

	public int deleteMemberUser(String userid) {
		return delete("adminDAO.deleteMemberUser",userid);
	}

	public String insertMenu(MenuVO vo) {
		return (String) insert("adminDAO.insertMenu",vo);
	}

	public List<?> selectMenuList() {
		return list("adminDAO.selectMenuList");
	}

	public int updateMenu(MenuVO vo) {
		return update("adminDAO.updateMenu",vo);
	}

	public int deleteMenu(String no) {
		return delete("adminDAO.deleteMenu",no);
	}

	public int updateMenuNo(String no) {
		return update("adminDAO.updateMenuNo",no);
	}

}




