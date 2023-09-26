package com.spring.biz.view.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVO;
import com.spring.biz.board.QcBoardService;
import com.spring.biz.board.QcBoardVO;


@Controller
public class QcBoardController {
	
	@Inject
	private QcBoardService QcBoardService;
	@Autowired
	private BoardService BoardService;
	
	@RequestMapping("/insertQcBoard.do")
	public String insertQcBoard(QcBoardVO qvo, BoardVO vo) {
		System.out.println("댓글 입력하겠습니다~~~~~~`");
		QcBoardService.insertQcBoard(qvo);
		BoardService.updateAnswer(vo);
		System.out.println("answered changed!!!!!!!!!!!!!!");
		return "getBoardList.do";
	}
	
	
	 @RequestMapping("/getQcBoard.do")
	 public String getQcBoard(QcBoardVO qvo,Model model) { 
		 System.out.println("getQcBoard 작동~~~");
		 List<QcBoardVO> qlist = null; 
		 qlist = QcBoardService.getQcBoardList(qvo);
		 model.addAttribute("qlist", qlist); 
		 System.out.println("qlist"+ qlist);
		 return "upDelQcBoard.jsp"; 
		 }
	 
	
	@RequestMapping("/updateQcBoard.do")
	public String updateQcBoard(QcBoardVO qvo,Model model) {
		System.out.println("댓글 수정작업~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`");
		QcBoardService.updateQcBoard(qvo);
		return "getBoardList.do";
	}
	
	@RequestMapping("/deleteQcBoard.do")
	public String deleteQcBoard(QcBoardVO qvo, SessionStatus sessionStatus) {
		System.out.println("삭제 작업!!!!!!!!!!!!!!!!!!");
		QcBoardService.deleteQcBoard(qvo);
		sessionStatus.setComplete();
		return "getBoardList.do";
	}
	
	@RequestMapping("/upDelQcBoard.do")
	public String getQcBoardDetail(QcBoardVO qvo, Model model) {
	System.out.println("getBoard test");
	QcBoardVO qcBoard = QcBoardService.getQcBoardDetail(qvo);
	model.addAttribute("qcboard", qcBoard);
	return "upDelQcBoard.jsp";
	}
}
