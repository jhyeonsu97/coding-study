package egov.mywork1.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egov.mywork1.service.BoardVO;
import egov.mywork1.service.DefaultVO;
import egov.mywork1.service.MemberService;
import egov.mywork1.service.MobileService;
import egov.mywork1.service.MobileVO;

@Controller
public class MobileController {
	
	@Resource(name="mobileService")
	MobileService mobileService;
	
	@RequestMapping("/mobileWrite.do")
	public String mobileWrite() {
		
		return "mobile/mobileWrite";
	}
	
	@RequestMapping("/mobileWriteSave.do")
	@ResponseBody
	public String insertMobile(MobileVO vo) throws Exception {
		String str = "";
		String result = mobileService.insertMobile(vo);
		if( result == null ) str = "ok";
		return str;
	
	}
	
	@RequestMapping("/mobileList.do")
	public String selectMobileList(DefaultVO vo, ModelMap model) throws Exception {
		List<?> list = mobileService.selectMobileList(vo);
		
		model.addAttribute("resultList", list);
		model.addAttribute("vo", vo);
	
		return "mobile/mobileList";
	}
	
	@RequestMapping("/mobileList2.do")
	public String selectMobileList2(DefaultVO vo, ModelMap model) throws Exception {
		List<?> list = mobileService.selectMobileList2(vo);
		
		model.addAttribute("resultList", list);
		model.addAttribute("vo", vo);
	
		return "mobile/mobileList2";
	}
	
	@RequestMapping("/mobileDelete.do")
	@ResponseBody
	public String deleteMobile(MobileVO vo) throws Exception {
		
		int result = mobileService.deleteMoible(vo);
		String str = "";
		if(result == 1) str = "ok";
		else str = "fail";
		
		return str;
	}
	
}

