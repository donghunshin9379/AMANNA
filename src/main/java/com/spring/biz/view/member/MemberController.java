package com.spring.biz.view.member;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;
import com.spring.biz.rboard.RBoardVO;


/*
@SessionAttributes : 같은 컨트롤러에서 모델(Model)객체 공유해서 사용하려는 경우 사용
	단, 현재(동일) 컨트롤러에서만 사용가능
	사용후에는 SessionStatus 객체의 setComplete() 메소드로 사용해제
*/
@SessionAttributes("member") // member 라는 이름의 Model 객체가 있으면 session 에 저장
@Controller 
public class MemberController {
	//@Autowired
	private MemberService memberService;
	
	public MemberController() {
		System.out.println("==========> MemberController() 객체 생성");
	}
	
	@Autowired
	public MemberController(MemberService memberService) {
		System.out.println("==========> MemberController(memberService) 객체 생성");
		this.memberService = memberService;
	}
// 준이햄================================================================================
	@RequestMapping("/getMemberUpdate.do")
	public String getmember(MemberVO vo, Model model ) {
		
		

		MemberVO member = memberService.getMember(vo);
		model.addAttribute("member", member); // Model 객체 사용 View에 데이터 전달
		
		return "getMemberUpdate.jsp";
	}	
	
	
	
	
	@RequestMapping("/pwdChange.do")
	public String pwdChange(MemberVO vo,Model model) {		
		System.out.println(">> 회원정보 수정 처리");
		System.out.println("vo : " + vo);
		String pwd = vo.getPwd();
		
		
		memberService.updatePwd(vo);
		
		return "login.jsp";		
	}
	
// 동훈==================================================================================
	
	// 리턴타입 : ModelAndView ---> String
		@RequestMapping("/getMember.do")
		public String getBoard(MemberVO vo, Model model,HttpSession session ) {
			
			// 내 로그인 정보
			MemberVO member = (MemberVO)session.getAttribute("member");
			System.out.println("유저리스트에 내 로그인 정보 : " + member);
			
			// 상대 프로필 정보
			MemberVO recMember = memberService.getMember(vo);
			model.addAttribute("user", recMember); // Model 객체 사용 View에 데이터 전달
			
			return "getMember.jsp";
		}	
		
		

// 종현================================================================================
				//관리자페이지
				
				//전체 유저보기
				@RequestMapping("/getMemberList2.do")
				public String getMemberList2(Model model, HttpSession session, MemberVO vo ) {
					System.out.println(">>> 전체 유저 목록 보여주기(admin)");
					MemberVO member = (MemberVO)session.getAttribute("member");
					System.out.println("vo : " + vo);
					List<MemberVO> list = memberService.getMemberList(vo);
					model.addAttribute("userList", list);
					
					System.out.println(list);
					return "membership.jsp";
				}
				
				//회원탈퇴
				@RequestMapping("/delete2.do")
				public String deleteMember2(MemberVO vo, SessionStatus sessionStatus) {
					System.out.println(">>> 회원 탈퇴처리");
					System.out.println("vo : " + vo);
					
					memberService.deleteMemeber(vo);
					sessionStatus.setComplete(); //session 데이터 삭제
					
					return "getMemberList2.do"; //
					
				}
				
				
				
				// 아이디/성별 검색
				@ModelAttribute("conditionMap")
				public Map<String, String> searchConditionMap() {
					System.out.println("=====> Map searchConditionMap() 실행");
					Map<String, String> conditionMap = new HashMap<String, String>();
					conditionMap.put("아이디", "ID");
					conditionMap.put("성별", "SEX");
					return conditionMap;
				}
				
				// 남자 매출 합계
				@RequestMapping("/getManTotPay.do")
				public String getManTotPay(MemberVO vo, Model model, HttpSession session) {
					System.out.println(">>> 전체 매출 합계");
					System.out.println("vo : " + vo);
					List<MemberVO> list = memberService.getManTotPay(vo);
					model.addAttribute("manList", list);
					
					List<String> list2 = new ArrayList<String>();
					
					
					list2.add(String.valueOf(list.get(0).getSum()));
					list2.add(String.valueOf(list.get(1).getSum()));
					
					
					System.out.println("list2" + list2);
					model.addAttribute("totList", list2);
					
					System.out.println(list);
					return "chart.jsp";
				}
				
