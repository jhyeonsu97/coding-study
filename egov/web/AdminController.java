package egov.mywork1.web;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egov.mywork1.service.AdminService;
import egov.mywork1.service.DefaultVO;
import egov.mywork1.service.MemberVO;
import egov.mywork1.service.MenuVO;
import egov.mywork1.service.NoticeVO;

@Controller
public class AdminController {

	@Resource(name="adminService")
	AdminService adminService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/*
	 * (관리자) 회원목록
	 */
	@RequestMapping("/adminMemberList.do")
	public String selectMemberList(DefaultVO vo, ModelMap model) 
													throws Exception {
		// 출력페이지 번호
		int pageIndex = vo.getPageIndex();
		
		// 화면출력 개수 
		int pageUnit = vo.getPageUnit();
		
		// firstIndex 값 계산 ;;  1->1 ; 2->11 ; 3->21
		int firstIndex = (pageIndex-1)*pageUnit + 1;
		
		// lastIndex 값 계산
		int lastIndex = pageIndex*pageUnit;
		
		vo.setFirstIndex(firstIndex);
		vo.setLastIndex(lastIndex);
		
		int total = adminService.selectMemberTotal(vo);
		
		// 출력화면 시작번호
		int recordCountPerPage = total - ((pageIndex-1)*pageUnit);
		vo.setRecordCountPerPage(recordCountPerPage);

		// 12/10 ->  ceil(1.2) -> 2
		int lastPage = (int) Math.ceil((double)total/pageUnit);
		vo.setLastPage(lastPage);

		List<?> list = adminService.selectMemberList(vo);
		
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		model.addAttribute("total", total);
		
		return "admin/member/adminMemberList";
	}
	
	@RequestMapping("/adminNoticeList.do")
	public String selectNoticeList(DefaultVO vo, ModelMap model) 
													throws Exception {
		// 출력페이지 번호
		int pageIndex = vo.getPageIndex();
		
		// 화면출력 개수 
		int pageUnit = vo.getPageUnit();
		
		// firstIndex 값 계산 ;;  1->1 ; 2->11 ; 3->21
		int firstIndex = (pageIndex-1)*pageUnit + 1;
		
		// lastIndex 값 계산
		int lastIndex = pageIndex*pageUnit;
		
		vo.setFirstIndex(firstIndex);
		vo.setLastIndex(lastIndex);
		
		int total = adminService.selectNoticeTotal(vo);
		
		// 출력화면 시작번호
		int recordCountPerPage = total - ((pageIndex-1)*pageUnit);
		vo.setRecordCountPerPage(recordCountPerPage);

		// 12/10 ->  ceil(1.2) -> 2
		int lastPage = (int) Math.ceil((double)total/pageUnit);
		vo.setLastPage(lastPage);
		
		List<?> list = adminService.selectNoticeList(vo);
		
		model.addAttribute("resultList", list);
		model.addAttribute("vo", vo);
		model.addAttribute("total", total);
		
		
		return "admin/board/adminNoticeList";
	}
	
	@RequestMapping("/adminNoticeWrite.do")
	public String adminNoticeWrite() {
		
		return "admin/board/adminNoticeWrite";
	}
	
	@RequestMapping("/adminNoticeSave.do")
	@ResponseBody
	public String insertNotice(NoticeVO vo) throws Exception {
		
		String emps = vo.getEmps();
		if( emps == null || emps.equals("") ) emps = "N";
		vo.setEmps(emps);
		
		
		String str = "";
		String result = adminService.insertNotice(vo);
		if( result == null ) str = "ok";
		
		return str;
	}
	
	@RequestMapping("/adminNoticeDetail.do")
	public String selectNoticeDetail(String unq, ModelMap model) 
													throws Exception {
		NoticeVO vo = adminService.selectNoticeDetail(unq);
		
		String content = vo.getContent();
		content = content.replace("\n","<br>");
		content = content.replace(" ","&nbsp;");
		vo.setContent(content);
		
		
		model.addAttribute("vo", vo);

		return "admin/board/adminNoticeDetail";
	}
	
	@RequestMapping("/adminMemberModify.do")
	public String selectMemberModify(String userid, ModelMap model ) 
													throws Exception {
		
		MemberVO vo = adminService.selectMemberDetail(userid);
		model.addAttribute("vo", vo);
		
		return "admin/member/adminMemberModify";
	}
	
	/*
	 * 회원정보변경처리
	 */
	@RequestMapping("/adminMemberModifySave.do")
	@ResponseBody
	public String updateMemberSave(MemberVO vo) 
									throws Exception {
		String str = "";
		
		String mailchk = vo.getMailchk();
		String smschk = vo.getSmschk();
		if(mailchk == null || mailchk.equals("")) {
			vo.setMailchk("N");
		}
		if(smschk == null || smschk.equals("")) {
			vo.setSmschk("N");
		}
	
		int cnt = adminService.updateMemberSave(vo);
		if( cnt == 1 ) str = "ok";
		
		return str;
	}

	@RequestMapping("/adminMemberDelete.do")
	@ResponseBody
	public String deleteMemberUser(String userid) 
										throws Exception {
		String str = "";
		int cnt = adminService.deleteMemberUser(userid);
		if( cnt == 1 ) str = "ok";
		
		return str;
	}
	
