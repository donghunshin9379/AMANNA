package com.spring.biz.notiboard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.notiboard.NotiBoardService;
import com.spring.biz.notiboard.NotiBoardVO;
import com.spring.biz.rboard.RBoardVO;

@Service("notiBoardService")
public class NotiBoardServiceImpl implements NotiBoardService{

	@Autowired
	private NotiBoardDAO notiBoardDAO;
	
	public NotiBoardServiceImpl() {
		System.out.println(">> NotiBoardServiceImpl 실행~~");
	}
	

	@Override
	public List<NotiBoardVO> getNotiBoardList(NotiBoardVO nvo) {
		System.out.println("getNotiBoardList 작동");
		return notiBoardDAO.getNotiBoardList(nvo);
	}

	@Override
	public NotiBoardVO getNotiBoard(NotiBoardVO nvo) {
		System.out.println("getNotiBoard 작동");
		return notiBoardDAO.getNotiBoard(nvo);
	}

	@Override
	public void insertNotiBoard(NotiBoardVO nvo) {
		notiBoardDAO.insertNotiBoard(nvo);
		}


	@Override
	public void updateNotiBoard(NotiBoardVO nvo) {
		notiBoardDAO.updateNotiBoard(nvo);
		}


	@Override
	public void deleteNotiBoard(NotiBoardVO nvo) {
		notiBoardDAO.deleteNotiBoard(nvo);
		}

	@Override
	public NotiBoardVO selectNotiBoardTotal(NotiBoardVO nvo) {
		System.out.println("selectNotiBoardTotal 작동");
		return notiBoardDAO.selectNotiBoardTotal(nvo);
	}


}
