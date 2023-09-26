package com.spring.biz.view.board;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVO;
import com.spring.biz.board.QcBoardService;
import com.spring.biz.board.QcBoardVO;


/*
@SessionAttributes : 같은 컨트롤러에서 모델(Model)객체 공유해서 사용하려는 경우 사용
   단, 현재(동일) 컨트롤러에서만 사용가능
   사용후에는 SessionStatus 객체의 setComplete() 메소드로 사용해제
*/
@SessionAttributes("board") // board 라는 이름의 Model 객체가 있으면 session 에 저장
@Controller
public class BoardController {
   // @Autowired
   private BoardService boardService;
   @Inject
   private QcBoardService QcBoardService;

   public BoardController() {
      System.out.println("==========> BoardController() 객체 생성");
   }

   @Autowired
   public BoardController(BoardService boardService) {
      System.out.println("==========> BoardController(boardService) 객체 생성");
      this.boardService = boardService;
   }
   
   @RequestMapping("/insertBoard.do")
   public String insertBoard(BoardVO vo) {
      System.out.println("입력처리 test");
      boardService.insertBoard(vo);
      return "customerQnaList.do";
   }
   
   @RequestMapping("/deleteBoard.do")
   public String deleteBoard(BoardVO vo, SessionStatus sessionStatus) {
      System.out.println("삭제처리 test");
      System.out.println("delete vo : " +vo);
      boardService.deleteBoard(vo);
      sessionStatus.setComplete();
      
      return "getBoardList.do";
   }
   
   @RequestMapping("/updateBoard.do")
   public String updateBoared(BoardVO vo) {
      System.out.println("업데이트 작업");
      boardService.updateBoard(vo);
      System.out.println("test: " + vo);
      return "getBoardList.do";
   }
   
   @RequestMapping("/getBoard.do")
   public String getBoard(BoardVO vo, QcBoardVO qvo, Model model) {
      System.out.println("getBoard test");
       BoardVO board = boardService.getBoard(vo); 
       model.addAttribute("board",board);
       
       List<QcBoardVO> qlist = null;
       qlist = QcBoardService.getQcBoardList(qvo);
       model.addAttribute("qlist", qlist);
       System.out.println("qlist"+ qlist);
      return "getBoard.jsp";
   }
   
   
   
   @RequestMapping("/getBoardList.do")
   public String getBoardList(BoardVO vo, Model model) {
       System.out.println(">>> 게시글 전체 목록 보여주기");
       System.out.println("vo: " + vo);
       

       BoardVO total = boardService.selectNBoardTotal(vo);
       System.out.println("total: " + total);
       
       double totalPage = Math.ceil((double) total.getTotal() / 10);
		System.out.println("totalPage: " + totalPage);
		
		int viewPage = vo.getViewPage(); 
		int startIndex = (viewPage-1) * 10 + 1;
		int endIndex = startIndex + (10 - 1);
		
		vo.setStartIndex(startIndex); 
		vo.setEndIndex(endIndex);
		
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
       
       
       List<BoardVO> list = boardService.getBoardList(vo);
       model.addAttribute("boardList", list);
       System.out.println("list: " + list);

       return "getBoardList.jsp";
   }
   
   //맨처음 나오게
   @RequestMapping("/customerQnaList.do")
   public String customerBoader(BoardVO vo, Model model) {
	   BoardVO total = boardService.selectNBoardTotal(vo);
	   double totalPage = Math.ceil((double) total.getTotal() / 10);
		System.out.println("totalPage: " + totalPage);
		
		int viewPage = vo.getViewPage(); 
		int startIndex = (viewPage-1) * 10 + 1;
		int endIndex = startIndex + (10 - 1);
		
		vo.setStartIndex(startIndex); 
		vo.setEndIndex(endIndex);
	   
	   
      List<BoardVO> list = boardService.getBoardList(vo);
      
      model.addAttribute("boardList", list);
      System.out.println("작동확인~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ");
      return "customerBoard.jsp";
   }
   
   //고객 QNA
   @RequestMapping("/customerGetBoard.do")
   public String customerGetBoard(BoardVO vo, HttpServletRequest request) {
       System.out.println("customerGetBoard Controller 작동");

       if (vo.getLockFlag().equals("N")) {
           return "customerPasswordCheck.jsp";
       } else {
               return "customerGetBoard2.do"; // 비밀번호가 일치하지 않는 경우
           }
       }

   

   
   //비밀번호가 일치하고 나서 
   @RequestMapping("/customerPassPassword.do")
   public String customerPassPassword(BoardVO vo) {
       System.out.println("customerPassPassword Controller 작동");

       BoardVO result = boardService.passwordCheck(vo); // 비밀번호 확인 DAO 호출

       if (result != null) {
    	   System.out.println("일치합니다");
           return "customerGetBoard2.do"; // 비밀번호가 일치하는 경우
       } else {
    	   System.out.println("다시 입력바랍니다");
           return "customerPasswordCheck.jsp"; // 비밀번호가 일치하지 않는 경우
       }
   }
   
   //해당하는 글보여주기(고객)
   @RequestMapping("/customerGetBoard2.do")
   public String customerGetBoard(BoardVO vo, QcBoardVO qvo, Model model) {
	   System.out.println("고객 작성들 보여주기");
	   BoardVO board = boardService.getBoard(vo); 
       model.addAttribute("board",board);
       
       List<QcBoardVO> qlist = null;
       qlist = QcBoardService.getQcBoardList(qvo);
       model.addAttribute("qlist", qlist);
       System.out.println("qlist"+ qlist);
	   return "customerGetBoard.jsp";
   }
   
   //qna업데이트 (고객)
   @RequestMapping("/customerUpdate.do")
   public String customerUpdate(BoardVO vo) {
	   System.out.println("고객 작성글 업데이트 하기");
	   boardService.updateBoard(vo);
	   System.out.println("test: " + vo);
	   return "customerGetBoard2.do";
   }
   @RequestMapping("/customerDeleteBoard.do")
   public String customerDeleteBoard(BoardVO vo, QcBoardVO qvo, SessionStatus sessionStatus) {
	   System.out.println("삭제 완룐");
	   boardService.deleteBoard(vo);
	   sessionStatus.setComplete();
	   return "customerQnaList.do";
   }
}