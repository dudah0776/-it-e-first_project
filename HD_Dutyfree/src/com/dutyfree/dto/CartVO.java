// 김나형 생성
package com.dutyfree.dto;

public class CartVO {
	private int cartNo; // 장바구니 번호
	private String memId; // 회원아이디
	private int cDetailAmount; // 장바구니 상품수향
	private int pNo; // 상품번호
	private String pName; // 상품이름
	private String pBrand; // 상품브랜드
	private int pPrice; // 상품정가
	private int pDiscount; // 상품할인
	private String pImage; // 상품이미지
	private int pdc; // 할인률 적용된 달러 
	private int pwon; // 할인률 적용된 원

	public int getPdc() {
		return pdc;
	}

	public void setPdc(int pdc) {
		this.pdc = pdc;
	}

	public int getPwon() {
		return pwon;
	}

	public void setPwon(int pwon) {
		this.pwon = pwon;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public int getcDetailAmount() {
		return cDetailAmount;
	}

	public void setcDetailAmount(int cDetailAmount) {
		this.cDetailAmount = cDetailAmount;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpBrand() {
		return pBrand;
	}

	public void setpBrand(String pBrand) {
		this.pBrand = pBrand;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getpDiscount() {
		return pDiscount;
	}

	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}

	public String getpImage() {
		return pImage;
	}

	public void setpImage(String pImage) {
		this.pImage = pImage;
	}

//	@Override
//	public String toString() {
//		return "CartVO [cartNo=" + cartNo + ", memId=" + memId  + ", cDetailAmount="
//				+ cDetailAmount + ", pNo=" + pNo + ", pName=" + pName + ", pBrand=" + pBrand + ", pPrice=" + pPrice
//				+ ", pDiscount=" + pDiscount + ", pImage=" + pImage + ", pdc=" + pdc + ", pwon=" + pwon + "]";
//	}
}
