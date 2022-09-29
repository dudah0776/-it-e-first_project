package com.dutyfree.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.dutyfree.dto.ProductVO;
import com.dutyfree.util.DBConnection;
import com.dutyfree.util.JDBCUtil;

import oracle.jdbc.OracleTypes;

//구영모 작성
public class ProductDAO {
   //DB를 연결하기 위한 conn변수 선언
   Connection conn = DBConnection.getConnection();
   //DBMS 저장 프로시저를 호출하기 위한 CallableStatement 선언
   CallableStatement cstmt = null;
   //결과 값을 불러오기 위한 resultset 변수 선언
   ResultSet rs = null;

   public ProductDAO() {
      // TODO Auto-generated constructor stub
   }
   //ProductDAO값을 불러오기 위한 인스턴스 선언
   private static ProductDAO instance = new ProductDAO();
   //인스턴스 값을 리턴받기 위한 메소드
   public static ProductDAO getInstance() {
      return instance;
   }
   /*
    *메인 페이지 index.jsp
    * */
   //메인 페이지의 브랜드별 할인 품복 배너에 사용되는 함수 -> 브랜드별 할인율이 가장 높은 품목을 불러오기 위한 프로시저 사용
   public ArrayList<ProductVO> BrandProduct(){
	  //각 브랜드의 할인율이 가장 높은 상품을 받아오기 위해 객체 배열 생성 
      ArrayList<ProductVO> pList = new ArrayList<>();
      //brandproduct 프로시저 불러오기
      String sql = "{call dutyfree_pkg.brandproduct(?)}";
      try {
         //DB연결
         conn = DBConnection.getConnection();
         cstmt = conn.prepareCall(sql);
         //커서값 받아오기
         cstmt.registerOutParameter(1, OracleTypes.CURSOR);
         //프로시저 실행
         cstmt.executeUpdate();
         // out파라미터 값을 rs 변수에 object 타입으로 돌려받는다 
         rs = (ResultSet) cstmt.getObject(1);
         //while문을 돌면서 오브젝트 안에 있는 값들을 하나씩 가져온다
         while(rs.next()) {
            ProductVO vo = new ProductVO();
            vo.setpNo(rs.getInt("PROD_NO"));
            vo.setpBrand(rs.getString("prod_brand"));
            vo.setpDiscount(rs.getInt("prod_discount"));
            vo.setpImage(rs.getString("prod_image"));
            vo.setpName(rs.getString("prod_name"));
            vo.setpPrice(rs.getInt("prod_price"));
            vo.setpPriceDc(rs.getInt("prod_pricedc"));
            vo.setpPriceWon(rs.getInt("prod_pricewon"));
            vo.setpNo(rs.getInt("PROD_NO"));
            //받아온 값들을 리턴할 각 ProductVO 객체리스트 안에 추가한다. 
            pList.add(vo);
         }
        //연결에 예외가 생기면 그 내용을 출력한다
      }catch(Exception e){
         e.printStackTrace();
      }finally {
    	 //자원 누수를 막기 위한 connection 해제
         JDBCUtil.close(conn);
         //자원 누수를 막기 위한 CallableStatement 해제
         JDBCUtil.close(cstmt);
         JDBCUtil.close(rs);
      }
      //객체 리스트 반환
      return pList;
   }
   /*
    *메인 페이지 index.jsp
    * */
   //메인 페이지의 럭키딜 배너에 사용되는 함수 -> 모든 품목중에 할인율이 가장 높은 품목 8개를 불러오기 위한 프로시저 사용 
   public ArrayList<ProductVO> DiscountProduct(){
	   //각 브랜드의 할인율이 가장 높은 상품을 받아오기 위해 객체 배열 생성 
      ArrayList<ProductVO> pList = new ArrayList<>();
      //brandproduct 프로시저 불러오기
      String sql = "{call dutyfree_pkg.discountproduct(?)}";
      try {
         //DB연결
         conn = DBConnection.getConnection();
         cstmt = conn.prepareCall(sql);
         //커서값 받아오기
         cstmt.registerOutParameter(1, OracleTypes.CURSOR);
         //프로시저 실행
         cstmt.executeUpdate();
         // out파라미터 값을 rs 변수에 object 타입으로 돌려받는다 
         rs = (ResultSet) cstmt.getObject(1);
         //while문을 돌면서 오브젝트 안에 있는 값들을 하나씩 가져온다
         while(rs.next()) {
            ProductVO vo = new ProductVO();
            vo.setpBrand(rs.getString("prod_brand"));
            vo.setpDiscount(rs.getInt("prod_discount"));
            vo.setpImage(rs.getString("prod_image"));
            vo.setpName(rs.getString("prod_name"));
            vo.setpPrice(rs.getInt("prod_price"));
            vo.setpPriceDc(rs.getInt("prod_pricedc"));
            vo.setpPriceWon(rs.getInt("prod_pricewon"));
            vo.setpNo(rs.getInt("PROD_NO"));
          //받아온 값들을 리턴할 각 ProductVO 객체리스트 안에 추가한다. 
            pList.add(vo);
         }
       //연결에 예외가 생기면 그 내용을 출력한다
      }catch(Exception e){
         e.printStackTrace();
      }finally {
    	//자원 누수를 막기 위한 connection 해제
         JDBCUtil.close(conn);
       //자원 누수를 막기 위한 CallableStatement 해제
         JDBCUtil.close(cstmt);
         JDBCUtil.close(rs);
      }
    //객체 리스트 반환
      return pList;
   }
   /*
    *상품 상세 페이지 product/productpage.jsp
    * */
   //상품 상세 페이지에서 사용되는 함수 -> 각 상품의 PK값으로 식별을 한 뒤에 그 상품의 정보를 얻어오기 위한 프로시저 사용
   public ProductVO getproduct(String pNo){
      //productVO 객체 생성
      ProductVO product = null;
      //인자값 2개로 getproduct 프로시저 실행
      String sql = "{call dutyfree_pkg.getproduct(?,?) }";
      try {
    	  //DB연결
         conn = DBConnection.getConnection();
         cstmt=conn.prepareCall(sql);
         //첫번째 값에 pNo 값을 넣는다.
         cstmt.setString(1, pNo);
         //2번째 값에 넣어진 pNo값에 대한 정보를 vo에 저장한다.
         cstmt.registerOutParameter(2, OracleTypes.CURSOR);
         cstmt.executeUpdate();
         rs = (ResultSet) cstmt.getObject(2);
         if (rs.next()) {
            product = new ProductVO();
            product.setpNo(rs.getInt("prod_no"));
            product.setpName(rs.getString("prod_name"));
            product.setpBrand(rs.getString("prod_brand"));
            product.setpCategory(rs.getString("prod_category"));
            product.setpPrice(rs.getInt("prod_price"));
            product.setpPriceDc(rs.getInt("prod_pricedc"));
            product.setpPriceWon(rs.getInt("prod_pricewon"));
            product.setpDiscount(rs.getInt("prod_discount"));
            product.setpStock(rs.getInt("prod_stock"));
            product.setpRegdate(rs.getTimestamp("prod_regdate"));
            product.setpImage(rs.getString("prod_image"));
            product.setpDetail(rs.getString("prod_detail"));
         }
       //연결에 예외가 생기면 그 내용을 출력한다
      }catch(Exception e){
         e.printStackTrace();
      }finally {
    	//자원 누수를 막기 위한 connection 해제
         JDBCUtil.close(conn);
       //자원 누수를 막기 위한 CallableStatement 해제
         JDBCUtil.close(cstmt);
         JDBCUtil.close(rs);
      }
      return product;
   }
   /*
    *브랜드 페이지 brand/브랜드명.jsp
    * */
   //브랜드 페이지의 상품들을 불러오기 위한 함수  -> 브랜드의 상품 전체 품목을 가져오기 위한 프로시저 사용
   public ArrayList<ProductVO> getbrandproduct(String brand){
      //productVO 객체 생성
      ArrayList<ProductVO> pList = new ArrayList<>();
      //인자값 2개로 getproduct 프로시저 실행
      String sql = "{call dutyfree_pkg.getbrandproduct(?,?) }";
      ResultSet rs = null;
      try {
    	  //DB연결
         conn = DBConnection.getConnection();
         cstmt=conn.prepareCall(sql);
         //첫번째 값에 어떤 브랜드 인지 넣는다.
         cstmt.setString(1, brand);
         //2번째 값에 넣어진 브랜드값에 대한 정보를 vo에 저장한다.
         cstmt.registerOutParameter(2, OracleTypes.CURSOR);
         cstmt.executeUpdate();
         rs = (ResultSet) cstmt.getObject(2);
         while (rs.next()) {
            ProductVO vo = new ProductVO();
            vo.setpNo(rs.getInt("prod_no"));
            vo.setpName(rs.getString("prod_name"));
            vo.setpBrand(rs.getString("prod_brand"));
            vo.setpCategory(rs.getString("prod_category"));
            vo.setpPrice(rs.getInt("prod_price"));
            vo.setpPriceDc(rs.getInt("prod_pricedc"));
            vo.setpPriceWon(rs.getInt("prod_pricewon"));
            vo.setpDiscount(rs.getInt("prod_discount"));
            vo.setpStock(rs.getInt("prod_stock"));
            vo.setpRegdate(rs.getTimestamp("prod_regdate"));
            vo.setpImage(rs.getString("prod_image"));
            vo.setpDetail(rs.getString("prod_detail"));
          //받아온 값들을 리턴할 각 ProductVO 객체리스트 안에 추가한다.
            pList.add(vo);
         }
       //연결에 예외가 생기면 그 내용을 출력한다
      }catch(Exception e){
         e.printStackTrace();
      }finally {
    	//자원 누수를 막기 위한 connection 해제
         JDBCUtil.close(conn);
       //자원 누수를 막기 위한 CallableStatement 해제
         JDBCUtil.close(cstmt);
         JDBCUtil.close(rs);
      }
      //객체 리스트 반환
      return pList;
   }
   /*
    *브랜드 페이지 brand/브랜드명.jsp
    * */
   //브랜드 페이지의 총 개수 부분에 브랜드별 상품의 총 개수가 몇개인지 나타내기 위한 함수 -> 브랜드의 상품이 총 몇개인지 가져오는 프로시저 사용 
   public int getbrandproductamount(String brand){
      //인자값 2개로 getproduct 프로시저 실행
      String sql = "{call dutyfree_pkg.getbrandproductamount(?,?) }";
      //상품들의 총 개수를 담기 위한 amount값 선언후 0으로 초기화
      int amount=0;
      try {
         conn = DBConnection.getConnection();
         cstmt=conn.prepareCall(sql);
         //첫번째 값에 개수를 구하고자하는 브랜드를 넣는다.
         cstmt.setString(1, brand);
         //2번째 값에 넣어진 브랜드값에 대한 총 개수를 저장한다. 커서값 받아오기
         cstmt.registerOutParameter(2, OracleTypes.CURSOR);
         //프로시저 실행
         cstmt.executeUpdate();
         //결과값 받아오기
         rs = (ResultSet) cstmt.getObject(2);
         if(rs.next()) {
        	//프로시저를 실행후 나온 첫번째 컬럼의 값을 총 개수에 넣는다
            amount = rs.getInt(1);
         }
       //연결에 예외가 생기면 그 내용을 출력한다
      }catch(Exception e){
         e.printStackTrace();
      }finally {
    	//자원 누수를 막기 위한 connection 해제
         JDBCUtil.close(conn);
       //자원 누수를 막기 위한 CallableStatement 해제
         JDBCUtil.close(cstmt);
         JDBCUtil.close(rs);
      }
      //총개수 반환
      return amount;
   }
   
