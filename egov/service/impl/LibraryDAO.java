package egov.mywork1.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egov.mywork1.service.BoardVO;
import egov.mywork1.service.DefaultVO;
import egov.mywork1.service.LibraryVO;
import egov.mywork1.service.NoticeVO;

@Repository("libraryDAO")
public class LibraryDAO extends EgovAbstractDAO {

	public String insertBook(LibraryVO vo) {
		return (String) insert("libraryDAO.insertBook",vo);
	}

	public int updateBookHits(String unq) {
		return update("libraryDAO.updateBookHits",unq);
	}

	public LibraryVO selectBookDetail(String unq) {
		return (LibraryVO) select("libraryDAO.selectBookDetail",unq);
	}

	public int selectBookTotal(DefaultVO vo) {
		return (int) select("libraryDAO.selectBookTotal",vo);
	}

	public List<?> selectBookList(DefaultVO vo) {
		return list("libraryDAO.selectBookList",vo);
	}

	

}
