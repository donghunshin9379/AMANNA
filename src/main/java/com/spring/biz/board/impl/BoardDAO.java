package com.spring.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.board.BoardVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public BoardDAO() {
		System.out.println(">> BoardDAOMybatis() 객체 생성");
	}
	
	
	//글입력
	public void insertBoard(BoardVO vo) {
	  System.out.println("===> MyBatis 사용 insertBoard() 실행");
	  mybatis.insert("boardDAO.insertBoard", vo); 
	  }
	  
	  //글수정
	public void updateBoard(BoardVO vo) {
	  System.out.println("===> MyBatis 사용 updateBoard() 실행");
	 mybatis.update("boardDAO.updateBoard", vo); 
	 }
	
	//댓글 후 답변 유무 변경
	public void updateAnswer(BoardVO vo) {
		System.out.println("===> MyBatis 사용 updateAnswer() 실행");
		 mybatis.update("boardDAO.updateAnswer", vo);
	}
	 
	  //글삭제
	public void deleteBoard(BoardVO vo) {
	 System.out.println("===> MyBatis 사용 deleteBoard() 실행");
	  mybatis.delete("boardDAO.deleteBoard", vo); 
	  }
	  
	  //글 1개 조회
	public BoardVO getBoard(BoardVO vo) {
	  System.out.println("===> MyBatis 사용 getBoard() 실행"); 
	  return mybatis.selectOne("boardDAO.getBoard", vo); 
	  }
	
	public List<BoardVO> getBoardList(BoardVO vo) {
	    System.out.println("===> MyBatis 사용 getBoardList(vo)22222 실행");
	    
	    // 검색조건 값이 없을 때 기본값 설정
	    if (vo.getSearchCondition() == null) {
	        vo.setSearchCondition("TITLE");
	    }
	    if (vo.getSearchKeyword() == null) {
	        vo.setSearchKeyword("");
	    }
	    
	    List<BoardVO> list;
	    
	    if ("qTitle".equals(vo.getSearchCondition())) {
	        list = mybatis.selectList("boardDAO.getBoardList_T", vo);
	    } else {
	        list = mybatis.selectList("boardDAO.getBoardList_W", vo);
	    }
	    
	    return list;
	}

	
	public BoardVO selectNBoardTotal(BoardVO vo) {
		return mybatis.selectOne("boardDAO.selectNBoardTotal", vo); 
	}
	
	 //비밀번호 확인
	public BoardVO passwordCheck(BoardVO vo) {
		System.out.println("===> MyBatis 사용 passwordCheck() 실행");
		return mybatis.selectOne("boardDAO.passwordCheck", vo);
	}


	

	
}

