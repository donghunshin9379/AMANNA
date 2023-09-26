package com.spring.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.board.QcBoardService;
import com.spring.biz.board.QcBoardVO;

@Service("QcBoardService")
public class QcBoardServiceImpl implements QcBoardService {
	@Autowired
	private QcBoardDAO qcBoardDAO;

	public QcBoardServiceImpl() {
		System.out.println(">> BoardServiceImpl() 객체 생성");
	}
	
	@Override
	public void insertQcBoard(QcBoardVO qvo) {
		qcBoardDAO.insertQcBoard(qvo);
	}

	@Override
	public void deleteQcBoard(QcBoardVO qvo) {
		qcBoardDAO.deleteQcBoard(qvo);
	}

	@Override
	public void updateQcBoard(QcBoardVO qvo) {
		qcBoardDAO.updateQcBoard(qvo);
	}
	
	

	
	 @Override 
	 public List<QcBoardVO> getQcBoardList(QcBoardVO qvo) { 
		 return qcBoardDAO.getQcBoardList(qvo); 
	 }

	@Override
	public QcBoardVO getQcBoardDetail(QcBoardVO qvo) {
		return qcBoardDAO.getQcBoardDetail(qvo);
	}

	
	 
}