				// 남/녀 회원수
				@RequestMapping("/getSexCnt.do")
				public String getSexCnt(MemberVO vo, Model model, HttpSession session) {
					System.out.println(">>> 전체 남/녀 회원수");
					System.out.println("vo : " + vo);
					List<MemberVO> list = memberService.getSexCnt(vo);
					model.addAttribute("sexList", list);
					
					List<String> list3 = new ArrayList<String>();
					
					list3.add(String.valueOf(list.get(0).getCnt()));
					list3.add(String.valueOf(list.get(1).getCnt()));
			
					
					
					System.out.println("list3" + list3);
					
					model.addAttribute("sexList", list3);
					System.out.println(list);
					
					return "chart2.jsp";
				}
				
				// 아이디 찾기
				@RequestMapping("/getId.do")
				public String getId(MemberVO vo, Model model,HttpSession session ) {
					
					MemberVO uid = memberService.getId(vo);
						
						if ( (uid != null) ) {
							System.out.println("아이디 찾기");
							model.addAttribute("uid", uid); // Model 객체 사용 View에 데이터 전달
							System.out.println("uid : " + uid);
							return "resultsearchId.jsp";
							
						} else {
							System.out.println("회원정보가 없습니다.");
							System.out.println("uid : " + uid);
							
							return "alert.jsp";
						}
				}
	
	
// 명식==================================================================================	
	
	
	@RequestMapping("/searchId.do")
	public String searchId(MemberVO vo, Model model) {
		MemberVO board = memberService.getMember(vo);
		model.addAttribute("board", board);
		
		return "searchId.jsp";
		
	}
	
	//(준) 수정
	@RequestMapping("/searchPwd.do")
	public String searchPwd(MemberVO vo, Model model) {
		MemberVO board = memberService.getMember(vo);
		model.addAttribute("board", board);
		
		return "searchPwdResult.jsp";
		
	}
	
	
	@RequestMapping("/logout.do")
	public String handleRequest(HttpSession session) {
		System.out.println(">>> 로그아웃 처리");
		session.invalidate();
		return "login.jsp";
	}
	
	@PostMapping("/update.do")
	public String update(MemberVO vo) {		
		System.out.println(">> 회원정보 수정 처리");
		System.out.println("vo : " + vo);
		
		MultipartFile uploadFile = vo.getImgFile();
		System.out.println("> uploadFile : " + uploadFile);
		
		if (uploadFile == null) {
			System.out.println("::: uploadFile 파라미터가 전달되지 않았을 때");
		} else if (uploadFile.isEmpty()) {
			System.out.println("::: 전달받은 파일 데이터가 없을 경우");
		} else { //파일 데이터가 있을 때
			System.out.println("uploadFile.isEmpty() : " + uploadFile.isEmpty());
			String fileName = uploadFile.getOriginalFilename(); //원본 파일명
			System.out.println("::: 원본파일명 : " + fileName);
			vo.setImgName(fileName);
		}
		memberService.updateMember(vo);
		
		return "getMemberUpdate.do";		
	}
	
	@RequestMapping("/delete.do")
	public String deleteMember(MemberVO vo, SessionStatus sessionStatus) {
		System.out.println(">>> 게시글 삭제처리");
		System.out.println("vo : " + vo);
		
		memberService.deleteMemeber(vo);
		sessionStatus.setComplete(); //session 데이터 삭제
		
		return "amanna.jsp"; //메인 페이지
		
	}
	
