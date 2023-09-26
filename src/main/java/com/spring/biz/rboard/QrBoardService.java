package com.spring.biz.rboard;

import java.util.List;

public interface QrBoardService {
	List<QrBoardVO> getQrBoardList(QrBoardVO qvo);
	
	void insertQrBoard(QrBoardVO qvo);
	void deleteQrBoard(QrBoardVO qvo);
	void updateQrBoard(QrBoardVO qvo);
}
