package com.spring.biz.match;

import org.springframework.web.multipart.MultipartFile;

public class MatchVO {
	private int seq;
	private String id;
	private String recId;
	private String reqId;
	private String sex;
	private String name;
	private int age;
	private String height;
	private String weight;
	private String edu;
	private String job;
	private String smoke;
	private int pay;
	private String phone;
	private String hobby;
	private String content;
	private String progress;
	private String email;
	private MultipartFile imgFile;
	private String imgName;
	private int ticket;
	private int totpay;
	private String address;
	public MatchVO() {
			System.out.println("MatchVO() 객체 생성~");
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public MultipartFile getImgFile() {
		return imgFile;
	}

	public void setImgFile(MultipartFile imgFile) {
		this.imgFile = imgFile;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public int getTicket() {
		return ticket;
	}

	public void setTicket(int ticket) {
		this.ticket = ticket;
	}

	public int getTotpay() {
		return totpay;
	}

	public void setTotpay(int totpay) {
		this.totpay = totpay;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getReqId() {
		return reqId;
	}

	public void setReqId(String reqId) {
		this.reqId = reqId;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
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

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRecId() {
		return recId;
	}
	public void setRecId(String recId) {
		this.recId = recId;
	}

	@Override
	public String toString() {
		return "MatchVO [seq=" + seq + ", id=" + id + ", recId=" + recId + ", reqId=" + reqId + ", sex=" + sex
				+ ", name=" + name + ", age=" + age + ", height=" + height + ", weight=" + weight + ", edu=" + edu
				+ ", job=" + job + ", smoke=" + smoke + ", pay=" + pay + ", phone=" + phone + ", hobby=" + hobby
				+ ", content=" + content + ", progress=" + progress + ", email=" + email + ", imgFile=" + imgFile
				+ ", imgName=" + imgName + ", ticket=" + ticket + ", totpay=" + totpay + ", address=" + address + "]";
	}
	
	
}
