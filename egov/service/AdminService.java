package egov.mywork1.service;

import java.util.List;

public interface AdminService {

	String insertNotice(NoticeVO vo) throws Exception;
	List<?> selectNoticeList(DefaultVO vo) throws Exception;
	int selectNoticeTotal(DefaultVO vo) throws Exception;
	NoticeVO selectNoticeDetail(String unq) throws Exception;
	int deleteNotice(String unq) throws Exception;
	int updateNotice(NoticeVO vo) throws Exception;
	
	// 회원목록
	List<?> selectMemberList(DefaultVO vo) throws Exception;
	
	// 회원총개수
	int selectMemberTotal(DefaultVO vo) throws Exception;
	
	// 회원상세
	MemberVO selectMemberDetail(String userid) throws Exception;
	
	// 회원수정처리
	int updateMemberSave(MemberVO vo) throws Exception;
	
	// 회원삭제처리
	int deleteMemberUser(String userid) throws Exception;
	
	// 메뉴등록처리
	String insertMenu(MenuVO vo) throws Exception;
	
	// 메뉴목록
	List<?> selectMenuList() throws Exception;
	
	// 메뉴수정
	int updateMenu(MenuVO vo) throws Exception;
	
	// 메뉴삭제
	int deleteMenu(String no) throws Exception;
	
	// 출력번호 변경(삭제 데이터를 이용한)
	int updateMenuNo(String no) throws Exception;

}






