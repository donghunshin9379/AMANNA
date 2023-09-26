package com.spring.biz.faqboard;

import java.util.List;

public interface FaqBoardService {
	void insertFaqBoard(FaqBoardVO fvo);
	void updateFaqBoard(FaqBoardVO fvo);
	void deleteFaqBoard(FaqBoardVO fvo);
	FaqBoardVO getFaqBoard(FaqBoardVO fvo);
	List<FaqBoardVO> getFaqBoardList(FaqBoardVO fvo);
	FaqBoardVO selectFaqBoardTotal(FaqBoardVO fvo);
	List<FaqBoardVO> selectCategory(FaqBoardVO fvo);
}
