// 김민선
package com.dutyfree.dto;

import java.sql.Timestamp;

public class OrderVO {

   // 오더 넘버
   private int oNo;
   // 오더 디테일 넘버
   private int odNo;
   // 회원 번호
   private int mNo;
   // 회원 아이디
   private String mId;
   // 상품 번호
   private int pNo;
   // 상품 이름
   private String pName;
   // 상품 가격
   private int pPrice;
   // 할인된 상품 가격
   private int pPricedc;
   // 상품 원화 가격
   private int pPricewon;
   // 상품 할인율
   private int pDiscount;
   // 오더에 담긴 상품 수량
   private int odAmount;
   // 주문한 날짜
   private Timestamp oDate;
   // 주문 배송
   private String oShipping;
   // 상품 사진
   private String pImage;
   // 상품 디테일
   private String pDetail;
   // 상품 브랜드
   private String pBrand;




   public String getpBrand() {
      return pBrand;
   }

   public void setpBrand(String pBrand) {
      this.pBrand = pBrand;
   }

   public int getoNo() {
      return oNo;
   }

   public void setoNo(int oNo) {
      this.oNo = oNo;
   }

   public int getodNo() {
      return odNo;
   }

   public void setodNo(int odNo) {
      this.odNo = odNo;
   }

   public int getmNo() {
      return mNo;
   }

   public void setmNo(int mNo) {
      this.mNo = mNo;
   }

   public String getmId() {
      return mId;
   }

   public void setmId(String mId) {
      this.mId = mId;
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

   public int getpPrice() {
      return pPrice;
   }

   public void setpPrice(int pPrice) {
      this.pPrice = pPrice;
   }

   public int getpPricedc() {
      return pPricedc;
   }

   public void setpPricedc(int pPricedc) {
      this.pPricedc = pPricedc;
   }

   public int getpPricewon() {
      return pPricewon;
   }

   public void setpPricewon(int pPricewon) {
      this.pPricewon = pPricewon;
   }
   
   public int getpDiscount() {
      return pDiscount;
   }

   public void setpDiscount(int pDiscount) {
      this.pDiscount = pDiscount;
   }

   public int getOdAmount() {
      return odAmount;
   }

   public void setOdAmount(int odAmount) {
      this.odAmount = odAmount;
   }

   public Timestamp getoDate() {
      return oDate;
   }

   public void setoDate(Timestamp oDate) {
      this.oDate = oDate;
   }

   public String getoShipping() {
      return oShipping;
   }

   public void setoShipping(String oShipping) {
      this.oShipping = oShipping;
   }


   public String getpImage() {
      return pImage;
   }

   public void setpImage(String pImage) {
      this.pImage = pImage;
   }

   public String getpDetail() {
      return pDetail;
   }

   public void setpDetail(String pDetail) {
      this.pDetail = pDetail;
   }
//   @Override
//   public String toString() {
//      return "OrderVO [ oNo=" + oNo + ", odNo=" + odNo + ", mNo=" + mNo + ", pNo=" + pNo + ", pName=" + pName
//            + ", pPrice=" + pPrice + ", pPricedc=" + pPricedc + ",pPricewon=" + pPricewon + ",pDiscount=" + pDiscount + ", odAmount=" + odAmount + ", oDate=" + oDate
//            + ", oShipping=" + oShipping + ",pImage=" + pImage + ",pDetail=" + pDetail + ",pBrand=" + pBrand + "]";
//   }

}