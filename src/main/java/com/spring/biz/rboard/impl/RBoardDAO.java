 package com.spring.biz.rboard.impl;
 
 import java.util.List;
 
 import org.mybatis.spring.SqlSessionTemplate;
 import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.stereotype.Repository;
 
 import com.spring.biz.rboard.RBoardVO;
 
 @Repository
 public class RBoardDAO {
 	@Autowired
 	private SqlSessionTemplate mybatis;
 	
 	
 	public static void main(String[] args) {
 		System.out.println(">>BoardDAOMybatis() 객체 생성 ");
 	}
 	
 	 //전체 글 조회(모든 리뷰글)
 	public List<RBoardVO> getRBoardList(RBoardVO vo){
 		System.out.println("getRBoardList() 실행");
 		List<RBoardVO> list = mybatis.selectList("rboardDAO.getRBoardList", vo);
 		return list;
 	}
 	//게시글 수 전체 수량 조회
 	public RBoardVO selectNRBoardTotal(RBoardVO vo) {
 		return mybatis.selectOne("rboardDAO.selectNRBoardTotal", vo);
 	}
 	
 	//게시글 열기
 	public RBoardVO getRBoard(RBoardVO vo) {
 		System.out.println("getRBoard() 실행");
 		return mybatis.selectOne("rboardDAO.getRBoard", vo);
 	}
 	public List<RBoardVO> getMyRBoardList(RBoardVO vo) {
 		System.out.println("getRBoard() 실행");
 		return mybatis.selectList("rboardDAO.getMyRBoardList", vo);
 	}
 	
 	public void insertRBoard(RBoardVO vo) {
 		System.out.println("insertRBoard() 실행");
 		mybatis.insert("rboardDAO.insertRBoard", vo);
 	}
 	
 	public void deleteRBoard(RBoardVO vo) {
 		System.out.println("deleteRBoard() 실행");
 		mybatis.delete("rboardDAO.deleteRBoard", vo);
 	}

	public void updateRBoard(RBoardVO vo) {
		System.out.println("updateRBoard() 실행");
		mybatis.update("rboardDAO.updateRBoard", vo);
	}
	
	//조회수 올리는 
	public void updateCountRBoard(RBoardVO vo) {
		System.out.println("updateCountRBoard() 실행");
		mybatis.update("rboardDAO.updateCountRBoard", vo);
	}
 	
 
 }
