package com.spring.biz.board;

import java.util.List;


public interface BoardService {
	
	void insertBoard(BoardVO vo);
	void updateBoard(BoardVO vo);
	void updateAnswer(BoardVO vo);
	void deleteBoard(BoardVO vo);
	BoardVO getBoard(BoardVO vo);
	List<BoardVO> getBoardList(BoardVO vo);
	
	// Total 개수 얻기
	BoardVO selectNBoardTotal(BoardVO vo);
	
	
	//비밀번호 확인
	BoardVO passwordCheck(BoardVO vo);
}
