package com.spring.biz.rboard;
 
import java.util.List;
 
public interface RBoardService {
	void insertRBoard(RBoardVO vo);
	void updateRBoard(RBoardVO vo);
	void deleteRBoard(RBoardVO vo);
	void updateCountRBoard(RBoardVO vo);
	RBoardVO getRBoard(RBoardVO vo);
	List<RBoardVO> getMyRBoardList(RBoardVO vo);
	List<RBoardVO> getRBoardList(RBoardVO vo);
	RBoardVO selectNRBoardTotal(RBoardVO vo);
	
	
}
