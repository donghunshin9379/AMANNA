package com.spring.biz.view.match;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.biz.match.MatchService;
import com.spring.biz.match.MatchVO;
import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;

/*
@SessionAttributes : 같은 컨트롤러에서 모델(Model)객체 공유해서 사용하려는 경우 사용
	단, 현재(동일) 컨트롤러에서만 사용가능
	사용후에는 SessionStatus 객체의 setComplete() 메소드로 사용해제
*/
@SessionAttributes("match") // member 라는 이름의 Model 객체가 있으면 session 에 저장
@Controller
public class MatchController {
	//@Autowired
	private MatchService matchService;
	private MemberService memberService;
	
	public MatchController() {
		System.out.println("==========> MatchController() 객체 생성");
	}
	
	@Autowired
	public MatchController(MatchService matchService, MemberService memberService) {
		System.out.println("==========> MatchController(matchService) 객체 생성");
		this.matchService = matchService;
		this.memberService = memberService;
	}
// 동훈=======================================================================================================================================
	@RequestMapping("/insertMatching.do")
	public String insertMatching(MatchVO vo, HttpSession session) throws IllegalStateException, IOException {
		
		//로그인 아이디값 추출
		MemberVO member = (MemberVO) session.getAttribute("member");
		String memberId = member.getId();
		System.out.println("로그인한 내아이디(신청자) : " + memberId);
		//게시물 프로필 (상대) 아이디값 추출
		String recId = vo.getId();
		System.out.println("상대프로필(피신청자) 아이디 : " + recId);
		
		matchService.insertMatching(vo);
		
		return "getMemberList.do";
	}
	
	@RequestMapping("/getCaller.do")
	public String getCaller(MatchVO vo, Model model, HttpSession session) {
		// 세션에서 "member" 속성 값을 가져옴
	    MemberVO member = (MemberVO) session.getAttribute("member");
	    System.out.println("로그인 정보 : " + member);
		
		MatchVO caller = matchService.getCaller(vo);
		model.addAttribute("caller", caller); // Model 객체 사용 View에 데이터 전달
		System.out.println("caller의 이미지네임 : " + caller.getImgName());
		return "getCaller.jsp";
	}	
	
	@RequestMapping("/getReceiver.do")
	public String getReceiver(MatchVO vo, Model model, HttpSession session) {
		// 세션에서 "member" 속성 값을 가져옴
	    MemberVO member = (MemberVO) session.getAttribute("member");
	    System.out.println("로그인 정보 : " + member);
		
		MatchVO receiver = matchService.getReceiver(vo);
		model.addAttribute("receiver", receiver); // Model 객체 사용 View에 데이터 전달
		
		return "getReceiver.jsp";
	}	
	
	@RequestMapping("/yesMatch.do")
	public String yesMatch(MatchVO vo, Model model,HttpSession session) {
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		System.out.println("mvo : " + mvo);
		System.out.println(">>> 매칭 수락  vo : "+ vo);
		
		 String id = mvo.getId();
		 
		 System.out.println("id : " + id);
		 mvo.setId(id);
		 
		memberService.ticketMinus(mvo);
		matchService.yesMatch(vo);
		return "getMatchList.do";
	}
	
	@RequestMapping("/noMatch.do")
	public String noMatch(MatchVO vo, Model model) {
		System.out.println(">>> 매칭 거절  vo : " + vo);
		
		matchService.noMatch(vo);
		return "getMatchList.do";
	}
	
	@RequestMapping("/cancelMatch.do")
	public String cancelMatch(MatchVO vo, Model model) {
		System.out.println(">>> 매칭신청 취소  >>");
		
		matchService.cancelMatch(vo);
		return "getMatchList.do";
	}
	
	@RequestMapping("/getMatchList.do")
	   public String getMatchList(MatchVO vo, Model model, HttpSession session,  HttpServletResponse response) {
	      System.out.println(">>> 신청 수신/발신 보여주기 id : " + vo.getId());
	      
	      
	      // 세션에서 "member" 속성 값을 가져옴
	       MemberVO member = (MemberVO) session.getAttribute("member");
	       System.out.println("로그인 정보 : " + member);
	       
	       // 세션 값 사용 
	       if (member != null) {
	           // member 객체가 존재하는 경우 처리 로직 작성
	          
	          // 요청 수신내역
	         List<MatchVO> list = matchService.getMatchList(member);
	         
	         // 요청 발신내역
	         List<MatchVO> myList = matchService.getMyMatchList(member);
	         
	         model.addAttribute("matchList", list);
	         model.addAttribute("myMatchList", myList);
	          
	          return "getMatchList.jsp";
	       } else {
	           // member 객체가 존재하지 않는 경우 처리 로직 작성
	          System.out.println("로그인세션이 만료되었습니다, 다시 로그인 해주세요");
	          try {
	              // 응답에 JavaScript 코드 추가
	        	  response.setContentType("text/html; charset=UTF-8");

	              response.getWriter().println("<script>alert('로그인 세션이 만료되었습니다.');</script>");
	              response.getWriter().flush();
	          } catch (IOException e) {
	              e.printStackTrace();
	          }
	          return "login.jsp";
	       }
	      
	   }

	
}