	@RequestMapping("/adminNoticeDelete.do")
	@ResponseBody
	public String deleteNotice(String unq) throws Exception {
		
		String str = "";
		int result = adminService.deleteNotice(unq);
		if( result == 1 ) str = "ok";
		
		return str;
	}
	
	@RequestMapping("/adminNoticeModify.do")
	public String selectNoticeModify(String unq, ModelMap model) 
													throws Exception {
		NoticeVO vo = adminService.selectNoticeDetail(unq);
		model.addAttribute("vo", vo);

		return "admin/board/adminNoticeModify";
	}
	
	@RequestMapping("/adminNoticeModifySave.do")
	@ResponseBody
	public String updateNotice(NoticeVO vo) throws Exception {
		
		String str = "";
		int result = adminService.updateNotice(vo);
		if (result == 1) str = "ok";
		
		return str;
	}
	
	@RequestMapping("/gdsWrite.do")
	public String gdsWrite() {

		return "admin/shop/gdsWrite";
	}
	
	@RequestMapping("/gdsWriteSave.do")
	@ResponseBody
	public String insertFileboard(
						MultipartHttpServletRequest multiRequest) 
															throws Exception {
		/* a.jpg --> sdfsdfasfasdfasdfasfdsadf.xxvcvsdfsdf
		 * MultipartHttpServletRequest : 다중파일업로드 클래스
		 *  (1) 물리파일이 클라이언트에서 서버로 올라오면  
		 *  (2) 물리파일의 모든정보(예:파일명,파일사이즈)들은 해당 클래스에 의해 메모리에 올라가고
		 *  (3) 동시에 /tmp 디렉토리에 물리 파일을 임시 저장시킨다.
		 *  (4) /tmp 디렉토리에 저장된 파일을 사이트의 특정 디렉토리로 옮기는 것이 목적임
		 */
		
		//String path = "D:/eGovFrameDev-4.0.0-64bit/workspace/mywork101/src/main/webapp/carImage";
		String path = propertiesService.getString("Globals.fileStorePath");
		
		// 파일업로드는 아래 메소드에서 진행
		Map<String,String> map1 = uploadProcess(multiRequest,path);
		
		//vo.setFilename(map1.get("f1"));
		//vo.setFilesize(map1.get("f2"));
		
		//String result = adminService.insertFileboard(vo);
	
		String message = "ok";
		
		//if( result != null ) message = "error"; 
		//map.put("filename", filename);
		//map.put("cnt", Integer.toString(cnt));
		//System.out.println("filename :::: " + filename);

		return message;
	}
	
	public static Map<String,String> uploadProcess( 
									   MultipartHttpServletRequest multiRequest 
								     , String path ) throws Exception {
		String filePath  = "";
		String filenames = "";
		String filesizes = "";
		
		/* multiRequest 변수를 통해 파일 정보들을 가져와 Map에 넣음
		 * */
		Map<String, MultipartFile> files = multiRequest.getFileMap();				

		/*for( String key : files.keySet() ) {
			//System.out.println(key + "," + files.get(key));
			System.out.println("--------------");
			System.out.print(files.get(key).getOriginalFilename());
			System.out.print(files.get(key).getName());
			System.out.print(files.get(key).getSize());
		}*/
		
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			MultipartFile file = entry.getValue();
			filePath = path + "/" + file.getOriginalFilename();
			file.transferTo(new File(filePath));
			filenames += file.getOriginalFilename() + "／";
			filesizes += file.getSize() + "／";
		}
		
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("f1",filenames);  //  filenames = "index.jsp／1234.PNG／";
		map1.put("f2",filesizes);  //         137／28647／
		return map1;
	}
	
	@RequestMapping(value="/menuAdmin.do")
	public String selectMenuList( ModelMap model ) throws Exception {

		List<?> list = adminService.selectMenuList();
		model.addAttribute("list", list);
		
		return "admin/shop/menuAdmin";
	}
	
	@RequestMapping(value="/menuRegister.do")
	@ResponseBody
	public String insertMenu(MenuVO vo) throws Exception {

		String str = "";
		
		if(vo.getNo() == null || vo.getNo().equals("")) {
			String result = adminService.insertMenu(vo);
			if( result == null ) str = "ok";
		} else {
			int cnt = adminService.updateMenu(vo);  // update 결과 : 개수 1
			if( cnt == 1 ) str = "ok";
		}
		return str;
	}
	
	@RequestMapping("/menuDelete.do")
	@ResponseBody
	public String deleteMenu(String no) throws Exception {
		
		String str = "";
		int cnt  = adminService.deleteMenu(no);
		int cnt2 = adminService.updateMenuNo(no);
		
		if( cnt == 1 ) str = "ok";
		
		return str;
	}
	
	@RequestMapping("/menuNoChange.do")
	@ResponseBody
	public String menuNoAllChange(String[] code, String[] no) throws Exception {
		String str = "";
		System.out.println(code.length);
		System.out.println(code[0]+","+no[0]);
		System.out.println(code[1]+","+no[1]);
		return str;
	}
	
	
		
}






