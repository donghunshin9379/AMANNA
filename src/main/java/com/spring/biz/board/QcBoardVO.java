package com.spring.biz.board;

public class QcBoardVO {
	private int qCno;
	private int qNo;
	private String qcWriter;
	private String qcCommentDate;
	private String qcContent;
	
	public int getqCno() {
		return qCno;
	}
	public void setqCno(int qCno) {
		this.qCno = qCno;
	}
	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public String getQcWriter() {
		return qcWriter;
	}
	public void setQcWriter(String qcWriter) {
		this.qcWriter = qcWriter;
	}
	public String getQcCommentDate() {
		return qcCommentDate;
	}
	public void setQcCommentDate(String qcCommentDate) {
		this.qcCommentDate = qcCommentDate;
	}
	public String getQcContent() {
		return qcContent;
	}
	public void setQcContent(String qcContent) {
		this.qcContent = qcContent;
	}
	@Override
	public String toString() {
		return "QcBoardVO [qCno=" + qCno + ", qNo=" + qNo + ", qcWriter=" + qcWriter + ", qcCommentDate="
				+ qcCommentDate + ", qcContent=" + qcContent + "]";
	}
	
	
}
