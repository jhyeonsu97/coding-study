package egov.mywork1.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egov.mywork1.service.DefaultVO;
import egov.mywork1.service.MobileVO;

@Repository("mobileDAO")
public class MobileDAO extends EgovAbstractDAO {
	
	public String insertMobile(MobileVO vo) {
		return (String) insert("mobileDAO.insertMobile",vo);
	}

	public List<?> selectMobileList(DefaultVO vo) {
		return list("mobileDAO.selectMobileList",vo);
	}

	public List<?> selectMobileList2(DefaultVO vo) {
		return list("mobileDAO.selectMobileList2",vo);
	}

	public int deleteMobile(DefaultVO vo) {
		return delete("mobileDAO.deleteMobile",vo);
	}

}
