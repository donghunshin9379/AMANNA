package com.spring.biz.faqboard;

public class FaqBoardVO {
	private String category, title, content;
	private int faqno;
	//페이징 처리
 	private int total;
	private int viewPage = 1;
	private int startIndex = 1;
	private int endIndex = 10;
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
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
	public int getFaqno() {
		return faqno;
	}
	public void setFaqno(int faqno) {
		this.faqno = faqno;
	}
	@Override
	public String toString() {
		return "FaqBoardVO [category=" + category + ", title=" + title + ", content=" + content + ", faqno=" + faqno
				+ ", total=" + total + ", viewPage=" + viewPage + ", startIndex=" + startIndex + ", endIndex="
				+ endIndex + "]";
	}
	
	
}
