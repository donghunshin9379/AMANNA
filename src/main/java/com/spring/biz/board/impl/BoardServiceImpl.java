package com.spring.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVO;

//@Service : @Component 상속확장 어노테이션
//           비즈니스 로직 처리 서비스 영역에 사용
@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired // 타입이 일치하는 객체(인스턴스) 주입
	private BoardDAO boardDAO;

	public BoardServiceImpl() {
		System.out.println(">> BoardServiceImpl() 객체 생성");
	}
	
	 @Override 
	  public void insertBoard(BoardVO vo) { 
		  boardDAO.insertBoard(vo); 
		  }
	  
	  @Override 
	  public void updateBoard(BoardVO vo) { 
		  boardDAO.updateBoard(vo); 
		  }
	  
	  
	  @Override 
	  public void deleteBoard(BoardVO vo) { 
		  boardDAO.deleteBoard(vo); 
		  }
	  
	  @Override 
	  public BoardVO getBoard(BoardVO vo) { 
		  return boardDAO.getBoard(vo);
	  }
	
	@Override 
	public List<BoardVO> getBoardList(BoardVO vo) {
	System.out.println("getBoardList IMP 작동"); 
	return boardDAO.getBoardList(vo);
	}
	
	
	/* 댓글 작성후 변환 */
	@Override
	public void updateAnswer(BoardVO vo) {
		boardDAO.updateAnswer(vo);
	}
	
	@Override
	public BoardVO selectNBoardTotal(BoardVO vo) {
		return boardDAO.selectNBoardTotal(vo);
	}
	
	@Override
	public BoardVO passwordCheck(BoardVO vo) {
		return boardDAO.passwordCheck(vo);
	}


}
