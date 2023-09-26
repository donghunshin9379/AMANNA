package com.spring.biz.rboard;

import org.springframework.web.multipart.MultipartFile;

public class RBoardVO {
    private int rNo;
    private String id;
    private String rTitle;
    private String rContent;
    private String rDate;
    private MultipartFile uploadFile; // 파일 업로드를 위한 MultipartFile 필드
    private String uploadFile1; // 파일 업로드를 위한 MultipartFile 필드
    private int count;

    // 페이징 처리
    private int total;
    private int viewPage = 1;
    private int startIndex = 1;
    private int endIndex = 10;
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getrTitle() {
		return rTitle;
	}
	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getUploadFile1() {
		return uploadFile1;
	}
	public void setUploadFile1(String uploadFile1) {
		this.uploadFile1 = uploadFile1;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
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
		return "RBoardVO [rNo=" + rNo + ", id=" + id + ", rTitle=" + rTitle + ", rContent=" + rContent + ", rDate="
				+ rDate + ", uploadFile=" + uploadFile + ", uploadFile1=" + uploadFile1 + ", count=" + count
				+ ", total=" + total + ", viewPage=" + viewPage + ", startIndex=" + startIndex + ", endIndex="
				+ endIndex + "]";
	}

    
    
}