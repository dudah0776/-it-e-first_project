package com.dutyfree.dto;

import java.sql.Date;
import java.sql.Timestamp;
//박진수

//회원에 대한 VO
public class MemberVO{
	
	//회원 아이디
	private String memId;
	
	//회원 비밀번호
	private String memPw;
	
	//회원 이름
	private String memName;
	
	//회원 생년월일
	private Date memBirth;
	
	//회원가입 시간
	private Timestamp memRegDate;
	
	//회원 여권번호
	private String memPassport;
	
	//회원 휴대폰번호
	private String memPhone;
	
	//회원 성별
	private String memGender;

	public String getMemId() {
		return memId;
	}
	
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public Timestamp getMemRegDate() {
		return memRegDate;
	}
	public void setMemRegDate(Timestamp memRegDate) {
		this.memRegDate = memRegDate;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public Date getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(Date memBirth) {
		this.memBirth = memBirth;
	}
	public String getMemPassport() {
		return memPassport;
	}
	public void setMemPassport(String memPassport) {
		this.memPassport = memPassport;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	
	public String getMemGender() {
		return memGender;
	}
	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	

	
}
