package com.spring.biz.board;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class BoardVO {
	private int qNo;
	private String qTitle;
	private int qPwd;
	private String qWriter;
	private String qContent;
	private String qDate;
	private String lockFlag;
	private String confirm;
	
	//페이징 처리
	 private int total;
	 private int viewPage = 1;
	 private int startIndex = 1;
	 private int endIndex = 10;
	 
	 @JsonIgnore
	private String searchCondition;
	@JsonIgnore
	private String searchKeyword;
	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public int getqPwd() {
		return qPwd;
	}
	public void setqPwd(int qPwd) {
		this.qPwd = qPwd;
	}
	public String getqWriter() {
		return qWriter;
	}
	public void setqWriter(String qWriter) {
		this.qWriter = qWriter;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public String getqDate() {
		return qDate;
	}
	public void setqDate(String qDate) {
		this.qDate = qDate;
	}
	public String getLockFlag() {
		return lockFlag;
	}
	public void setLockFlag(String lockFlag) {
		this.lockFlag = lockFlag;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
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
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	@Override
	public String toString() {
		return "BoardVO [qNo=" + qNo + ", qTitle=" + qTitle + ", qPwd=" + qPwd + ", qWriter=" + qWriter + ", qContent="
				+ qContent + ", qDate=" + qDate + ", lockFlag=" + lockFlag + ", confirm=" + confirm + ", total=" + total
				+ ", viewPage=" + viewPage + ", startIndex=" + startIndex + ", endIndex=" + endIndex
				+ ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + "]";
	}
}
