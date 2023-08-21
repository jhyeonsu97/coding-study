package egov.mywork1.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egov.mywork1.service.BoardVO;
import egov.mywork1.service.DefaultVO;
import egov.mywork1.service.LibraryService;
import egov.mywork1.service.LibraryVO;
import egov.mywork1.service.MemberService;
import egov.mywork1.service.MemberVO;
import egov.mywork1.service.NoticeVO;

@Controller
public class LibraryController {

	@Resource(name="libraryService")
	LibraryService libraryService;
	
		
	@RequestMapping("/bookInput.do")
	public String bookInput() {
		
		return "library/bookInput";
	}
	
	@RequestMapping("/bookInputSave.do")
	@ResponseBody
	public String insertBook(LibraryVO vo) throws Exception {
	
	String str = "";
	
	// insert -> 성공:null, 실패:x
	String result = libraryService.insertBook(vo);
	
	str = (result==null)?"true":"false";
	// System.out.println(":::::::::::::::::"+str);
	return str;
	}
	
   @RequestMapping("/bookList.do")
   public String selectLibraryList(DefaultVO vo, ModelMap model) 
                                 throws Exception {
      // 화면에 출력할 개수
      int pageUnit = vo.getPageUnit();
      
      // 현재 페이지 번호
      int pageIndex = vo.getPageIndex();
      
      // firstIndex 값 계산 ;;  1->1 ; 2->11 ; 3->21
      int firstIndex = (pageIndex-1)*pageUnit + 1;
      
      // lastIndex 값 계산
      int lastIndex = pageIndex*pageUnit;
      
      vo.setFirstIndex(firstIndex);
      vo.setLastIndex(lastIndex);
      
      int total = libraryService.selectBookTotal(vo);
      
      // 화면출력 시작번호
      int recordCountPerPage = total - ((pageIndex-1)*pageUnit);
      vo.setRecordCountPerPage(recordCountPerPage);
      
      // 12/10 ->  ceil(1.2) -> 2
      int lastPage = (int) Math.ceil((double)total/pageUnit);
      vo.setLastPage(lastPage);

      List<?> list = libraryService.selectBookList(vo);
   
      model.addAttribute("vo", vo);
      model.addAttribute("total", total);
      model.addAttribute("resultList", list);
      
      return "library/bookList";
   }
   
  
   /*
    *  게시판 상세보기
    */
   @RequestMapping("/bookDetail.do")
   public String selectBookDetail( String unq
                           ,ModelMap model) throws Exception {
      // 조회수 증가
	   libraryService.updateBookHits(unq);
      
      // 상세보기  
	  LibraryVO vo = libraryService.selectBookDetail(unq);
      model.addAttribute("vo", vo);
      
      return "library/bookDetail";
   }
   
  	   
	   
}