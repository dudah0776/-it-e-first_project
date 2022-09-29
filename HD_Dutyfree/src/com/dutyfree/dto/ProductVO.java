package com.dutyfree.dto;

import java.sql.Timestamp;
//구영모 작성
public class ProductVO {
	//상품 번호 pk값을 가진다
   private int pNo;
   //상품 이름
   private String pName;
   //상품의 브랜드
   private String pBrand;
   //상품의 카테고리 ex)fashion, hair,...
   private String pCategory;
   //상품의 가격(원가) $(달러)로 표시
   private int pPrice;
   //상품의 할인가 $(달러)로 표시
   private int pPriceDc;
   //상품의 할인가를 Won(원화)로 표시
   private int pPriceWon;
   //상품의 할인율
   private int pDiscount;
   //상품의 재고량
   private int pStock;
   //상품의 등록 날짜
   private Timestamp pRegdate;
   //상품의 이미지 경로
   private String pImage;
   //상품의 상세 설명
   private String pDetail;
   
   //상품 번호를 가져오기 위한 getter메소드
   public int getpNo() {
      return pNo;
   }
   //상품 번호를 변경하기 위한 setter메소드
   public void setpNo(int pNo) {
      this.pNo = pNo;
   }
   //상품 이름을 가져오기 위한 getter메소드
   public String getpName() {
      return pName;
   }
   //상품의 이름을 변경하기 위한 setter메소드
   public void setpName(String pName) {
      this.pName = pName;
   }
   //상품 브랜드를 가져오기 위한 getter메소드
   public String getpBrand() {
      return pBrand;
   }
   //상품의 브랜드를 변경하기 위한 setter메소드
   public void setpBrand(String pBrand) {
      this.pBrand = pBrand;
   }
   //상품의 카테고리를 가져오기 위한 getter메소드
   public String getpCategory() {
      return pCategory;
   }
   //상품의 카테고리를 변경하기 위한 setter메소드
   public void setpCategory(String pCategory) {
      this.pCategory = pCategory;
   }
   //상품의 가격을 가져오기 위한 getter메소드
   public int getpPrice() {
      return pPrice;
   }
   //상품의 가격을 변경하기 위한 setter메소드
   public void setpPrice(int pPrice) {
      this.pPrice = pPrice;
   }
   //상품의 할인율을 가져오기 위한 getter메소드
   public int getpDiscount() {
      return pDiscount;
   }
   //상품의 할인율을 변경하기 위한 setter메소드
   public void setpDiscount(int pDiscount) {
      this.pDiscount = pDiscount;
   }
   //상품의 수량을 가져오기 위한 getter메소드
   public int getpStock() {
      return pStock;
   }
   //상품의 수량을 변경하기 위한 setter메소드
   public void setpStock(int pStock) {
      this.pStock = pStock;
   }
   //상품의 등록 날짜를 가져오기 위한 getter메소드
   public Timestamp getpRegdate() {
      return pRegdate;
   }
   //상품의 등록 날짜를 변경하기 위한 setter메소드
   public void setpRegdate(Timestamp pRegdate) {
      this.pRegdate = pRegdate;
   }
   //상품의 이미지 경로를 가져오기 위한 getter메소드
   public String getpImage() {
      return pImage;
   }
   //상품의 이미지 경로를 변경하기 위한 setter메소드
   public void setpImage(String pImage) {
      this.pImage = pImage;
   }
   //상품의 상세 정보를 가져오기 위한 getter메소드
   public String getpDetail() {
      return pDetail;
   }
   //상품의 변경하기 위한 setter메소드
   public void setpDetail(String pDetail) {
      this.pDetail = pDetail;
   }
   //상품의 할인가를 가져오기 위한 getter메소드
   public int getpPriceDc() {
      return pPriceDc;
   }
   //상품의 할인가를 변경하기 위한 setter메소드
   public void setpPriceDc(int pPriceDc) {
      this.pPriceDc = pPriceDc;
   }
   //상품의 할인가를 원화로 바꾼것을 가져오기 위한 getter메소드
   public int getpPriceWon() {
      return pPriceWon;
   }
   //상품의 할인가를 원화로 바꾼것을 변경하기 위한 setter메소드
   public void setpPriceWon(int pPriceWon) {
      this.pPriceWon = pPriceWon;
   }
//   @Override
//   public String toString() {
//      return "ProductVO [pNo=" + pNo + ", pName=" + pName + ", pBrand=" + pBrand + ", pCategory=" + pCategory
//            + ", pPrice=" + pPrice + ", pDiscount=" + pDiscount + ", pStock=" + pStock + ", pRegdate=" + pRegdate
//            + ", pImage=" + pImage + ", pDetail=" + pDetail + "]";
//   }   
}