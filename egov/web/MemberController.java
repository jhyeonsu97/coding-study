package egov.mywork1.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egov.mywork1.service.MemberService;
import egov.mywork1.service.MemberVO;

@Controller
public class MemberController {

	@Resource(name="memberService")
	MemberService memberService;
	
	
	
	@RequestMapping("/loginWrite.do")
	public String loginWrite() {
		
		return "member/loginWrite";
	}
	
	@RequestMapping("/mbrConditions.do")
	public String mbrConditions() {
		
		return "member/mbrConditions";
	}
	
	@RequestMapping("/mbrJoinWrite.do")
	public String mbrJoinWrite( ModelMap model ) throws Exception {
		
		// 0 ~ 1 , 0.78787878*10 -> Math.ceil(7.8989) -> 8.0
		int n = (int) Math.ceil(Math.random()*10);
		String filename = memberService.selectPreventName(n);
		filename = filename.replace(".jpg","");
		
		model.addAttribute("n", n);
		model.addAttribute("filename", filename);
		
		return "member/mbrJoinWrite";
	}
	
	@RequestMapping("/preventImg.do")
	@ResponseBody
	public String selectPreventImg( String no ) throws Exception {
		
		System.out.println("no ::::::: " + no);
		int no1 = Integer.parseInt(no)+1;
		if( no1 > 10 ) no1 = 1;
		
		String filename = memberService.selectPreventName(no1);
		filename = filename.replace(".jpg","");
		
		System.out.println("filename ::::::: " + filename);
		
		return filename+","+no1;
	}
	
	
	@RequestMapping("/mbrJoinSave.do")
	@ResponseBody
	public String insertMember(MemberVO vo) throws Exception {
		String str = "3";
		int result1 = memberService.selectMemberUserid(vo.getUserid());
		if(result1 == 1) { 
			str = "2"; // 아이디중복
		} else { 
			result1 = memberService.selectMemberNickname(vo.getNickname());
			if(result1 == 1) {
				str = "4";  // 닉네임중복
			} else {
				
				String pass1 = vo.getPass();      // 1234
				String pass2 = MyEncrypt.testMD5(pass1); // 암호화
				vo.setPass(pass2);
				
				memberService.insertMember(vo);
				str = "1"; // 저장성공
			}
		}
		return str;
	}
	
	// mbrUserIdCheck.do
	@RequestMapping("/mbrUserIdCheck.do")
	@ResponseBody
	public String selectMemberUserid(String userid) throws Exception {
		
		String msg = "3"; 
		int result = 0;
		String pattern = "[a-zA-Z]{1}[0-9a-zA-Z_]{2,19}"; // a
		boolean pattern_chk = userid.matches(pattern);    // true,false
		if(pattern_chk == true) {
			result = memberService.selectMemberUserid(userid);
			if(result == 0) { 
				msg = "1"; // 사용가능
			}
			else msg = "2"; // 이미사용중
		} 
		return msg;
	}
	
	@RequestMapping("/logout.do")
	@ResponseBody
	public String logout(HttpSession session) {
		session.removeAttribute("SessionUserID");
		return "1";
	}
	
	/*
	 *  로그인처리
	 */
	@RequestMapping(value="/loginSession.do", 
					produces="application/text;charset=utf-8")
	@ResponseBody
	public String loginSession(	MemberVO vo, 
								HttpSession session) throws Exception {
		
		String str = "";
		
		String state = memberService.selectMemberState(vo.getUserid());
		if( !state.equals("1") ) str = "4";
		
		// 패스워드의 암호화 처리
		String pass1 = vo.getPass();
		String pass2 = MyEncrypt.testMD5(pass1);
		vo.setPass(pass2);
	
		String name = memberService.selectMemberLogin(vo);
		
		if( name == null ) {
			str = null;
		} else {
			if( !str.equals("4") ) {
				session.setAttribute("SessionUserID", vo.getUserid());
				str = name;
			}
		}
		return str;
	}
	
