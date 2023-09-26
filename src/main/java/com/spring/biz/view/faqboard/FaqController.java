package com.spring.biz.view.faqboard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.biz.faqboard.FaqBoardService;
import com.spring.biz.faqboard.FaqBoardVO;
import com.spring.biz.rboard.RBoardVO;

@SessionAttributes({"total", "totalPage", "FaqboardList"})
@Controller
public class FaqController {
	@Autowired
	private FaqBoardService faqboardService;
	
	
	public FaqController() {
		System.out.println("FaqController() 객체생성");
	}
	
	@RequestMapping("/getFaqBoardList.do")
	public String getFaqBoardList(FaqBoardVO fvo, Model model, HttpSession session){
		System.out.println(">>> Faq list 보여주기");
		
		FaqBoardVO total = faqboardService.selectFaqBoardTotal(fvo);
 		System.out.println("total :" + total);
 		
 		double totalPage = Math.ceil((double) total.getTotal() / 10);
		System.out.println("totalPage: " + totalPage);
 		
 		int viewPage = fvo.getViewPage(); 
 		int startIndex = (viewPage-1) * 10 + 1;
 		int endIndex = startIndex + (10 - 1);
 		
 		fvo.setStartIndex(startIndex); 
 		fvo.setEndIndex(endIndex);
 		
 		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
 		
 		List<FaqBoardVO> list = faqboardService.getFaqBoardList(fvo);
 		//session.setAttribute("FaqboardList", list);
 		model.addAttribute("FaqboardList", list);
		System.out.println("list :" + list);
		return "getFaqBoardList.jsp";
	}
	

	@RequestMapping("/customerCategory.do")
	public String selectCategory(FaqBoardVO fvo, Model model) {
		System.out.println("category별로 list보여주기");
		List<FaqBoardVO> cateList = faqboardService.selectCategory(fvo);
		model.addAttribute("cateList", cateList);
		return "CustomerCategory.jsp";
	}
	
	@RequestMapping("/CustomerService.do")
	public String otherPage(FaqBoardVO fvo, Model model,HttpSession session) {
System.out.println("========== Faq list 보여주기");
		
		FaqBoardVO total = faqboardService.selectFaqBoardTotal(fvo);
 		System.out.println("total :" + total);
 		
 		double totalPage = Math.ceil((double) total.getTotal() / 10);
		System.out.println("totalPage: " + totalPage);
 		
 		int viewPage = fvo.getViewPage(); 
 		int startIndex = (viewPage-1) * 10 + 1;
 		int endIndex = startIndex + (10 - 1);
 		
 		fvo.setStartIndex(startIndex); 
 		fvo.setEndIndex(endIndex);
 		
 		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
 		
 		List<FaqBoardVO> list = faqboardService.getFaqBoardList(fvo);
 		//session.setAttribute("FaqboardList", list);
 		model.addAttribute("FaqboardList", list);
		System.out.println("list :" + list);
	    return "CustomerService.jsp";
	}
	


	
	@RequestMapping("/getfaqBoard.do")
	public String getFaqBoard(FaqBoardVO fvo, Model model) {
		System.out.println(">> faq 보여주기");
		
		FaqBoardVO faqboard = faqboardService.getFaqBoard(fvo);
		model.addAttribute("faqboard", faqboard);
		
		return "getFaqBoard.jsp";
	}
	
	@RequestMapping("/deleteFaqBoard.do")
	public String deleteFaqBoard(FaqBoardVO fvo, SessionStatus sessionStatus) {
		System.out.println("삭제하기");
		faqboardService.deleteFaqBoard(fvo);
		sessionStatus.setComplete();
		return "getFaqBoardList.do";
	}
	
	@RequestMapping("/updateFaqBoard.do")
	public String updateFaqBoard(FaqBoardVO fvo) {
		System.out.println("수정하기");
		faqboardService.updateFaqBoard(fvo);
		return "getfaqBoard.do";
	}
	
	@RequestMapping("/insertFaqBoard.do")
	public String indsertFaqBoard(FaqBoardVO fvo) {
		System.out.println("입력하기");
		faqboardService.insertFaqBoard(fvo);
		return "getFaqBoardList.do";
	}
}
