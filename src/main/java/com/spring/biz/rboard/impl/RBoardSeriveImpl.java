 package com.spring.biz.rboard.impl;
 
 import java.util.List;
 
 import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.stereotype.Service;
 
 import com.spring.biz.rboard.RBoardService;
 import com.spring.biz.rboard.RBoardVO;
 
 @Service("rboardService")
 public class RBoardSeriveImpl implements RBoardService{
 	@Autowired
 	private RBoardDAO rboardDAO;
 
 	@Override
 	public List<RBoardVO> getRBoardList(RBoardVO vo) {
 		System.out.println("getRBoardList 작동");
 		return rboardDAO.getRBoardList(vo);
 	}

	@Override
	public RBoardVO selectNRBoardTotal(RBoardVO vo) {
		System.out.println("selectNRBoardTotal 작동");
		return rboardDAO.selectNRBoardTotal(vo);
	}

	@Override
	public RBoardVO getRBoard(RBoardVO vo) {
		System.out.println("getRBoard 작동");
		return rboardDAO.getRBoard(vo);
	}

	@Override
	public List<RBoardVO> getMyRBoardList(RBoardVO vo) {
		System.out.println("getMyRBoard 작동");
		return rboardDAO.getMyRBoardList(vo);
	}

	@Override
	public void insertRBoard(RBoardVO vo) {
		System.out.println("insertRBoard 작동");
		rboardDAO.insertRBoard(vo);
	}

	@Override
	public void deleteRBoard(RBoardVO vo) {
		System.out.println("deleteRBoard 작동");
		rboardDAO.deleteRBoard(vo);
	}

	@Override
	public void updateRBoard(RBoardVO vo) {
		System.out.println("updateRBoard 작동!!!!!!!");
		rboardDAO.updateRBoard(vo);
	}
	
	@Override
	public void updateCountRBoard(RBoardVO vo) {
		System.out.println("updateCountRBoard 작동");
		rboardDAO.updateCountRBoard(vo);
	}
 }
