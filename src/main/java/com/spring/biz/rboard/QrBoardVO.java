package com.spring.biz.rboard;

public class QrBoardVO {
	private int rcNo;
	private int rNo;
	private String rcWriter;
	private String rcCommentDate;
	private String rcContent;
	public int getRcNo() {
		return rcNo;
	}
	public void setRcNo(int rcNo) {
		this.rcNo = rcNo;
	}
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public String getRcWriter() {
		return rcWriter;
	}
	public void setRcWriter(String rcWriter) {
		this.rcWriter = rcWriter;
	}
	public String getRcCommentDate() {
		return rcCommentDate;
	}
	public void setRcCommentDate(String rcCommentDate) {
		this.rcCommentDate = rcCommentDate;
	}
	public String getRcContent() {
		return rcContent;
	}
	public void setRcContent(String rcContent) {
		this.rcContent = rcContent;
	}
	
	@Override
	public String toString() {
		return "QrBoardVO [rcNo=" + rcNo + ", rNo=" + rNo + ", rcWriter=" + rcWriter + ", rcCommentDate="
				+ rcCommentDate + ", rcContent=" + rcContent + "]";
	}
}
