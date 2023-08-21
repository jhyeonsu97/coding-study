package egov.mywork1.service;

import java.util.List;

public interface MobileService {
	
	String insertMobile(MobileVO vo) throws Exception;
	public List<?> selectMobileList(DefaultVO vo) throws Exception;
	public List<?> selectMobileList2(DefaultVO vo) throws Exception;
	int deleteMoible(MobileVO vo) throws Exception;
	int deleteMobile(DefaultVO vo) throws Exception;
}