	/*
	 * 관리자 메뉴에서 사용
	 */

	// 김가희 - 주문목록 불러오기
	public ArrayList<ProductVO> listProduct() {
		ArrayList<ProductVO> pList = new ArrayList<>();
		// 프로시저 호출문
		String sql = "{call dutyfree_pkg.prodList(?)}";
		ResultSet rs = null;
		try {
			// DB연결
			conn = DBConnection.getConnection();
			cstmt = conn.prepareCall(sql);

			// 프로시저에 인자넣기
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);

			// 프로시저 실행
			cstmt.executeUpdate();

			// out파라미터의 값을 돌려받는다.
			rs = (ResultSet) cstmt.getObject(1);

			// 상품데이터 하나하나를 vo객체에 넣고, vo들을 pList에 추가
			while (rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setpNo(rs.getInt("prod_no"));
				vo.setpName(rs.getString("prod_name"));
				vo.setpBrand(rs.getString("prod_brand"));
				vo.setpCategory(rs.getString("prod_category"));
				vo.setpPrice(rs.getInt("prod_price"));
				vo.setpDiscount(rs.getInt("prod_discount"));
				vo.setpStock(rs.getInt("prod_stock"));
				vo.setpImage(rs.getString("prod_image"));
				vo.setpRegdate(rs.getTimestamp("prod_regdate"));
				System.out.println(vo);
				pList.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
			JDBCUtil.close(rs);
		}
		return pList;

	}

	// 김가희 - 상품입고하기
	public void updateProd(int type, int pNo, int amount) {
		// 프로시저 호출문
		String sql = "{call dutyfree_pkg.prodUpdate(?,?,?)}";
		try {
			// DB연결
			conn = DBConnection.getConnection();
			cstmt = conn.prepareCall(sql);

			// 프로시저에 인자넣기
			cstmt.setInt(1, type);
			cstmt.setInt(2, pNo);
			cstmt.setInt(3, amount);

			// 프로시저 실행
			cstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
			JDBCUtil.close(rs);
		}
	}

}