	@RequestMapping("/mbrModify.do")
	public String selectMemberDetail(HttpSession session, ModelMap model) 
															throws Exception {
		String url = "member/mbrModify";
		String userid = (String) session.getAttribute("SessionUserID");
		if( userid == null ) {
			url = "redirect:/loginWrite.do";
		}
		
		MemberVO vo = memberService.selectMemberDetail(userid);
		model.addAttribute("vo", vo);
		
		return url;
	}
	
	@RequestMapping("/mbrModifySave.do")
	@ResponseBody
	public String updateMember(MemberVO vo,HttpSession session) throws Exception {
		
		String str = "";
		String userid = (String) session.getAttribute("SessionUserID");
		if( userid == null ) {
			str = "4";
		} else {
			// (1) DB의 별칭과 VO의 별칭의 일치여부 :: jsp(화면)에서 보내 줌
			// (2) 내용 불일치라면 타사용자와의 중복여부 체크
			// (3) 중복인경우(화면으로 return) / 중복이 아닌경우 (저장서비스 실행)
			if(vo.getNickname_change().equals("Y")) {
				int cnt = memberService.selectMemberNickname(vo.getNickname());
				if(cnt == 1) {
					str = "3";
				}
			}
			if( !str.equals("3") ) {
				// result = 1; (OK),  result = 0;
				int result = memberService.updateMember(vo);
				if(result == 1) str = "1";
				else if(result == 0) str = "2";
			}
		}
		return str;
	}
	
	@RequestMapping("/idpwSearch.do")
	public String idpwSearch() {
		return "member/idpwSearch";
	}
	
	@RequestMapping("/idpwSearchSub.do")
	@ResponseBody
	public String selectIdpwSearch(MemberVO vo) throws Exception {			
		
		String str = "";

		/*   아이디를 찾는 경우 
		 * 1. 닉네임,이메일을 조건으로 아이디 검색
		 * 2. 검색에 성공하면 아이디값을 실패하면 "4"를 리턴한다.
		 * */
		if( vo.getUserid() == null || vo.getUserid().equals("") ) {
			String userid = memberService.selectMemberUseridReturn(vo);
			if(userid != null && !userid.equals("")) {
				str = userid;
			} else {
				str = "4";
			}
		
		} 
		/*    암호 재설정인 경우 
		 * 1. 아이디,닉네임,이메일을 조건으로 존재여부 설정
		 * 2. 존재의 경우
		 *    (1) 임의의 암호 생성
		 *    (2) 생성된 암호를 이용하여 기존 암호를 새로운 암호로 변경
		 * 	  (3) 새로운 암호를 화면에 전달한다.
		 * */
		else {  
			int cnt = memberService.selectMemberExistCount(vo);
			if( cnt == 0 ) {
				str = "4";
			} else {
				String pass1 = "123456";
				String pass2 = MyEncrypt.testMD5(pass1);
				vo.setPass(pass2);
				memberService.updateMemberPass(vo);
				
				str = pass1;
			}
		}
		return str;
	}
	
	@RequestMapping("/passChange.do")
	public String passChangeWrite() {
		
		return "member/passChange";
	}
	
	
	@RequestMapping("/passChangeSub.do")
	@ResponseBody
	public String updateMemberPass(HttpSession session,
									    String pass1,
									    String pass2) throws Exception {
		/*
		 * 로그인 여부 확인
		 */
		String userid = (String) session.getAttribute("SessionUserID");
		pass1 = MyEncrypt.testMD5(pass1);
		pass2 = MyEncrypt.testMD5(pass2);
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("userid", userid);
		map.put("pass1", pass1);  // 현재 암호
		map.put("pass2", pass2);  // 새 암호
		
		String str = "";
		
		// result = 1;
		int result = memberService.updateMemberPass(map);
		if(result == 1) {
			str = "1";
		} else {
			str = "4";
		}
		return str;
	}
	
	
	

	/*@RequestMapping("/mbrJoinSave.do")
	@ResponseBody
	public ModelAndView mbrJoinWrite(MemberVO vo) throws Exception {
		
		String str = "";
		String result = memberService.insertMember(vo);
		ModelAndView mv = new ModelAndView("jsonView");
		if (result == null) {
			mv.addObject("str", "ok");
		}
		mv.addObject("test1", "11");
		mv.addObject("test2", "22");
		return mv;
	}*/
	
	
	
	
}
