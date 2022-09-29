//김가희
package com.dutyfree.dto;

import java.sql.Timestamp;

//고객센터에 대한 vo
public class CsVO {
	//게시물 번호
	private int csNo;
	//게시물 제목
	private String csTitle;
	//게시물 작성일자
	private Timestamp csDate;
	//게시물 내용
	private String csContent;
	//게시물 답변
	private String csReply;
	//게시물 답변여부(0:답변미등록 1:답변등록)
	private String csCheck;
	//게시물 작성자
	private String memId;
	
	public int getCsNo() {
		return csNo;
	}
	public void setCsNo(int csNo) {
		this.csNo = csNo;
	}
	public String getCsTitle() {
		return csTitle;
	}
	public void setCsTitle(String csTitle) {
		this.csTitle = csTitle;
	}
	public Timestamp getCsDate() {
		return csDate;
	}
	public void setCsDate(Timestamp csDate) {
		this.csDate = csDate;
	}
	public String getCsContent() {
		return csContent;
	}
	public void setCsContent(String csContent) {
		this.csContent = csContent;
	}
	public String getCsReply() {
		return csReply;
	}
	public void setCsReply(String csReply) {
		this.csReply = csReply;
	}
	public String getCsCheck() {
		return csCheck;
	}
	public void setCsCheck(String csCheck) {
		this.csCheck = csCheck;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
//	@Override
//	public String toString() {
//		return "CsVO [csNo=" + csNo + ", csTitle=" + csTitle + ", csDate=" + csDate + ", csContent=" + csContent
//				+ ", csReply=" + csReply + ", csCheck=" + csCheck + ", memId=" + memId + "]";
//	}
		
}
