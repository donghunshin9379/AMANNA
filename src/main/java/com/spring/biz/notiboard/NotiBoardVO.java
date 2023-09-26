package com.spring.biz.notiboard;

import java.sql.Date;

public class NotiBoardVO {
	private String title;
	private String content;
	private int notino;
	private Date notiDate;
	
	//페이징 처리
 	private int total;
	private int viewPage = 1;
	private int startIndex = 1;
	private int endIndex = 10;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNotino() {
		return notino;
	}
	public void setNotino(int notino) {
		this.notino = notino;
	}
	public Date getNotiDate() {
		return notiDate;
	}
	public void setNotiDate(Date notiDate) {
		this.notiDate = notiDate;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getViewPage() {
		return viewPage;
	}
	public void setViewPage(int viewPage) {
		this.viewPage = viewPage;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	@Override
	public String toString() {
		return "NotiBoardVO [title=" + title + ", content=" + content + ", notino=" + notino + ", notiDate=" + notiDate
				+ ", total=" + total + ", viewPage=" + viewPage + ", startIndex=" + startIndex + ", endIndex="
				+ endIndex + "]";
	}
	
	

	
	
}
