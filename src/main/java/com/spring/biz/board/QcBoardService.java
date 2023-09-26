package com.spring.biz.board;

import java.util.List;

public interface QcBoardService {
	void insertQcBoard(QcBoardVO qvo);
	void deleteQcBoard(QcBoardVO qvo);
	void updateQcBoard(QcBoardVO qvo);
	List<QcBoardVO> getQcBoardList(QcBoardVO qvo);
	QcBoardVO getQcBoardDetail(QcBoardVO qvo);

	
}
