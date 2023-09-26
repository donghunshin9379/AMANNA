package com.spring.biz.view.member;


import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;

@RestController
public class JoinAjaxController {
	@Autowired
	private MemberService memberService;
	
	//회원가입1 -> membercontroller에 회원가입2로 이어짐
	@PostMapping("/register.do")
	public String register(@RequestBody MemberVO vo) {
		System.out.println("/user/ : post" + vo);
		
		memberService.register(vo);
		return "joinSuccess";
	}
	
	@PostMapping("/chkEmail.do")
	public String chkEmail(@RequestBody String email) {	// 받을 데이터타입이 텍스트라 스트링으로함 반드시 리퀘스트바디를 붙힐것! ajax 통신시
		System.out.println("param : " + email );
		
		int checkNum = memberService.eamilchk(email);
		System.out.println("checkNum : " + checkNum);
		
		if(checkNum == 1) {
			System.out.println("이메일이 중복되었다.");
			return "duplicated";
		}else {
			System.out.println("이메일 사용 가능");
			return "available";
		}
	}
	
	

	//회원가입 아이디중복체크
	@PostMapping("/checkId.do")
	public String checkId(@RequestBody String id) {	// 받을 데이터타입이 텍스트라 스트링으로함 반드시 리퀘스트바디를 붙힐것! ajax 통신시
		System.out.println("param : " + id );
		
		int checkNum = memberService.idchk(id);
		System.out.println("checkNum : " + checkNum);
		
		if(checkNum == 1) {
			System.out.println("아이디가 중복되었다.");
			String ok = "duplicated";
			return ok;
		}else {
			System.out.println("아이디 사용 가능");
			String no = "available";
			return no;
		}
	}
	
	//로그인
	@PostMapping("/login.do")
	public Object login(@RequestBody MemberVO vo, HttpSession session) throws IOException {
		System.out.println(">>> 로그인 처리");
		System.out.println("vo : " + vo);

		MemberVO member = memberService.login(vo);
		System.out.println("member : " + member);
		

		
		if ((member.getId().equals("admin"))) {
			return "admin";
		}else if((member != null)) {
			System.out.println(">> 로그인 성공!!!");
			
			//세션에 로그인정보올리기
			session.setAttribute("member", member);
			
			return member;
		}else {
			System.out.println(">> 로그인 실패!!!");
			return 0;
		}
 }
}