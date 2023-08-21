package egov.mywork1.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.mywork1.service.DefaultVO;
import egov.mywork1.service.MobileService;
import egov.mywork1.service.MobileVO;

@Service("mobileService")
public class MobileServiceImpl implements MobileService {
	
	@Resource(name="mobileDAO")
	MobileDAO mobileDAO;

	@Override
	public String insertMobile(MobileVO vo) throws Exception {
		return mobileDAO.insertMobile(vo);
	}

	@Override
	public List<?> selectMobileList(DefaultVO vo) throws Exception {
		return mobileDAO.selectMobileList(vo);
	}

	@Override
	public List<?> selectMobileList2(DefaultVO vo) throws Exception {
		return mobileDAO.selectMobileList2(vo);
	}

	@Override
	public int deleteMobile(DefaultVO vo) throws Exception {
		return mobileDAO.deleteMobile(vo);
	}

	@Override
	public int deleteMoible(MobileVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


}
