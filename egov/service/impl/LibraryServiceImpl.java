package egov.mywork1.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.mywork1.service.BoardVO;
import egov.mywork1.service.DefaultVO;
import egov.mywork1.service.LibraryService;
import egov.mywork1.service.LibraryVO;
import egov.mywork1.service.MemberService;
import egov.mywork1.service.MemberVO;

@Service("libraryService")
public class LibraryServiceImpl implements LibraryService {

	@Resource(name="libraryDAO")
	LibraryDAO libraryDAO;
	
	@Override
	public String insertBook(LibraryVO vo) throws Exception {
		return libraryDAO.insertBook(vo);
	}

	@Override
	public int updateBookHits(String unq) throws Exception {
		return libraryDAO.updateBookHits(unq);
	}

	@Override
	public LibraryVO selectBookDetail(String unq) throws Exception {
		return libraryDAO.selectBookDetail(unq);
	}

	@Override
	public int selectBookTotal(DefaultVO vo) throws Exception {
		return libraryDAO.selectBookTotal(vo);
	}

	@Override
	public List<?> selectBookList(DefaultVO vo) throws Exception {
		return libraryDAO.selectBookList(vo);
	}




}
