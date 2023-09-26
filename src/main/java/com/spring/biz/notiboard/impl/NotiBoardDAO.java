package com.spring.biz.notiboard.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.notiboard.NotiBoardVO;

@Repository
public class NotiBoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public NotiBoardDAO() {
		System.out.println("NotiBoardDAO 객체 생성~~~");
	}
	
	//글입력
	public void insertNotiBoard(NotiBoardVO nvo) {
		System.out.println(" mybatis 사용 insertNotiBoard 실행");
		mybatis.insert("NotiBoardDAO.insertNotiBoard", nvo);
	}
	
	//글 업데이트
		public void updateNotiBoard(NotiBoardVO nvo) {
			System.out.println(" mybatis 사용 updateNotiBoard 실행");
			mybatis.insert("NotiBoardDAO.updateNotiBoard", nvo);
		}
		
		//글 삭제
		public void deleteNotiBoard(NotiBoardVO nvo) {
			System.out.println(" mybatis 사용 deleteNotiBoard 실행");
			mybatis.insert("NotiBoardDAO.deleteNotiBoard", nvo);
		}
		
		// 글 전체list 보여주기
		public List<NotiBoardVO> getNotiBoardList(NotiBoardVO nvo){
			System.out.println("getNotiBoardList 실행");
			List<NotiBoardVO> flist = mybatis.selectList("NotiBoardDAO.getNotiBoardList", nvo);
			return flist;
		}
		
		// 글보여주기
		public NotiBoardVO getNotiBoard(NotiBoardVO nvo) {
			System.out.println("getNotiBoard 실행");
			return mybatis.selectOne("NotiBoardDAO.getNotiBoard", nvo);
		}
		
		//게시글 수 전체 수량 조회
	 	public NotiBoardVO selectNotiBoardTotal(NotiBoardVO nvo) {
	 		System.out.println("selectNotiBoardTotal 실행");
	 		return mybatis.selectOne("NotiBoardDAO.selectNotiBoardTotal", nvo);
	 	}
}
