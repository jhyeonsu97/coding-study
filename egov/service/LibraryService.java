package egov.mywork1.service;

import java.util.List;

public interface LibraryService {
	String insertBook(LibraryVO vo) throws Exception;
	int updateBookHits(String unq) throws Exception;
	LibraryVO selectBookDetail(String unq) throws Exception;
	int selectBookTotal(DefaultVO vo) throws Exception;
	List<?> selectBookList(DefaultVO vo) throws Exception;

	
}
