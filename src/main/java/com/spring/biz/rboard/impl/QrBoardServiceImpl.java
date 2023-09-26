package com.spring.biz.rboard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.rboard.QrBoardService;
import com.spring.biz.rboard.QrBoardVO;

@Service("QrBoardService")
public class QrBoardServiceImpl implements QrBoardService{
	@Autowired
	private QrBoardDAO qrBoardDAO;
	
	@Override
	public List<QrBoardVO> getQrBoardList(QrBoardVO qvo) {
		return qrBoardDAO.getQrBoardList(qvo);
	}

	@Override
	public void insertQrBoard(QrBoardVO qvo) {
		qrBoardDAO.insertQrBoard(qvo);
	}

	@Override
	public void deleteQrBoard(QrBoardVO qvo) {
		qrBoardDAO.deleteQrBoard(qvo);
		
	}

	@Override
	public void updateQrBoard(QrBoardVO qvo) {
		qrBoardDAO.updateQrBoard(qvo);
	}
}
