package com.spring.biz.faqboard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.faqboard.FaqBoardService;
import com.spring.biz.faqboard.FaqBoardVO;

@Service("faqboardService")
public class FaqBoardServiceImpl implements FaqBoardService{
	@Autowired
	private FaqBoardDAO faqboardDAO;
	
	
	@Override
	public void insertFaqBoard(FaqBoardVO fvo) {
		System.out.println("insertFaqBoard 작동");
		faqboardDAO.insertFaqBoard(fvo);
	}

	@Override
	public void updateFaqBoard(FaqBoardVO fvo) {
		System.out.println("updateFaqBoard 작동");
		faqboardDAO.updateFaqBoard(fvo);
	}

	@Override
	public void deleteFaqBoard(FaqBoardVO fvo) {
		System.out.println("deleteFaqBoard 작동");
		faqboardDAO.deleteFaqBoard(fvo);
	}

	@Override
	public FaqBoardVO getFaqBoard(FaqBoardVO fvo) {
		System.out.println("getFaqBoard 작동");
		return faqboardDAO.getFaqBoard(fvo);
	}

	@Override
	public List<FaqBoardVO> getFaqBoardList(FaqBoardVO fvo) {
		System.out.println("getFaqBoardList 작동");
		return faqboardDAO.getFaqBoardList(fvo);
	}

	@Override
	public FaqBoardVO selectFaqBoardTotal(FaqBoardVO fvo) {
		System.out.println("selectFaqBoardTotal 작동");
		return faqboardDAO.selectFaqBoardTotal(fvo);
	}

	@Override
	public List<FaqBoardVO> selectCategory(FaqBoardVO fvo) {
		System.out.println("selectCategory 작동");
		return faqboardDAO.selectCategory(fvo);
	}

}