	//회원가입2
	@PostMapping("/register2.do")
	public String register2(MemberVO vo){
		System.out.println("vo : " + vo);
		
		MultipartFile uploadFile = vo.getImgFile();
		System.out.println("> uploadFile : " + uploadFile);
		
		if (uploadFile == null) {
			System.out.println("::: uploadFile 파라미터가 전달되지 않았을 때");
		} else if (uploadFile.isEmpty()) {
			System.out.println("::: 전달받은 파일 데이터가 없을 경우");
		} else { //파일 데이터가 있을 때
			System.out.println("uploadFile.isEmpty() : " + uploadFile.isEmpty());
			String fileName = uploadFile.getOriginalFilename(); //원본 파일명
			System.out.println("::: 원본파일명 : " + fileName);
			vo.setImgName(fileName);
		}
		memberService.register2(vo);
		
		return "login.jsp";
	}
	
	
	
	
// 정권==================================================================================	
	
	
	
	@RequestMapping("/getMemberList.do")
	public String getMemberListP(Model model,  MemberVO vo) {
		System.out.println(">>> 매칭목록 보여주기");
 		System.out.println("vo : " +vo);
 		

		
		MemberVO member = memberService.getMember(vo);
		System.out.println("member : " + member);
		model.addAttribute("member", member);
		try {
		String msex = member.getSex();
		System.out.println("msex : " + msex);
		
		if (msex.equals("여성")) {
			
			  MemberVO total = memberService.selectMMemberTotal(vo);
			  System.out.println("total :" + total);
			  
			  double totalPage = Math.ceil((double) total.getTotal() / 10);
			  System.out.println("totalPage: " + totalPage);
			  
			  int viewPage = vo.getViewPage(); 
			  int startIndex = (viewPage - 1) * 10 + 1;
			  int endIndex = startIndex + (10 - 1);
			  
			  vo.setStartIndex(startIndex); 
			  vo.setEndIndex(endIndex);
			  
			  model.addAttribute("total", total); 
			  model.addAttribute("totalPage",totalPage);
			 

			List<MemberVO> list = memberService.getMMemberList(vo);
			model.addAttribute("memberlist", list);
			System.out.println("list : " + list);
		} else if (msex.equals("남성")) {
			
			 MemberVO total = memberService.selectWMemberTotal(vo);
			  System.out.println("total :" + total);
			  
			  double totalPage = Math.ceil((double) total.getTotal() / 10);
			  System.out.println("totalPage: " + totalPage);
			  
			  int viewPage = vo.getViewPage(); 
			  int startIndex = (viewPage - 1) * 10 + 1;
			  int endIndex = startIndex + (10 - 1);
			  
			  vo.setStartIndex(startIndex); 
			  vo.setEndIndex(endIndex);
			  
			  model.addAttribute("total", total); 
			  model.addAttribute("totalPage",totalPage);
			 

			List<MemberVO> list = memberService.getWMemberList(vo);
			model.addAttribute("memberlist", list);
			System.out.println("list : " + list);
		}
		 
 		return "getMemberList.jsp";
 		
	} catch (NullPointerException e) {
		return "return.jsp";
		
	}
	    }
	

	
	
	@PostMapping("/payment.do")
	public String selectMember(MemberVO vo , Model model) {
		
		System.out.println("vo : " + vo);
		model.addAttribute("vo", vo);
		
		MemberVO member = memberService.getMember(vo);
		
		model.addAttribute("member", member);
		
		System.out.println("수정후 vo : " + member);
		
		return "paymentPage.jsp";
	}
	
	
	@PostMapping("/order.do")
	public String order(MemberVO vo, Model model) {
		System.out.println("vo2 : " + vo);
		System.out.println("order.do 실행");
		MemberVO member = memberService.getMember(vo);
		model.addAttribute("member", member);
		
		System.out.println("설정후 vo2 : " + member);
		
		return "order.jsp";
		
	}
	
	@GetMapping("/order.do")
	public String processGetRequest(MemberVO vo,Model model) {
		System.out.println("order get실행");

	    return "order.jsp"; 
	}
	
	
	
	@GetMapping("/guide.do")
	public String guide(){

	    return "guide.jsp"; 
	}
	  
	@PostMapping("/getMoney.do")
	public String getMoney(MemberVO vo, Model model) {
		MemberVO member = memberService.getMember(vo);
		model.addAttribute("member", member);
		
		return "paymentSuccess.jsp";
	}
	
	  
	

}
