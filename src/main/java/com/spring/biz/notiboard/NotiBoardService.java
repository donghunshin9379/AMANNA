package com.spring.biz.notiboard;

import java.util.List;



public interface NotiBoardService {
	
	List<NotiBoardVO> getNotiBoardList(NotiBoardVO nvo);
	NotiBoardVO getNotiBoard(NotiBoardVO nvo);
	void insertNotiBoard(NotiBoardVO nvo); 
	void updateNotiBoard(NotiBoardVO nvo);
	void deleteNotiBoard(NotiBoardVO nvo);
	
	NotiBoardVO selectNotiBoardTotal(NotiBoardVO nvo);
}
