package com.spring.biz.rboard.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.rboard.QrBoardVO;

@Repository
public class QrBoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public QrBoardDAO() {
		System.out.println("QrBoardDAO() 실행");
	}
	
	public List<QrBoardVO> getQrBoardList(QrBoardVO qvo) {
		System.out.println("mybatis getQrBoardList");
		List<QrBoardVO> qlist = mybatis.selectList("QrBoardDAO.getQrBoardList", qvo);
		return qlist;
	}
	
	public void insertQrBoard(QrBoardVO qvo) {
		System.out.println("mybatis.insertQrBoard");
		mybatis.insert("QrBoardDAO.insertQrBoard", qvo);
	}
	
	public void deleteQrBoard(QrBoardVO qvo) {
		System.out.println("mybatis.deleteQrBoard");
		mybatis.delete("QrBoardDAO.deleteQrBoard", qvo);
	}
	public void updateQrBoard(QrBoardVO qvo) {
		System.out.println("mybatis.updateQrBoard");
		mybatis.update("QrBoardDAO.updateQrBoard", qvo);
	}
}
