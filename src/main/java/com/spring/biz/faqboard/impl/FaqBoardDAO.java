package com.spring.biz.faqboard.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.faqboard.FaqBoardVO;
import com.spring.biz.rboard.RBoardVO;

@Repository
public class FaqBoardDAO {
	@Autowired
 	private SqlSessionTemplate mybatis;
	
	public static void main(String[] args) {
 		System.out.println(">>BoardDAOMybatis() 객체 생성 ");
 	}
	
	 //전체 글 조회(모든 리뷰글)
 	public List<FaqBoardVO> getFaqBoardList(FaqBoardVO fvo){
 		System.out.println("getFaqBoardList() 실행");
 		List<FaqBoardVO> list = mybatis.selectList("faqboardDAO.getFaqBoardList", fvo);
 		return list;
 	}
 	//게시글 수 전체 수량 조회
 	public FaqBoardVO selectFaqBoardTotal(FaqBoardVO fvo) {
 		return mybatis.selectOne("faqboardDAO.selectFaqBoardTotal", fvo);
 	}
 	
 	//카테고리별로 찾기
 	public List<FaqBoardVO> selectCategory(FaqBoardVO fvo) {
 		System.out.println("selectCategory() 실행");
 		List<FaqBoardVO> cateList = mybatis.selectList("faqboardDAO.selectCategory", fvo);
 		return cateList;
 	}
 	
 	//게시글 열기
 	public FaqBoardVO getFaqBoard(FaqBoardVO fvo) {
 		System.out.println("getFaqBoard() 실행");
 		return mybatis.selectOne("faqboardDAO.getFaqBoard", fvo);
 	}
 	
 	public void insertFaqBoard(FaqBoardVO fvo) {
 		System.out.println("insertFaqBoard() 실행");
 		mybatis.insert("faqboardDAO.insertFaqBoard", fvo);
 	}
 	
 	public void deleteFaqBoard(FaqBoardVO fvo) {
 		System.out.println("deleteFaqBoard() 실행");
 		mybatis.delete("faqboardDAO.deleteFaqBoard", fvo);
 	}

	public void updateFaqBoard(FaqBoardVO fvo) {
		System.out.println("updateFaqBoard() 실행");
		mybatis.update("faqboardDAO.updateFaqBoard", fvo);
	}
 	
 
 }
