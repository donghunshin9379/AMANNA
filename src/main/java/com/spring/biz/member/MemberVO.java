package com.spring.biz.member;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
@JsonIgnoreProperties(value = { "searchCondition", "searchKeyword"})
public class MemberVO {
	
	private String id;
	private String pwd;
	private String sex;
	private String name;
	private int	age;
	private String height;
	private String weight;
	private String edu;
	private String job;
	private String smoke;
	private int pay;
	private String phone;
	private String hobby;
	private String content;
	private String email;
	private MultipartFile imgFile;
	private String imgName;
	private int ticket;
	private int totpay;
	private String address;
	private int sum;
	private int cnt;
	private int m_no;
	
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	//페이징 처리
 	private int total;
	private int viewPage = 1;
	private int startIndex = 1;
	private int endIndex = 10;
	
	//--검색조건 처리용
		@JsonIgnore
		private String searchCondition;
		@JsonIgnore
		private String searchKeyword;
	
	public int getTotal() {
		return total;
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
	public int getTotpay() {
		return totpay;
	}
	public void setTotpay(int totpay) {
		this.totpay = totpay;
	}
	public int getTicket() {
		return ticket;
	}
	public void setTicket(int ticket) {
		this.ticket = ticket;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getEdu() {
		return edu;
	}
	public void setEdu(String edu) {
		this.edu = edu;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getSmoke() {
		return smoke;
	}
	public void setSmoke(String smoke) {
		this.smoke = smoke;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	// 파일업로드 관련 -------------------
	public MultipartFile getImgFile() {
		return imgFile;
	}
	public void setImgFile(MultipartFile imgFile) {
		this.imgFile = imgFile;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pwd=" + pwd + ", sex=" + sex + ", name=" + name + ", age=" + age + ", height="
				+ height + ", weight=" + weight + ", edu=" + edu + ", job=" + job + ", smoke=" + smoke + ", pay=" + pay
				+ ", phone=" + phone + ", hobby=" + hobby + ", content=" + content + ", email=" + email + ", imgFile="
				+ imgFile + ", imgName=" + imgName + ", ticket=" + ticket + ", totpay=" + totpay + ", address="
				+ address + ", sum=" + sum + ", cnt=" + cnt + ", total=" + total + ", viewPage=" + viewPage
				+ ", startIndex=" + startIndex + ", endIndex=" + endIndex + ", searchCondition=" + searchCondition
				+ ", searchKeyword=" + searchKeyword + "]";
	}
	
	
	
	
	
	
	

}
