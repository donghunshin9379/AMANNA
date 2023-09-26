package com.spring.biz.view.notiboard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.biz.notiboard.NotiBoardService;
import com.spring.biz.notiboard.NotiBoardVO;
import com.spring.biz.rboard.QrBoardService;
import com.spring.biz.rboard.RBoardService;
import com.spring.biz.rboard.RBoardVO;

@SessionAttributes("noti")
@Controller
public class NotiBoardController {
	
	@Autowired
	private NotiBoardService notiBoardService;
	
	public NotiBoardController() {
		System.out.println("NotiBoardController() 실행~~");
	}
	
	
	 @RequestMapping("/getNotiBoardList.do")
	    public String getNotiBoardList(NotiBoardVO nvo, Model model) {
		  System.out.println("전체 공지사항 보여주기");
		    
		    NotiBoardVO total = notiBoardService.selectNotiBoardTotal(nvo);
		    double totalPage = Math.ceil((double) total.getTotal() / 10);

		    int viewPage = nvo.getViewPage(); 
		    int startIndex = (viewPage - 1) * 10 + 1;
		    int endIndex = startIndex + (10 - 1);

		    nvo.setStartIndex(startIndex); 
		    nvo.setEndIndex(endIndex);

		    List<NotiBoardVO> nlist = notiBoardService.getNotiBoardList(nvo);
		    
		    model.addAttribute("nlist", nlist);
		    model.addAttribute("total", total);
		    model.addAttribute("totalPage", totalPage);
		    
		    return "getNotiBoardList.jsp";
		}
	 
	 @RequestMapping("/customerNotice.do")
	 public String getNoticeBoardList(NotiBoardVO nvo, Model model) {
		 System.out.println("고객 공지사항 보여주기");
		 
		List<NotiBoardVO> nlist = notiBoardService.getNotiBoardList(nvo);
        model.addAttribute("nlist", nlist);
        
        NotiBoardVO total = notiBoardService.selectNotiBoardTotal(nvo);
        System.out.println("total" + total);
        double totalPage = Math.ceil((double) total.getTotal() / 10);
		System.out.println("totalPage: " + totalPage);
 		
 		int viewPage = nvo.getViewPage(); 
 		int startIndex = (viewPage-1) * 10 + 1;
 		int endIndex = startIndex + (10 - 1);
 		
 		nvo.setStartIndex(startIndex); 
 		nvo.setEndIndex(endIndex);
 		
 		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		 
		 return "customerNotice.jsp";
	 }
	 
	 
	 @RequestMapping("/getNotiBoard.do")
	 public String getNotiBoard(NotiBoardVO nvo, Model model) {
		 System.out.println("공지 Detail 보여주기");
		 NotiBoardVO ndetail = notiBoardService.getNotiBoard(nvo);
		 model.addAttribute("ndetail", ndetail);
		 return "getNotiBoard.jsp";
	 }
	
	 
	 @RequestMapping("/insertNotiBoard.do")
	 public String insertNotiBoard(NotiBoardVO nvo) {
		 System.out.println("공지사항 입력 가즈아");
		 notiBoardService.insertNotiBoard(nvo);
		 return "getNotiBoardList.do";
	 }
	 @RequestMapping("/deleteNotiBoard.do")
	 public String deleteNotiBoard(NotiBoardVO nvo, SessionStatus sessionStatus) {
		 System.out.println("controller 삭제처리");
		 notiBoardService.deleteNotiBoard(nvo);
		 sessionStatus.setComplete();
		 return "getNotiBoardList.do";
	 }
	 
	 @RequestMapping("/updateNotiBoard.do")
	 public String updateNotiBoard(NotiBoardVO nvo) {
		 System.out.println("controller 수정");
		 notiBoardService.updateNotiBoard(nvo);
		 return "getNotiBoardList.do";
	 }
}
