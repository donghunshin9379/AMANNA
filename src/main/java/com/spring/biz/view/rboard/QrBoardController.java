package com.spring.biz.view.rboard;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;
import com.spring.biz.rboard.QrBoardService;
import com.spring.biz.rboard.QrBoardVO;
import com.spring.biz.rboard.RBoardVO;

@Controller
public class QrBoardController {
	@Autowired
	private QrBoardService QrBoardService;
	private MemberService memberService;
	
	
	@RequestMapping("/showMain.do")
	public String getQrBoardList(QrBoardVO qvo, Model model) {
		List<QrBoardVO> qlist = QrBoardService.getQrBoardList(qvo);
		System.out.println("qvo : "  + qvo);
		model.addAttribute("qlist", qlist);
		return "CustomerService.jsp";
	}
	
	@RequestMapping("/insertQrBoard.do")
	public String insertQrBoard(QrBoardVO qvo ) {
		System.out.println("댓글 입력 가즈아");
		QrBoardService.insertQrBoard(qvo);
		return "getRBoard.do";
	}
	
	@RequestMapping("/deleteQrBoard.do")
	public String deleteQrBoard(QrBoardVO qvo) {
		System.out.println("댓글 삭제 가즈아");
		QrBoardService.deleteQrBoard(qvo);
		return "getRBoard.do";
	}
	
	@RequestMapping("/updateQrBoard.do")
	public String updateQrBoard(QrBoardVO qvo) {
		System.out.println("댓글 수정하기");
		QrBoardService.updateQrBoard(qvo);
		return "getRBoard.do";
	}
	
	//관리자 댓글 삭제
	@RequestMapping("/deleteAdminQrBoard.do")
	public String deleteAdminQrBoard(QrBoardVO qvo) {
		System.out.println("관리자 모드 댓글 삭제 가즈아");
		QrBoardService.deleteQrBoard(qvo);
		return "getAdminRBoard.do";
	}
}
