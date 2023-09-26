package com.spring.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.board.QcBoardVO;

@Repository
public class QcBoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public QcBoardDAO() {
		System.out.println(">> BoardDAOMybatis() 객체 생성");
	}
	
	public void insertQcBoard(QcBoardVO qvo) {
		System.out.println("===> MyBatis 사용 insertBoard(qvooo) 실행");
		mybatis.insert("QcBoardDAO.insertQcBoard", qvo);
	}
	
	public void deleteQcBoard(QcBoardVO qvo) {
		System.out.println("===> MyBatis 사용 deleteQcBoardVO() 실행");
		System.out.println("삭제 기능 자동!!!!!!!!!!!!!!!!!!!!!");
		mybatis.delete("QcBoardDAO.deleteQcBoard", qvo);
		System.out.println("삭제 COMPLETED");
	}
	public void updateQcBoard(QcBoardVO qvo) {
		System.out.println("===> MyBatis 사용 updateQcBoardVO() 실행");
		System.out.println("update function is working");
		mybatis.update("QcBoardDAO.updateQcBoard", qvo);
		System.out.println("qvo : " + qvo);
	}
	
	 public List<QcBoardVO> getQcBoardList(QcBoardVO qvo) {
		 System.out.println("===> MyBatis 사용 getQcBoardList() 실행"); List<QcBoardVO>
		 qlist = mybatis.selectList("QcBoardDAO.getQcBoardList", qvo); 
		 return qlist; 
	 }
	 
	 public QcBoardVO getQcBoardDetail(QcBoardVO qvo) {
	  System.out.println("===> MyBatis 사용 getQcBoardDetail() 실행"); 
	  return mybatis.selectOne("QcBoardDAO.getQcBoardDetail", qvo); 
	  }
	 
	


}
